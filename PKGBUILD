# Maintainer: Chris <christopher.r.mullins g-mail>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: joel schaerer <joel.schaerer@laposte.net>

pkgname=insight-toolkit
pkgver=4.9.1
pkgrel=4
pkgdesc='Cross-platform system that provides developers with an extensive suite of software tools for image analysis'
arch=('i686' 'x86_64')
url='http://www.itk.org/'
license=('APACHE')
depends=('fftw' 'libjpeg-turbo' 'libpng' 'zlib' 'libtiff' 'gdcm' 'expat' 'hdf5-cpp-fortran')
optdepends=('python2: build python wrapping'
            'ruby'
            'tcl: build tcl wrapping (currently not supported)'
            'perl: build perl wrapping (currently not supported)'
            'java-runtime: build java wrapping (currently not supported)'
            'swig: generate python wrappers'
            'pcre: for wrapping'
            'castxml-git: for wrapping and docs'
            'clang: for swig')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/project/itk/itk/${pkgver:0:3}/InsightToolkit-${pkgver}.tar.xz")
sha512sums=('6c7c177e6ae64b653e9dfad52028d3d104d9a10e5921b6b003241c76c2e73186be2576b7d64385e7b7a2e94e912ced9c99dd282df570fb0c4707b05e9f9da226')

_usepython=false

build() {
  cd "$srcdir"
  rm -rf build
  mkdir build
  cd build

  cmake \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DBUILD_TESTING:BOOL=OFF \
    -DBUILD_EXAMPLES:BOOL=OFF \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr \
    -DModule_ITKReview:BOOL=ON \
    -DITK_USE_SYSTEM_JPEG:BOOL=ON \
    -DITK_USE_SYSTEM_PNG:BOOL=ON \
    -DITK_USE_SYSTEM_ZLIB:BOOL=ON \
    -DITK_USE_SYSTEM_TIFF:BOOL=ON \
    -DITK_USE_SYSTEM_GDCM:BOOL=ON \
    -DITK_LEGACY_SILENT:BOOL=ON \
    $( $_usepython && echo "-DITK_WRAP_PYTHON:BOOL=ON") \
    $( $_usepython && echo "-DModule_ITKReview:BOOL=OFF") \
    $( $_usepython && echo "-DITK_USE_SYSTEM_SWIG:BOOL=ON") \
    $( $_usepython && echo "-DITK_USE_SYSTEM_CASTXML:BOOL=ON") \
    -DITK_USE_SYSTEM_LIBRARIES:BOOL=ON \
    -DITK_USE_SYSTEM_EXPAT:BOOL=ON \
    -DITK_USE_SYSTEM_FFTW:BOOL=ON \
    -DITK_USE_SYSTEM_HDF5:BOOL=ON \
    ../InsightToolkit-${pkgver}

  make
}

package() {
  cd "$srcdir"/build

  make DESTDIR="${pkgdir}" install
}
