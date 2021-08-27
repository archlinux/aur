# Maintainer: EndlessEden <eden [at] rose.place>
# Upstream Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>

pkgname=libad9361-git
gitname=libad9361
_pkgname=$gitname-iio
pkgver=0.2.f8003df
pkgrel=1
pkgdesc='IIO AD9361 library for filter design and handling, multi-chip sync, etc. git Version'
arch=('x86_64')
url="https://github.com/analogdevicesinc/$_pkgname"
license=('LGPL2.1')
depends=('libiio.so')
makedepends=('cmake' 'doxygen' 'graphviz' 'git' 'python-sphinx_rtd_theme')
provides=("$gitname" "$pkgname" 'libad9361.so')
conflicts=("$gitname")
source=("$pkgname::git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  echo $(echo $(git ls-remote --tags --sort="v:refname" -h 2>&1) | grep tags | tail -1 | sed 's,v,\n,g'|tail -1).$(git rev-parse --short HEAD)

}


build() {
  mkdir -p $pkgname/build
  cd $pkgname/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DMATLAB_BINDINGS=ON \
    -DPYTHON_BINDINGS=ON \
    -DENABLE_PACKAGING=OFF

  make
}

package() {
  cd $pkgname/build

  make DESTDIR="$pkgdir" install
}

