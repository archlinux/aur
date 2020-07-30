# Maintainer: Andrew Whatson <whatson@gmail.com>

_pkgname=faudio
pkgname=${_pkgname}-git
pkgver=20.07.r11.g74b38f7
pkgrel=3
pkgdesc="XAudio2 reimplementation"
arch=(x86_64)
url="https://github.com/FNA-XNA/FAudio/"
license=('custom:zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('sdl2' 'gstreamer' 'gst-plugins-base-libs')
makedepends=('git' 'cmake')
source=('git+https://github.com/FNA-XNA/FAudio'
        'faudio.pc')
sha256sums=('SKIP'
            'f818d65ac8bb142593d87efca3585b0ec9688e79fbed2b5b9ca8c59beb283e7a')

pkgver() {
  cd FAudio
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../FAudio \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DGSTREAMER=ON
  make
}

package() {
  DESTDIR="$pkgdir" make -C build install

  install -Dm644 FAudio/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 faudio.pc "$pkgdir"/usr/lib/pkgconfig/faudio.pc
}
