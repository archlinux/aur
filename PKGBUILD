# Maintainer: Joonas Henriksson <joonas.henriksson at gmail com>

pkgbase=glslviewer
pkgname=('glslviewer' 'glslviewer-examples')
pkgver=3.2.4
pkgrel=2
pkgdesc="Console-based GLSL Sandbox for 2D/3D shaders"
arch=('i686' 'x86_64')
url="https://github.com/patriciogonzalezvivo/glslViewer"
license=('BSD-3-Clause')
depends=('glu' 'glfw-x11' 'ncurses' 'ffmpeg')
makedepends=('cmake' 'git' 'libxrandr' 'libxinerama' 'libxi')
source=("$pkgbase::git+https://github.com/patriciogonzalezvivo/glslViewer#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cd "$pkgbase"
  git submodule init
  git submodule update

  # Revert vera exiv2 support to fix build error
  # https://github.com/patriciogonzalezvivo/vera/issues/9
  cd "deps/vera/"
  git revert -n 3ab745a4173340110bb1e592949c78cf5c039eeb
}

build() {
  cmake \
    -S "$pkgbase" \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

  make -C build
}

package_glslviewer() {
  make install -C build DESTDIR="$pkgdir"

  install -D -m644 "$pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_glslviewer-examples() {
  pkgdesc+=" (shader examples)"
  depends=()

  install -d -m755 "$pkgdir/usr/share/$pkgname/"
  cp -r "$pkgbase"/examples/* "$pkgdir/usr/share/$pkgname/"

  install -D -m644 "$pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

