# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=dav1d
pkgname=lib32-$_pkgbasename
pkgver=0.5.2
pkgrel=1
pkgdesc='AV1 cross-platform decoder focused on speed and correctness (32 bit)'
url='https://code.videolan.org/videolan/dav1d/'
arch=('x86_64')
license=('BSD')
depends=(
      "$_pkgbasename"
      'lib32-glibc'
      'lib32-sdl2'
      'lib32-libplacebo'
      'lib32-vulkan-icd-loader'
      )
makedepends=(
      'meson'
      'meson-cross-x86-linux-gnu'
      'ninja'
      'nasm'
      'doxygen'
      'vulkan-headers'
      )
provides=('libdav1d.so')
source=(https://downloads.videolan.org/pub/videolan/${_pkgbasename}/${pkgver}/${_pkgbasename}-${pkgver}.tar.xz{,.asc})
sha512sums=('255e592256e47305921f8331f3ea7f9792e2c62b981f62a0ee05a342c3c1073ef4b469092252442c9d67294c0d69b03c127a49a73519aee0e37ab6d89e3000c3'
            'SKIP')
validpgpkeys=('65F7C6B4206BD057A7EB73787180713BE58D1ADC') # VideoLAN Release Signing Key

prepare() {
  cd ${_pkgbasename}-${pkgver}

  # Patching if needed
}

build() {
  cd ${_pkgbasename}-${pkgver}
  arch-meson build \
    --cross-file x86-linux-gnu \
    --libdir=/usr/lib32

  ninja -C build
}

check() {
  cd ${_pkgbasename}-${pkgver}/build
  meson test
}

package() {
  cd ${_pkgbasename}-${pkgver}

  DESTDIR="${pkgdir}" ninja -C build install
  rm -rf "$pkgdir"/usr/{include,share,bin}
}
