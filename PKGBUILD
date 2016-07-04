# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>

pkgname=hashcat-git
pkgver=3.00.1210.30919d4
pkgrel=1
pkgdesc='A multithreaded cross platform hash cracker'
url='https://hashcat.net/hashcat'
arch=('i686' 'x86_64')
depends=('gmp' 'libcl')
optdepends=('libxnvctrl: NVIDIA X driver configuration support'
            'opencl-nvidia: OpenCL support for NVIDIA'
            'opencl-mesa: OpenCL support for AMD/ATI Radeon mesa drivers')
makedepends=('git' 'opencl-headers')
license=('MIT')
provides=('hashcat')
conflicts=('hashcat')
source=(${pkgname}::git+https://github.com/hashcat/hashcat
        makefile.patch)
sha512sums=('SKIP'
            'be389cce5f325437b965c755819c09d6b997c534caebd74a947659f8d950e9b3cee365c993928c5522188e53412156eb64218dd844952125de96e7b764716a7d')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" \
    "$(git describe --tags --abbrev=0|sed -r 's|v?(.+)|\1|'|tr '-' '.')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  patch -p1 < "${srcdir}/makefile.patch"
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
