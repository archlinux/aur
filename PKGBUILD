# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash
pkgname=openpnp-capture
pkgver=0.0.30
pkgrel=2
pkgdesc="A cross platform video capture library with a focus on machine vision."
arch=('x86_64')
url="https://github.com/openpnp/openpnp-capture"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'libjpeg-turbo')
makedepends=('cmake' 'gcc' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openpnp/openpnp-capture/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3a91e972ba7815ed2336a85a4f9f7b494ab02446dc907ab1f724ccded5bacdbef636ff929f880bd12c61470fb6237ecf1d06ea7700a2e086c4bd208ca76c1e52')
b2sums=('ae282843fcc1cf23652dd4d157f072463a19d9d776d28999ed6d6d27e58be08a530b4b39ae72809266c2369be46705f2b397f820216a8c484def13d16bca06b5')

prepare() {
  cd "$srcdir/$pkgname-$pkgver" || exit
  # We need to remove the forced -O3 -march=native if we want to build this as a package
  # Users can still set their flags in makepkg.conf as usual.
  sed -i -e '/-march=native/d' -e '/add_subdirectory(linux\/tests)/d' CMakeLists.txt
}

build() {
  cmake -S "${srcdir}/${pkgname}-${pkgver}" \
    -B "${srcdir}/build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOPENPNP_CAPTURE_LIB_VERSION="$pkgver" \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.15 \
    -G Ninja
  cmake --build "${srcdir}/build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "${srcdir}/build"
  mv "${pkgdir}/usr/lib/cmake/openpnp-capture/openpnp-capture.cmake" \
    "${pkgdir}/usr/lib/cmake/openpnp-capture/openpnp-captureConfig.cmake"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
