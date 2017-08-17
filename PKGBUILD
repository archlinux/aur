# Maintainer: Sascha Wunderlich <archlinux at saschawunderlich dot de>
pkgname=carl-git
pkgver=17.08.r2.g8f78930b
pkgrel=1
pkgdesc="CArL - the Computer ARithmetic and Logic library"
arch=(i686 x86_64)
url="https://smtrat.github.io/carl"
license=('MIT')
groups=()
conflicts=('carl')
provides=('carl')
depends=(boost eigen ginac)
makedepends=(git cmake)
source=("$pkgname::git+https://github.com/smtrat/carl.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  rm -rf build/
  
  mkdir build
  cd build

  cmake -DUSE_CLN_NUMBERS=ON -DUSE_GINAC=ON -DTHREAD_SAFE=ON \
        -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
	..

  make lib_carl
}

# this works, but is not cleaned up before package()
#check() {
#  cd "$pkgname"/build
#  make
#  make test
#}

package() {
  cd "$pkgname"/build
  make DESTDIR="$pkgdir/" install/fast
}
