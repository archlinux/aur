# Maintainer: Daniel Feist <daniel dot feist at mail dot de>
# Contributer: Andrew Hills <ahills at ednos dot net>
pkgname=qpid-cpp
pkgver=1.35.0
pkgrel=1
pkgdesc="A connection-oriented messaging API that supports many languages and platforms"
arch=('i686' 'x86_64')
url="http://qpid.apache.org/index.html"
license=('APACHE')
makedepends=('cmake' 'boost' 'python2-virtualenv')
depends=()
optdepends=()
source=("http://www-us.apache.org/dist/qpid/cpp/${pkgver}/qpid-cpp-${pkgver}.tar.gz")
md5sums=('f63032428999b3ae509cc0db00e42102')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build
  cd build
	# Create a Python 2 virtualenv to ensure the many, many invocations of "python" use the correct version
	virtualenv2 venv
	. venv/bin/activate
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/usr/sbin/* "${pkgdir}"/usr/bin
  mv "${pkgdir}"/usr/lib64/* "${pkgdir}"/usr/lib
  rm -rf "${pkgdir}"/usr/sbin "${pkgdir}"/usr/lib64
}
