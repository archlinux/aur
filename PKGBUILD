# Maintainer: Christian Pfeiffer <cpfeiffer at live dot de>

pkgname=shogun
pkgver=6.1.4
_gpl_pkgver=6.1.3
pkgrel=1
pkgdesc="A Large Scale Machine Learning Toolbox"
arch=('x86_64')
url="http://shogun.ml/"
license=('GPL3')
depends=('arpack' 'cblas' 'glpk' 'hdf5' 'lapacke' 'libxml2'
         'json-c' 'lua' 'nlopt' 'openblas' 'ocl-icd' 'python' 'r' 'snappy')
makedepends=('ctags' 'doxygen' 'eigen3' 'gdb' 'opencv' 'pandoc' 'protobuf'
			 'python-numpy' 'python-ply' 'python-sphinx' 'swig' 'rxcpp-git' 'viennacl')
optdepends=('opencv: OpenCV support'
			'python-numpy: Python bindings'
			'python-ply: Python bindings')
source=(https://github.com/shogun-toolbox/shogun/archive/shogun_$pkgver.tar.gz
        https://github.com/shogun-toolbox/shogun-gpl/archive/v$_gpl_pkgver.tar.gz
        0001-Removed-is_error-macro-dependency-4098.patch
        0001-OpenMP-Remove-incomplete-shared-variable-specificati.patch
        )
sha512sums=('85e46d5e64ab657f9281d73b4a3917037322a5c704cd9dc723b484ffca3ac778c79a807d8a2b136a81d2944f53e2d8f46bafc5b024bded6efe78ebdb0a02f947'
            'bd2335bf8c4ba6a17a2af870a0f218c791ba7825694d95fbce52c61390f093b6932c07c8175e01d3425065486da8258132f5092660d0ba74ff78baba2a2cb88b'
            'e72c0c7aa68031856679acc467c497afa2596de8f580cb62a6cf88eaf6a803952990178a050ff74cb6b388b375a84047cae4ebfc388bbc51910bd473c9d419a6'
            '1136d75b6306bf2f1a9c3589d00de9e000a6cdc34616d37643d57b5fd302855528ee084dc342d514b6d35405ca21987aab31bb87f1f74bbb12283ed16c8dbef7')

prepare() {
  mkdir build
  mv -T "${pkgname}-gpl-${_gpl_pkgver}" "${srcdir}/${pkgname}-${pkgname}_${pkgver}/src/gpl"

  cd "${srcdir}/${pkgname}-${pkgname}_${pkgver}"
  patch -p1 -i ../0001-Removed-is_error-macro-dependency-4098.patch

  cd "src/shogun/lib/tapkee"
  patch -p3 -i "${srcdir}/0001-OpenMP-Remove-incomplete-shared-variable-specificati.patch"
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
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
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
