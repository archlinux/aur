# Maintainer: Jules Pénuchot <jules@penuchot.com>

_name=sciplot
_author=sciplot

pkgname=${_name}-git
pkgver=0.3.1.r6.g75d813a
pkgrel=1
pkgdesc="A modern C++ scientific plotting library powered by gnuplot"
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('MIT')

depends=('gnuplot')
makedepends=('git' 'cmake' 'make')
provides=('sciplot')
conflicts=('sciplot')

source=("$pkgname::git+https://github.com/${_author}/${_name}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;'
}

prepare() {
  cmake -B build -S ${pkgname} \
        -DSCIPLOT_BUILD_EXAMPLES:BOOL=OFF \
        -DSCIPLOT_BUILD_DOCS:BOOL=OFF \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
}

check() {
    make -C build tests
}

package() {
  make -C build DESTDIR=$pkgdir install
}
