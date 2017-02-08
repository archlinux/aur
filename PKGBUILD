# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=fbthrift-git
pkgver=2017.01.30.00.r15.g340f6393
pkgrel=1
pkgdesc='Facebook branch of Apache Thrift, including a new C++ server.'
arch=(i686 x86_64)
url='https://github.com/facebook/fbthrift'
license=(Apache)
conflicts=(fbthrift thrift)
provides=(fbthrift thrift)
replaces=(fbthrift)
depends=(wangle-git folly-git numactl krb5 python2 mstch)
makedepends=(git scons cmake flex bison)
source=(git+https://github.com/facebook/fbthrift.git)
md5sums=(SKIP)

pkgver() {
  cd fbthrift/thrift
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd fbthrift/thrift
	# fix python2/python3 compatibility issues
  sed -i 's/env python /env python2 /' compiler/py/main.py
	sed -i 's/libboost_python\*/libboost_python/g' m4/ax_boost_python.m4
}

build() {
  cd fbthrift/thrift
	autoreconf -ivf
	# it builds to /lib by default, however we use /usr/lib
	PY_PREFIX="$pkgdir/usr" PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  make
}

package() {
  cd fbthrift/thrift
  make DESTDIR="$pkgdir" install
}

