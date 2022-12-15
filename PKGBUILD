# Maintainer: Essem <smswessem@gmail.com>

pkgname=furnace-git
pkgver=dev129.r101.g4566068a
pkgrel=1
pkgdesc="A multi-system chiptune tracker compatible with DefleMask modules"
url="https://github.com/tildearrow/furnace"
depends=('sdl2' 'libsndfile' 'fmt' 'hicolor-icon-theme' 'alsa-lib')
makedepends=('git' 'jack' 'cmake')
optdepends=('jack: JACK audio support')
provides=('furnace')
arch=('x86_64')
license=('GPL')
source=(
  "git+https://github.com/tildearrow/furnace.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  git submodule update --init
}

build() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_GUI=ON -DSYSTEM_FMT=ON -DSYSTEM_ZLIB=ON -DSYSTEM_LIBSNDFILE=ON -DSYSTEM_SDL2=ON -DWITH_JACK=ON ..
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
