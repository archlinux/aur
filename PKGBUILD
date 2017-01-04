# Maintainer: Oliver Mader <b52@reaktor42.de>

pkgname=libcmaes
pkgver=0.9.5
pkgrel=3
pkgdesc="libcmaes is a multithreaded C++11 library with Python bindings for high performance blackbox stochastic optimization using the CMA-ES algorithm for Covariance Matrix Adaptation Evolution Strategy."
url="https://github.com/beniz/libcmaes"
arch=('x86_64' 'i686')
license=('LGPLv3')
depends=('gcc-libs')
optdepends=('boost-libs: Python support' 'python-numpy: Python support')
makedepends=('eigen' 'boost' 'python-numpy')
source=("https://github.com/beniz/${pkgname}/archive/${pkgver}.tar.gz"
        "fix-python-iface.patch")
md5sums=('ab89fde799f1e938ffd74fa66ab77153'
         '6c4e498ea88531fc6f5aee51b283a04b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  PYTHON_SITE_DIR="$pkgdir`python -c 'from distutils.sysconfig import get_python_lib; print(get_python_lib())'`/"

  patch -p1 -i "${srcdir}/fix-python-iface.patch"
  sed -i 's/CPPFLAGS=$PYTHON_CPPFLAGS $CPPFLAGS/CPPFLAGS="$PYTHON_CPPFLAGS $CPPFLAGS"/' configure.ac
  sed -i 's/print numpy.get_include()/print(numpy.get_include())/' configure.ac
  sed -i 's@lcmaes.so $(libdir)@-Dt '"$PYTHON_SITE_DIR"' lcmaes.so@' python/Makefile.am
  sed -i 's/$(BOOST_PYTHON_LIB)/boost_python3/' python/Makefile.am
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --with-prefix=/usr \
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
