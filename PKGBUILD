# Maintainer: hyak <hyakdev@gmail.com>
pkgname=axmol-git
pkgver=r1.0.deadbeef
pkgrel=2
pkgdesc="A multi-platform 2D/3D game engine, fork of Cocos2d-x (Git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/axmolengine/axmol"
license=('MIT')
depends=('glu' 'glew' 'glfw-x11' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxi' 'fontconfig' 'sqlite')
makedepends=('git' 'cmake' 'ninja' 'python')
provides=('axmol')
conflicts=('axmol' 'axmol-bin')
source=('axmol::git+https://github.com/axmolengine/axmol.git#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/axmol"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/axmol"
  git submodule update --init --recursive
  python setup.py
}

build() {
  cmake -B build -S axmol \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 axmol/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
