# Contributor: Jorge Pizarro-Callejas (aka jorgicio) <jpizarrocallejas@gmail.com>

pkgname=libvmaf-compat
_distname=vmaf
pkgver=2.3.1
pkgrel=2
pkgdesc='Perceptual video quality assessment library (legacy v2.x API)'
arch=('x86_64')
url='https://github.com/Netflix/vmaf/'
license=('BSD-2-Clause-Patent')
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  'meson'
  'nasm'
  'ninja'
)
conflicts=(
  'vmaf>=2'
  'vmaf<3'
)
source=("https://github.com/Netflix/vmaf/archive/v${pkgver}/${_distname}-${pkgver}.tar.gz")
sha256sums=('8d60b1ddab043ada25ff11ced821da6e0c37fd7730dd81c24f1fc12be7293ef2')

prepare() {
  echo "Configuring to disable building the vmaf executable (from 'tools' dir)..."
  sed -e "/subdir('tools')/d" \
      -i "${_distname}-${pkgver}/libvmaf/meson.build"
  echo "Done."

  echo "Configuring to disable model test because we won't build the models..."
  sed -e "/test('test_model',/d" \
      -e "/test('test_predict',/d" \
      -i "${_distname}-${pkgver}/libvmaf/test/meson.build"
  echo "Done."

  arch-meson \
    --auto-features disabled \
    -Denable_docs=false \
    -Denable_avx512=false \
    -Dbuilt_in_models=false \
    "${_distname}-${pkgver}/libvmaf/build" "${_distname}-${pkgver}/libvmaf"
}

build() {
  ninja -v -C "${_distname}-${pkgver}/libvmaf/build"
}

check() {
  ninja -v -C "${_distname}-${pkgver}/libvmaf/build" test
}

package() {
  DESTDIR="$pkgdir" ninja -v -C "${_distname}-${pkgver}/libvmaf/build" install
  rm -rf "$pkgdir"/usr/{include,bin}
  rm -rf "$pkgdir"/usr/lib/{libvmaf.so,pkgconfig,libvmaf.a}
  install -D -m644 "${_distname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
