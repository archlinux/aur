# Maintainer: Gabantax <ve20@web.de>
pkgname=tw-dusk-git
pkgver=r4009.40e3f7d057
pkgrel=1
pkgdesc="Dusk is a reverse-engineered reimplementation of Twilight Princess"
arch=('x86_64')
url="https://github.com/TwilitRealm/dusk"
license=('CC0-1.0')
depends=('alsa-lib' 'libpulse' 'libxrandr' 'freetype2')
makedepends=('git' 'cmake' 'ninja' 'llvm' 'vulkan-headers' 'python' 'python-markupsafe' 'clang' 'lld')

provides=('dusk')
conflicts=('dusk')

source=("dusk::git+https://github.com/TwilitRealm/dusk.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/dusk"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/dusk"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/dusk"
  cmake --preset linux-default-relwithdebinfo
  cmake --build --preset linux-default-relwithdebinfo
}

package() {
  cd "$srcdir/dusk"
  mkdir -p "$pkgdir/opt/dusk"
  cp -r build/linux-default-relwithdebinfo/* "$pkgdir/opt/dusk/"  
  chmod +x "$pkgdir/opt/dusk/dusk"

  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/dusk/dusk "$pkgdir/usr/bin/dusk"
  
  install -Dm644 "platforms/freedesktop/dusk.desktop" "$pkgdir/usr/share/applications/dusk.desktop"
  install -Dm644 "platforms/freedesktop/512x512/apps/dusk.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/dusk.png"
}
