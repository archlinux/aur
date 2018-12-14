# Maintainer: Christian Pfeiffer <xpipe at hotmail dot de>
pkgname=shogun
pkgver=6.1.3
pkgrel=1
pkgdesc="A Large Scale Machine Learning Toolbox"
arch=('x86_64')
url="http://shogun.ml/"
license=('GPL3')
depends=('arpack' 'arprec' 'cblas' 'glpk' 'hdf5' 'lapacke' 'libxml2'
         'json-c' 'lua' 'nlopt' 'openblas' 'ocl-icd' 'python' 'r' 'snappy')
makedepends=('ctags' 'doxygen' 'eigen3' 'gdb' 'opencv' 'pandoc' 'protobuf'
			 'python-numpy' 'python-ply' 'python-sphinx' 'swig' 'rxcpp-git' 'viennacl')
optdepends=('opencv: OpenCV support'
			'python-numpy: Python bindings'
			'python-ply: Python bindings')
source=(https://github.com/shogun-toolbox/shogun/archive/shogun_$pkgver.tar.gz
        https://github.com/shogun-toolbox/shogun-gpl/archive/v$pkgver.tar.gz
        0001-Removed-is_error-macro-dependency-4098.patch)
sha256sums=('75f4d555efe06eaa7c4c12a1dc942f6e4d41a8ed495777a790b9bd9df936c19c'
            'e8e2fea9804d3e0924a318b00a764bbf9d751c29d32adeeffbb83aec9fbca966'
            '571172d9f31554c1e41cf1e3467cec38c527f1ccf9a2866bf49acfa0c1a84ac4')

prepare() {
  mkdir build
  mv -T "${pkgname}-gpl-${pkgver}" "${srcdir}/${pkgname}-${pkgname}_${pkgver}/src/gpl"

  cd "${srcdir}/${pkgname}-${pkgname}_${pkgver}"
  patch -p1 -i ../0001-Removed-is_error-macro-dependency-4098.patch
}

build() {
  cd build

  # Enable all dependencies, except for:
  #   Commercial ones (MOSEK, CPLEX)
  #   Java - requires JBlas, which isn't packaged
  #   Octave - doesn't work with Octave 4.4
  #   Perl - apparently broken
  #   Ruby - requires RubyNArray, which isn't packaged
  # Requires OpenBLAS, because their CMake can't work with libblas.so, only
  # ATLAS, OpenBLAS and Intel MKL.
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_ARPREC=ON \
    -DBUILD_EXAMPLES=OFF -DBUILD_META_EXAMPLES=OFF \
    -DENABLE_ARPACK=ON -DENABLE_BZIP2=ON \
    -DENABLE_COLPACK=OFF -DENABLE_VIENNACL=ON \
    -DENABLE_EIGEN_LAPACK=ON \
    -DENABLE_CPLEX=OFF -DENABLE_MOSEK=OFF \
    -DENABLE_NLOPT=ON -DENABLE_GLPK=ON -DENABLE_LPSOLVE=ON \
    -DENABLE_CURL=ON -DENABLE_HDF5=ON -DENABLE_JSON=ON \
    -DENABLE_LDGOLD=ON -DENABLE_LTO=ON \
    -DENABLE_PROTOBUF=ON -DENABLE_LIBXML2=ON \
    -DENABLE_BZIP2=ON -DENABLE_LIBLZMA=ON -DENABLE_LZO=ON \
    -DENABLE_SNAPPY=ON -DENABLE_ZLIB=ON \
    -DLICENSE_GPL_SHOGUN=ON \
    -DOpenCV=ON \
    -DUSE_CPLEX=OFF -DUSE_MOSEK=OFF \
    -DUSE_GLPK=ON -DUSE_LPSOLVE=ON -DUSE_BZIP2=ON \
    -DUSE_GZIP=ON -DUSE_LZMA=ON -DUSE_LZO=ON -DUSE_SNAPPY=ON \
    -DUSE_SVMLIGHT=ON -DUSE_SWIG_DIRECTORS=ON \
    -DVIENNACL_WITH_OPENCL=ON \
    -DINTERFACE_LUA=ON \
    -DINTERFACE_PYTHON=ON -DINTERFACE_R=ON \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DLAPACK_lapack_LIBRARY="/usr/lib/liblapack.so\;/usr/lib/liblapacke.so\;/usr/lib/libcblas.so" \
    "${srcdir}/${pkgname}-${pkgname}_${pkgver}"

  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  # The minimal example is always being installed
  rm -r "${pkgdir}/usr/share/shogun/examples"

  # Shogun will install some empty directories
  find "${pkgdir}" -type d -empty -delete
} 
