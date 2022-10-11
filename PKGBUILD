# Maintainer: iohzrd <iohzrd@protonmail.com>
_pkgname=mraa
pkgname=$_pkgname-radxa-git
pkgver=2.1.0.23.gfc8c906
pkgrel=8
pkgdesc="Low Level Skeleton Library for IO Communication on GNU/Linux platforms."
provides=(${_pkgname%-*}=$pkgver)
conflicts=(${_pkgname%-*})
depends=('json-c')
makedepends=('git' 'cmake' 'swig')
optdepends=('python: for Python support')
url="https://github.com/intel-iot-devkit/mraa"
license=('MIT')
arch=('aarch64' 'armv6h' 'armv7h' 'x86_64')

source=(git+https://github.com/radxa/mraa.git)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$_pkgname
  git apply ../../extern_gVERSION.patch
}

build() {
  mkdir -p mraa/build
  cd mraa/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
  -DINSTALLTOOLS=ON \
  -DBUILDSWIGJAVA=OFF \
  -DBUILDSWIGNODE=OFF \
  -DBUILDSWIGPYTHON=ON \
  -DCMAKE_INSTALL_LIBDIR=/usr/lib ../
  make
}

package() {
  cd $srcdir/mraa/build
  make DESTDIR=$pkgdir install
}