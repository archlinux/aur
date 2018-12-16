# Maintainer: Chris <christopher.r.mullins g-mail>
# Contributor: geosam <samuelmesa@linuxmail.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: joel schaerer <joel.schaerer@laposte.net>

pkgname=insight-toolkit
pkgver=4.13.1
pkgrel=10
pkgdesc='Cross-platform system that provides developers with an extensive suite of software tools for image analysis'
arch=('i686' 'x86_64')
url='http://www.itk.org/'
license=('APACHE')
depends=('fftw' 'libjpeg-turbo' 'libpng' 'zlib' 'libtiff' 'gdcm' 'expat' 'hdf5-cpp-fortran' 'gtest')
optdepends=('python2: build python wrapping'
            'ruby'
            'tcl: build tcl wrapping (currently not supported)'
            'perl: build perl wrapping (currently not supported)'
            'java-runtime: build java wrapping (currently not supported)'
            'swig: generate python wrappers'
            'pcre: for wrapping'
            'castxml-git: for wrapping and docs'
            'clang: for swig'
	    'castxml-git: for ITK')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/project/itk/itk/${pkgver:0:4}/InsightToolkit-${pkgver}.tar.xz")
sha512sums=('faeb33875e00fb8380192a6772ecab2e713a0a5dd2879a15e862690f25302627c7370b646eea68367d215bf4eb6f7eb06b32cd05e18d031e853229fc23943d8b')

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
    -DCMAKE_CXX_FLAGS:STRING="-std=c++98" \
    -DITK_USE_SYSTEM_LIBRARIES:BOOL=ON \
    -DITK_USE_SYSTEM_EXPAT:BOOL=ON \
    -DITK_USE_SYSTEM_FFTW:BOOL=ON \
    -DITK_USE_SYSTEM_HDF5:BOOL=ON \
    -DModule_ITKIOMINC:BOOL=ON \
    -DModule_ITKIOTransformMINC:BOOL=ON \
    ../InsightToolkit-${pkgver}

  make
}

package() {
  cd "$srcdir"/build

  make DESTDIR="${pkgdir}" install
}
