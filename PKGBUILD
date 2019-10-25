# Maintainer: TH Campbell (dysphoria) <thcampbell (at) protonmail (dot) com>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jamie Nguyen <jamie AT tomoyolinux.co.uk>

pkgname=tomoyo-tools-25
_pkgname=tomoyo-tools
_file=53357
_basever=2.5.0
_timestamp=20170102
pkgver=${_basever}.${_timestamp}
pkgrel=2
pkgdesc='TOMOYO Linux 2.5.x userspace tools for Linux kernel 3.5 to 5.1'
arch=('x86_64')
url='https://tomoyo.osdn.jp'
#url='http://sourceforge.jp/projects/tomoyo/releases/?package_id=9818'
license=('GPL')
depends=('ncurses>=6.0')
optdepends=('linux-lts: TOMOYO Linux enabled kernel')
conflicts=('tomoyo-tools')
replaces=('tomoyo-tools<2.6')
install=tomoyo-tools.install
source=(
        "https://jaist.dl.osdn.jp/tomoyo/${_file}/${_pkgname}-${_basever}-${_timestamp}.tar.gz"{,.asc}
        'tomoyo-tools.install'
        'tomoyo-auditd.service'
       )
sha256sums=('00fedfac5e514321250bbe69eaccc732c8a8158596f77a785c2e3ae9f9968283'
            'SKIP'
            '733cec41707f27abaf2da3bfc66a40fa02c5da539dd0352a1f497e5fabd6311c'
            'faf16938762902a73e50fdaa82d17c0fe13ef3c305508b55fa2cc64bacf998dd')
validpgpkeys=(
              '43C83369623D7AD3A96C2FC7425F128D0C64F52A' # Tetsuo Handa
             )

prepare() {
        cd "${srcdir}/${_pkgname}"
        sed -i \
                -e 's|usr/sbin|usr/bin|g' \
                -e 's|sbin|usr/bin|g' \
                usr_lib_tomoyo/init_policy.c
}

build() {
        cd "${srcdir}/${_pkgname}"
        make USRSBINDIR=/usr/bin SBINDIR=/usr/bin
}

package() {
        cd "${srcdir}/${_pkgname}"

        _unitdir="$(pkg-config --variable=systemdsystemunitdir systemd)"

        make USRSBINDIR=/usr/bin SBINDIR=/usr/bin INSTALLDIR="${pkgdir}" install
        install -Dm644 "${srcdir}/tomoyo-auditd.service" \
                "${pkgdir}/${_unitdir}/tomoyo-auditd.service"
}

