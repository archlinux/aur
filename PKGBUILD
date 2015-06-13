# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=revbayes-git

pkgver=r4177.93b7c7c
pkgrel=1
pkgdesc="bayesian phylogenetic inference using probabilistic graphical models and an interpreted language"
arch=(i686 x86_64)
url="https://github.com/revbayes/revbayes"
license=(GPL3)
depends=(gcc-libs)
makedepends=(boost cmake git)
conflicts=('revbayes')
provides=('revbayes')

source=("$pkgname::git+https://github.com/revbayes/revbayes")

md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname

  rm -rf boost_1_55_0

  mkdir -p build

  cd projects/cmake
  ./regenerate.sh -boost false
}

build() {
  cd $srcdir/$pkgname/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ../projects/cmake

  make
}

package() {
  cd $srcdir/$pkgname/build

  install -Dm755 rb $pkgdir/usr/bin/rb
}
