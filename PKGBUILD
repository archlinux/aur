# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
pkgname=materialx-git
pkgver=v1.38.6.r110.g96f98f6
pkgrel=1
pkgdesc="Open standard for representing rich material and look-development content in computer graphics"
arch=('x86_64')
url="https://materialx.org/"
license=('Apache')
depends+=('python')
provides=('materialx')
conflicts=('materialx')
source=(git+"https://github.com/AcademySoftwareFoundation/MaterialX.git")
md5sums=('SKIP')

prepare () {

  cd MaterialX
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  git submodule update --init --recursive
}

build() {
  mkdir -p build
  cd build

  cmake $srcdir/MaterialX \
  -DMATERIALX_BUILD_PYTHON=ON\
  -DMATERIALX_BUILD_VIEWER=ON\
  -DMATERIALX_BUILD_GRAPH_EDITOR=ON

  cmake --build . --target install -- -j
}

package() {
  mkdir -p "${pkgdir}/usr/bin"

  cd "$srcdir"

  mv build/installed ${pkgdir}/usr/materialx

  ln -s /usr/materialx/bin/MaterialXView ${pkgdir}/usr/bin/mtlxview
}
