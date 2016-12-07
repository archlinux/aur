# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>

pkgname=hashcat-git
pkgver=3.20.2949.2039e2c
pkgrel=1
pkgdesc='Multithreaded advanced password recovery utility'
url='https://hashcat.net/hashcat'
arch=('i686' 'x86_64')
depends=('gmp' 'opencl-icd-loader')
optdepends=('libxnvctrl: NVIDIA X driver configuration support')
makedepends=('git' 'opencl-headers')
license=('MIT')
provides=('hashcat')
conflicts=('hashcat')
source=(${pkgname}::git+https://github.com/hashcat/hashcat
        fix-make-flags.patch)
sha512sums=('SKIP'
            '04d86c0480c221f3e781534b0a9a50950a376a8c798ebee8042446f5d2e11f78677f7c670deb5f132fcf38c962ea13c64ac522e2a18712efbad559a5077dc211')

prepare() {
  cd ${pkgname}
  patch -p1 < "${srcdir}/fix-make-flags.patch"
}

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" \
    "$(git describe --tags --abbrev=0|sed -r 's|v?(.+)|\1|'|tr '-' '.')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  make PREFIX=/usr
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm 644 docs/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
