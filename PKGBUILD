# Maintainer: Joonas Henriksson <joonas.henriksson at gmail com>

pkgbase=glslviewer
pkgname=('glslviewer' 'glslviewer-examples')
pkgver=3.1.1
pkgrel=1
pkgdesc="Console-based GLSL Sandbox for 2D/3D shaders"
arch=('i686' 'x86_64')
url="https://github.com/patriciogonzalezvivo/glslViewer"
license=('BSD-3-Clause')
depends=('glu' 'glfw-x11' 'ncurses' 'ffmpeg')
makedepends=('cmake' 'git')
source=("$pkgbase::git+https://github.com/patriciogonzalezvivo/glslViewer#tag=v$pkgver"
        "git+https://github.com/patriciogonzalezvivo/ada"
        "git+https://github.com/mackron/miniaudio")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

prepare() {
  cd "$pkgbase"
  git submodule init
  git config submodule.deps/ada.url "$srcdir/ada"
  git config submodule.deps/miniaudio.url "$srcdir/miniaudio"
  git submodule update
}

build() {
  cmake \
    -S "$pkgbase" \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr

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

