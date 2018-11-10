# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>

pkgname=hashcat-git
pkgver=5.0.0+52+g2aff01b2
pkgrel=1
pkgdesc='Multithreaded advanced password recovery utility'
url='https://hashcat.net/hashcat'
arch=('x86_64')
depends=('ocl-icd' 'xxhash')
makedepends=('git' 'opencl-headers')
license=('MIT')
provides=('hashcat' 'libhashcat.so')
conflicts=('hashcat')
source=(${pkgname}::git+https://github.com/hashcat/hashcat)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags|sed -r 's|v?(.+)|\1|'|sed 's|-|+|g'
}

build() {
  cd ${pkgname}
  rm -rf deps/{OpenCL-Headers,xxHash}
  make \
    PREFIX=/usr \
    SHARED=1 \
    USE_SYSTEM_XXHASH=1 \
    USE_SYSTEM_OPENCL=1
}

package() {
  cd ${pkgname}
  make \
    DESTDIR="${pkgdir}" \
    PREFIX=/usr \
    SHARED=1 \
    USE_SYSTEM_XXHASH=1 \
    USE_SYSTEM_OPENCL=1 \
    install
  install -Dm 644 docs/license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
