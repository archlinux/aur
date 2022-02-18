# Maintainer: Essem <smswessem@gmail.com>

pkgname=furnace-git
pkgver=v0.5.6.r26.ga9b2102
pkgrel=2
pkgdesc="A multi-system chiptune tracker compatible with DefleMask modules"
url="https://github.com/tildearrow/furnace"
depends=('sdl2' 'zlib' 'libsndfile' 'fmt' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
provides=('furnace')
arch=('x86_64')
license=('GPL')
source=(
  "git+https://github.com/tildearrow/furnace.git"
  "git+https://github.com/nukeykt/Nuked-OPN2.git"
  "git+https://github.com/ocornut/imgui.git"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  git submodule init
  git config submodule.extern/Nuked-OPN2.url "$srcdir/Nuked-OPN2"
  git config submodule.extern/imgui.url "$srcdir/imgui"
  git submodule update
}

build() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DSYSTEM_FMT=ON -DSYSTEM_ZLIB=ON -DSYSTEM_LIBSNDFILE=ON -DSYSTEM_SDL2=ON -DWITH_JACK=OFF ..
  cmake --build .
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
