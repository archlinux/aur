# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: geosam <samuelmesa@linuxmail.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: joel schaerer <joel.schaerer@laposte.net>

pkgname=insight-toolkit
pkgver=5.3.0
pkgrel=1
pkgdesc='Cross-platform system that provides developers with an extensive suite of software tools for image analysis'
arch=('i686' 'x86_64')
url='https://itk.org/'
license=('APACHE')
depends=('fftw' 'libjpeg-turbo' 'libpng' 'zlib' 'libtiff' 'gdcm' 'expat' 'hdf5' 'gtest' 'eigen')
optdepends=('python2: build python wrapping'
            'ruby'
            'tcl: build tcl wrapping (currently not supported)'
            'perl: build perl wrapping (currently not supported)'
            'java-runtime: build java wrapping (currently not supported)'
            'swig: generate python wrappers'
            'pcre: for wrapping'
            'castxml: for wrapping and docs'
            'clang: for swig')
makedepends=('cmake' 'git')
options=(!lto)
source=("https://github.com/InsightSoftwareConsortium/ITK/releases/download/v${pkgver}/InsightToolkit-${pkgver}.tar.gz"
        "InsightToolkit-gcc13-fix.patch::https://github.com/InsightSoftwareConsortium/ITK/pull/4066/commits/93bd9fe07e250bdac948ae6f2c2cc749f165f0e9.patch")
sha512sums=('29359839c0fb13acd430410e6adadbecb4d9d8cb4871a0aba0ac67b539c235354a591655dd654f43daa5f035a33721671d665eee8a4a129a9d0d3419e2356e97'
            '1435e87705a4bd53ae70c221b2541a8912b08f21e62de87c25520d3cc7e9784ae8deb8bcbd37ccd28b17e57d0069919ad103e93030b99417131e708abc9a0a38')

_usepython=false

prepare() {
  cd "InsightToolkit-${pkgver}"
  patch -Np1 -i ../InsightToolkit-gcc13-fix.patch
}

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
    -DModule_SimpleITKFilters:BOOL=ON \
    ../InsightToolkit-${pkgver}

  make
}

package() {
  cd "$srcdir"/build

  make DESTDIR="${pkgdir}" install
}
