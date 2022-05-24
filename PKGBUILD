# Maintainer: Essem <smswessem@gmail.com>

pkgname=furnace-git
pkgver=dev97.r25.g8ea60f37
pkgrel=1
pkgdesc="A multi-system chiptune tracker compatible with DefleMask modules"
url="https://github.com/tildearrow/furnace"
depends=('sdl2' 'libsndfile' 'fmt' 'hicolor-icon-theme' 'alsa-lib')
makedepends=('git' 'cmake')
provides=('furnace')
arch=('x86_64')
license=('GPL')
source=(
  "git+https://github.com/tildearrow/furnace.git"
  "git+https://github.com/ocornut/imgui.git"
  "gcc12.patch"
)
sha256sums=('SKIP' 'SKIP' '58c3201bc0608db13c3c3ceb365176b845b3606d7806a7d62ceba3355e1f073e')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  git submodule update --init
  patch --forward --strip=1 --input="${srcdir}/gcc12.patch"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DSYSTEM_FMT=ON -DSYSTEM_ZLIB=ON -DSYSTEM_LIBSNDFILE=ON -DSYSTEM_SDL2=ON -DWITH_JACK=OFF ..
  cmake --build . -j $(nproc)
}

package() {
    cd "$srcdir/${pkgname%-git}"
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 -T res/icon.iconset/icon_16x16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/${pkgname%-git}.png"
    install -Dm644 -T res/icon.iconset/icon_32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/${pkgname%-git}.png"
    install -Dm644 -T res/icon.iconset/icon_64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/${pkgname%-git}.png"
    install -Dm644 -T res/icon.iconset/icon_128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/${pkgname%-git}.png"
    install -Dm644 -T res/icon.iconset/icon_256x256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"
    install -Dm644 -T res/icon.iconset/icon_512x512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname%-git}.png"
}
