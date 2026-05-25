# Maintainer: Evilleader <evilleader91@gmail.com>
_pkgname=low_latency_layer
pkgname=vulkan-low-latency-layer-bin
pkgver=0.1.0 # This is a placeholder; GitHub will automatically overwrite this!
pkgrel=1
pkgdesc="Vulkan layer for hardware agnostic input latency reduction (Tracks stable releases)"
arch=('x86_64' 'aarch64')
url="https://github.com/Korthos-Software/low_latency_layer"
license=('MIT')
depends=('glibc' 'gcc-libs' 'vulkan-loader')
makedepends=('git' 'cmake' 'vulkan-headers' 'vulkan-utility-libraries')
provides=('vulkan-low-latency-layer')
conflicts=('vulkan-low-latency-layer')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  # Force git to fetch the live, up-to-date tags from GitHub before checking
  git fetch --tags
  git describe --tags --abbrev=0 | sed 's/^v//'
}

build() {
  cd "${_pkgname}"
  # Safely check out the exact release version found by pkgver()
  git checkout "v${pkgver}"
  
  cmake -B ../build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build ../build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
