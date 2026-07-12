# Maintainer: hyak <hyakdev@gmail.com>
pkgname=axmol-git
pkgver=r1.0.deadbeef
pkgrel=1
pkgdesc="A multi-platform 2D/3D game engine, fork of Cocos2d-x (Git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/axmolengine/axmol"
license=('MIT')
depends=('glu' 'glew' 'glfw-x11' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxi' 'fontconfig' 'sqlite')
makedepends=('git' 'cmake' 'ninja' 'powershell')
provides=('axmol')
conflicts=('axmol' 'axmol-bin')
source=('axmol::git+https://github.com/axmolengine/axmol.git#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/axmol"
  # Genera la versión basada en el número de commits y el hash corto
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/axmol"
  git submodule update --init --recursive
  # Descarga dependencias externas obligatorias del motor (ej. glslcc)
  pwsh setup.ps1
}

build() {
  cmake -B build -S axmol \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DAXMOL_BUILD_TESTS=OFF \
    -DAXMOL_BUILD_EXAMPLES=OFF
    
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  
  # Instalación de la licencia obligatoria
  install -Dm644 axmol/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
