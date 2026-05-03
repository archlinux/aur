# Maintainer: oysstu <oysstu a gmail.com>

pkgname=libdart-git
pkgver=6.15.0.r574.g16115f2
pkgrel=1
pkgdesc="Dynamic Animation and Robotics Toolkit"
url="dart.readthedocs.io"
arch=('any')
license=('BSD-2-Clause')
depends=('assimp' 'boost' 'eigen' 'fcl' 'libccd' 'bullet' 'coin-or-ipopt'
         'nlopt' 'octomap' 'ode' 'openscenegraph' 'tinyxml2' 'urdfdom'
         'glu' 'freeglut' 'libxi' 'libxmu' 'pagmo' 'fmt')
optdepends=('pagmo: pagmo optimizer support')
makedepends=('cmake' 'git')
provides=('libdart')
conflicts=('libdart')
source=("git+https://github.com/dartsim/dart.git")
sha256sums=('SKIP')

build() {
  CXXFLAGS="$CXXFLAGS -mno-avx512f"

  cmake -B build -S "${srcdir}/dart" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DDART_TREAT_WARNINGS_AS_ERRORS:BOOL=OFF \
    -DDART_ENABLE_SDFORMAT=OFF

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $srcdir/dart/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

pkgver() {
  cd "dart"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
