# Maintainer: backspac
# Contributor: TH Campbell (dysphoria) <thcampbell (at) protonmail (dot) com>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jamie Nguyen <jamie AT tomoyolinux.co.uk>

pkgname=tomoyo-tools
_majorver=2
_minorver=6
_patchver=1
_basever="${_majorver}.${_minorver}.${_patchver}"
_timestamp=20250707
pkgver="${_basever}.${_timestamp}"
pkgrel=1
pkgdesc='TOMOYO Linux 2.6.x userspace tools for Linux kernel 5.1 and later'
arch=('x86_64')
url='https://sourceforge.net/projects/tomoyo/'
license=('GPL-2.0-only')
depends=(
         'glibc'
         'ncurses>=6.0'
        )
optdepends=('linux: TOMOYO Linux enabled kernel')

install=tomoyo-tools.install
source=(
        "https://sourceforge.net/projects/tomoyo/files/${pkgname}/${_majorver}.${_minorver}/${pkgname}-${_basever}-${_timestamp}.tar.gz"{,.asc}
        'tomoyo-tools.install'
        'tomoyo-auditd.service'
       )
# SourceForge only provides sha1 and md5 checksums. No author-provided checksums were found.
sha1sums=(
          'a5c16798072178ee988e64c70c32eac5d80895cc'
          '399e50dac08800f41cc06df84f215d9babf129a6'
          'SKIP'
          'SKIP'
         )
b2sums=(
        'SKIP'
        'SKIP'
        '1ab6907adad348e86c5864eb67db7daf7896094aa964fd1cce598edcaaba5d31d87dd8a233e27f95d0c863223f11d94cf549b8fba815be5f3223424a7b8b0135'
        '34535df02ff1f9544646f114b5b0d8fdd67cc498ebf40f3a8a75db59c49d9d4ceb7568886c3e48f8b1c0a1f4fa1aff036a86e56882fb0094b2c8d6aef50d657d'
       )
validpgpkeys=(
              '43C83369623D7AD3A96C2FC7425F128D0C64F52A' # Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
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

