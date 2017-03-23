# Maintainer: Kai Xuan <woxuankai at gmail dot com>
_pkgname='ants'
pkgname="${_pkgname}-git"
pkgver=v2.1.0.r776.g3f5cc924
pkgrel=1
pkgdesc='Advanced Normalization Tools (ANTs) computes high-dimensional \
mappings to capture the statistics of brain structure and function'
arch=('i686' 'x86_64')
url='http://www.picsl.upenn.edu/ANTS/'
license=('Apache')
depends=('perl' 'insight-toolkit>=4.11.0')
makedepends=('git' 'cmake')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}"'::git+https://github.com/stnava/ANTs.git')
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
}

build() {
  cd "${srcdir}/${pkgname}/build"
  cmake \
      -DANTS_SUPERBUILD=OFF \
      -DANTS_USE_QT=OFF \
      -DANTS_INSTALL_DEVELOPMENT=OFF \
      -DCOPY_SCRIPT_FILES_TO_BIN_DIR=OFF \
      -DANTS_BUILD_DISTRIBUTE=ON \
      -DBUILD_ALL_ANTS_APPS=ON \
      -DUSE_VTK=OFF \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_TESTING=OFF \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_SHARED_LIBS=ON ..
  make
}
# -DITK_USE_SYSTEM_FFTW=ON

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}" install
}

