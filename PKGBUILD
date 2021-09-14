# Maintainer: TH Campbell (dysphoria) <thcampbell (at) protonmail (dot) com>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jamie Nguyen <jamie AT tomoyolinux.co.uk>

pkgname=tomoyo-tools
_file=70710
_basever=2.6.1
_timestamp=20210910
pkgver=${_basever}.${_timestamp}
pkgrel=1
pkgdesc='TOMOYO Linux 2.6.x userspace tools for Linux kernel 5.1 and later'
arch=('x86_64')
url='https://tomoyo.osdn.jp'
license=('GPL')
depends=('ncurses>=6.0')
optdepends=('linux: TOMOYO Linux enabled kernel')

install=tomoyo-tools.install
source=(
        "https://jaist.dl.osdn.jp/tomoyo/${_file}/${pkgname}-${_basever}-${_timestamp}.tar.gz"{,.asc}
        'tomoyo-tools.install'
        'tomoyo-auditd.service'
       )
sha256sums=('47a12cdb1fe7bbd0b2e3486150fe1e754fa9c869aeefd42fd311c4022b78010a'
            'SKIP'
            'b5a1b4508f7c0430f73d0977ad496fae686679201c8779843b56c308d295ab21'
            'faf16938762902a73e50fdaa82d17c0fe13ef3c305508b55fa2cc64bacf998dd')
validpgpkeys=(
              '43C83369623D7AD3A96C2FC7425F128D0C64F52A' # Tetsuo Handa
             )

prepare() {
        cd "${srcdir}/${pkgname}"
        sed -i \
                -e 's|usr/sbin|usr/bin|g' \
                -e 's|sbin|usr/bin|g' \
                usr_lib_tomoyo/init_policy.c
}

build() {
        cd "${srcdir}/${pkgname}"
        make USRSBINDIR=/usr/bin SBINDIR=/usr/bin
}

package() {
        cd "${srcdir}/${pkgname}"

        make USRSBINDIR=/usr/bin SBINDIR=/usr/bin INSTALLDIR="${pkgdir}" install
        install -Dm644 "${srcdir}/tomoyo-auditd.service" \
                "${pkgdir}/usr/lib/systemd/system/tomoyo-auditd.service"
}

