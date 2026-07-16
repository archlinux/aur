# Maintainer: Evilleader evilleader91@gmail.com
_pkgname=low_latency_layer
pkgname=vulkan-low-latency-layer-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Vulkan layer for hardware agnostic input latency reduction (Reflex & Anti-Lag 2 on any GPU)"
arch=('x86_64' 'aarch64')
url="https://github.com/Korthos-Software/low_latency_layer"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cmake' 'vulkan-headers' 'vulkan-utility-libraries')
provides=('vulkan-low-latency-layer')
conflicts=('vulkan-low-latency-layer')
# GitHub generates a tarball for every tag -- this gives us a real immutable
# file to hash rather than a live git clone that must always be SKIP.
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# Computed automatically on every deploy by `updpkgsums: true` in deploy.yml.
sha256sums=('197cce2253372b663f8319fe479cc95790a55aa20e87cfb5018ca350f5df735a')
build() {
  # GitHub tarballs extract to reponame-version/, not reponame/
  cd "${_pkgname}-${pkgver}"

  cmake -B ../build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build ../build
}
package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
