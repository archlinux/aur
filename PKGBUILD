pkgname=fmipp
pkgver=1.2
pkgrel=1
pkgdesc="A High-level Utility Package for FMI-based Software Development"
arch=('i686' 'x86_64')
url="http://fmipp.sourceforge.net"
depends=('sundials' 'boost-libs')
makedepends=('git' 'cmake')
license=('BSD')
source=("fmipp-${pkgver}::git+git://git.code.sf.net/p/fmipp/code#commit=565836e255a73d013b3b74331d56f24ebf8b5408")
md5sums=('SKIP')

build() {
  cd "$srcdir"/fmipp-${pkgver}
  mkdir -p build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SWIG_JAVA=OFF \
    -DBUILD_TESTS=OFF \
    -DINCLUDE_SUNDIALS=ON \
    ..
  make
}

package() {
  cd "$srcdir"/fmipp-${pkgver}/build
  PYTHON_DIR=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
  install -d "$pkgdir"/usr/include/fmipp
  cp -r "$srcdir"/fmipp-${pkgver}/common/* "$pkgdir"/usr/include/fmipp
  cp "$srcdir"/fmipp-${pkgver}/export/{functions,include}/*.h "$pkgdir"/usr/include/fmipp
  cp "$srcdir"/fmipp-${pkgver}/export/tools/{powerfactory,trnsys17/Type6139}/*.h "$pkgdir"/usr/include/fmipp
  cp "$srcdir"/fmipp-${pkgver}/import/{integrators,base,utility}/include/*.h "$pkgdir"/usr/include/fmipp
  install -d "$pkgdir"/${PYTHON_DIR}
  install -m644 export/libfmippex.so import/libfmippim.so "$pkgdir"/usr/lib
  install -m644  import/swig/_fmippim.so "$pkgdir"${PYTHON_DIR}
  install -m644  import/swig/fmippim.py "$pkgdir"${PYTHON_DIR}
}
