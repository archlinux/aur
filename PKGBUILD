# Maintainer: Benoît Allard <benoit.allard@gmx.de>
# Contributor: Oliver Mader <b52@reaktor42.de>

pkgname=libcmaes
pkgver=0.10.2
pkgrel=1
pkgdesc="libcmaes is a multithreaded C++11 library with Python bindings for high performance blackbox stochastic optimization using the CMA-ES algorithm for Covariance Matrix Adaptation Evolution Strategy."
url="https://github.com/CMA-ES/libcmaes"
arch=('x86_64' 'i686')
license=('LGPLv3')
depends=('gcc-libs')
optdepends=('boost-libs: Python support' 'python-numpy: Python support')
makedepends=('python-setuptools' 'eigen' 'boost' 'python-numpy')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/CMA-ES/${pkgname}/archive/v${pkgver}.tar.gz"
  "numpy-include-cppflags.patch"
  )
md5sums=('c0abd0a9357c88c43de725dfacad8c30'
         'd1387bf1c2fc882d0f6667ec123c77ac')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/numpy-include-cppflags.patch"
  autoreconf -fi
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./autogen.sh
  echo "#define CMAES_EXPORT" > include/libcmaes/cmaes_export.h
  ./configure \
    --prefix=/usr \
    --with-prefix=/usr \
    --with-boost-python=boost_python3 \
    --enable-python \
    --enable-onlylib
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
