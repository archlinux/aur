# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=tufao-git
pkgver=0.0.0
pkgrel=1
pkgdesc="An asynchronous web framework for C++ built on top of Qt"
arch=('i686' 'x86_64')
url="https://github.com/vinipsmaker/tufao"
license=('LGPL2')
depends=('qt5-base')
makedepends=('cmake')
provides=('tufao')
conflicts=('tufao')
options=(debug)
source=("${pkgname}::git+https://github.com/vinipsmaker/tufao.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local major="$(grep -Eoe 'TUFAO_VERSION_MAJOR [[:digit:]]+' CMakeLists.txt | grep -Eoe '[[:digit:]]$')"
  local minor="$(grep -Eoe 'TUFAO_VERSION_MINOR [[:digit:]]+' CMakeLists.txt | grep -Eoe '[[:digit:]]$')"
  local patch="$(grep -Eoe 'TUFAO_VERSION_PATCH [[:digit:]]+' CMakeLists.txt | grep -Eoe '[[:digit:]]$')"
  local ver="$(git describe --long | sed -re s/^[^-]*/$major.$minor.$patch/g)"
  printf "%s" "${ver//-/.}"
}

build() {
  mkdir "$srcdir/$pkgname/build"
  cd "$srcdir/$pkgname/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ..
  make
}

check() {
  cd "$srcdir/$pkgname/build"
  cmake -DENABLE_TESTS=ON .
  make tests
  cmake -DENABLE_TESTS=OFF .
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir" install
}
