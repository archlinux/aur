pkgname=mingw-w64-openfst
_pkgname=openfst
pkgver=1.8.1
pkgrel=1
pkgdesc="Library for constructing, combining, optimizing, and searching weighted finite-state transducers (mingw-w64)"
arch=('any')
url="http://www.openfst.org/"
license=('APACHE')
makedepends=(mingw-w64-configure)
depends=(mingw-w64-dlfcn mingw-w64-mman-win32-git)
options=(!strip !buildflags staticlibs)
source=("http://www.openfst.org/twiki/pub/FST/FstDownload/openfst-${pkgver}.tar.gz"
        getpagesize.patch)
sha256sums=('24fb53b72bb687e3fa8ee96c72a31ff2920d99b980a0a8f61dda426fca6713f0'
            'efc9f8dee9f0410a4cc39c26c1dac23e04b770ea70260672695720e1802b924d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  # use page size info from windows
  #patch -p1 < ../getpagesize.patch
  # make sure dlls are built
  find . -name Makefile.am | xargs -i sed -i "s/_la_LDFLAGS = /_la_LDFLAGS = -no-undefined /" {}
  find src/extensions -name Makefile.am | xargs -i sed -i "s/_la_LDFLAGS = /_la_LDFLAGS = -lfst -ldl -lmman -no-undefined /" {}
  sed -i 's/AC_PROG_LIBTOOL/AC_LIBTOOL_WIN32_DLL\nAC_PROG_LIBTOOL/' configure.ac
  #sed -i 's/ -Werror//' configure.ac
  autoreconf -vfi
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    # Options according to http://openfst.cs.nyu.edu/twiki/bin/view/FST/ReadMe
    ${_arch}-configure --disable-dependency-tracking --enable-bin=no \
      --enable-compact-fsts --enable-const-fsts --enable-far \
      --enable-linear-fsts --enable-lookahead-fsts \
      --enable-pdt LDFLAGS="-ldl -lmman -L${PWD}/src/lib/.libs"
    make
    popd
 done
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}"/usr/${_arch} -name \*.a | xargs ${_arch}-strip -g
    find "${pkgdir}"/usr/${_arch} -name \*.dll | xargs ${_arch}-strip --strip-unneeded
    popd
  done
}

