# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=fbthrift
pkgver=2017.03.20.00
pkgrel=2
pkgdesc="Facebook's branch of Apache Thrift, including a new C++ server"
arch=('i686' 'x86_64')
url="https://github.com/facebook/fbthrift"
license=('Apache')
depends=('folly' 'krb5' 'numactl' 'python2')
conflicts=('thrift')
provides=('thrift')
makedepends=('scons' 'zstd' 'libunwind')
options=('!emptydirs' 'staticlibs')
source=("https://github.com/facebook/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('eb8b04def043e4b897e5ce1617695486')

prepare() {
  cd "$pkgname-$pkgver/thrift"
  sed -ie '1 s/python/python2/' ./compiler/py/main.py
  # ArchLinux system has both libboost_python.so and libboost3_python.so.
  # Use python2 for build, so prevent libboost3_python.so to be chosen
  sed -i -e 's/libboost_python\*.so\*/libboost_python.so\*/' ./m4/ax_boost_python.m4
  autoreconf -ivf 
}

build() {
  cd "$pkgname-$pkgver/thrift"
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  sed --in-place -e 's/python\( -mthrift_compiler.main\)/python2 \1/g' ./lib/cpp2/Makefile
  make
}

#check() {
#  cd "$pkgname-$pkgver/thrift"
#  make check
#}

package() {
  cd "$pkgname-$pkgver/thrift"
  make \
    PY_INSTALL_HOME="$pkgdir/usr" \
    PY_INSTALL_ARGS="--root '${pkgdir}' --prefix=/usr" \
    DESTDIR="$pkgdir" \
    install
}
