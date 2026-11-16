# ByteWheel eReader — AUR package (git master)
# Built without MuPDF (MIT build). See packaging/aur/README.md for publishing.
pkgname=epub-byter-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Cross-platform eReader: multi-book EPUB library, terminal reader and SDL2 GUI (from git)'
arch=('x86_64' 'aarch64')
url='https://github.com/Bytewheel/epub-byter'
license=('MIT')
depends=(
  'glibc'
  'libxml2'
  'libsixel'
  'libzip'
  'sdl2'
  'sdl2_image'
  'sdl2_ttf'
  'zlib'
)
makedepends=('cmake' 'git')
provides=('epub-byter')
conflicts=('epub-byter' 'epub-byter-bin')
source=('git+https://github.com/Bytewheel/epub-byter.git')
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -S "${pkgname%-git}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBYTEWHEEL_ENABLE_GUI=ON \
    -DBYTEWHEEL_ENABLE_SIXEL=ON \
    -DBYTEWHEEL_ENABLE_MUPDF=OFF
  cmake --build build --parallel
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "${pkgname%-git}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 "${pkgname%-git}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
