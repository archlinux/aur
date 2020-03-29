# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=dav1d
pkgname=lib32-$_pkgbasename
pkgver=0.6.0
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
sha512sums=('aeee206806642188839602c7040340052d8cff2168fd142516499da1718c497b3b6b45f96af2d543a0db8ef5d26acece6ac9bb6c6e00316fa222a2ea0554581c'
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
