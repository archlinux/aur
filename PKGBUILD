# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=dav1d
pkgname=lib32-$_pkgbasename
pkgver=0.4.0
pkgrel=2
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
      'ninja'
      'nasm'
      'doxygen'
      'vulkan-headers'
      )
provides=('libdav1d.so')
source=(https://downloads.videolan.org/pub/videolan/${_pkgbasename}/${pkgver}/${_pkgbasename}-${pkgver}.tar.xz{,.asc})
sha512sums=('8ed44b3d747f01b87b34f86fada824dfb7f86c16168af641fe754c767af5714e9fe212b6eea2bc11b5b041460184c78f755e10d4947e46bc70d95e1bd750f79d'
            'SKIP')
validpgpkeys=('65F7C6B4206BD057A7EB73787180713BE58D1ADC') # VideoLAN Release Signing Key

prepare() {
  cd ${_pkgbasename}-${pkgver}

  # Patching if needed
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgbasename}-${pkgver}
  arch-meson build \
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
