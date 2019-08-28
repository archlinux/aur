# Maintainer: Sascha Wunderlich <archlinux at saschawunderlich dot de>
pkgname=carl-master14-git
pkgver=c++14.18.12.r9.gb9ff46d9
pkgrel=1
pkgdesc="CArL - the Computer ARithmetic and Logic library (master14 branch)"
arch=(i686 x86_64)
url="https://smtrat.github.io/carl"
license=('MIT')
groups=()
conflicts=('carl')
provides=('carl-master14')
depends=(boost eigen ginac)
makedepends=(git cmake)
source=("$pkgname::git+https://github.com/smtrat/carl.git#branch=master14")
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

  # these are the targets needed for install/fast (we are not building the tests)
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
