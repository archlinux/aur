# Maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: Kai Xuan <woxuankai at gmail dot com>

_pkgname='ants'
pkgname="${_pkgname}-git"
pkgver=v2.3.5.r64.g221dad77
pkgrel=1
pkgdesc='Advanced Normalization Tools (ANTs) computes high-dimensional \
mappings to capture the statistics of brain structure and function'
arch=('i686' 'x86_64')
url='http://www.picsl.upenn.edu/ANTS/'
license=('Apache')
depends=('r' 'vtk' 'perl' 'gdcm')
makedepends=('git' 'cmake')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}"'::git+https://github.com/stnava/ANTs.git'
        '0001-fix-for-GDCM-build.patch')
sha256sums=('SKIP'
            'f20685afed8f3fdc005b7c6924cee39350f0eac1e6010cfe9fee78a517d7e684')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -Np1 -i "${srcdir}"/0001-fix-for-GDCM-build.patch
  mkdir -p antsBuild
}

build() {
  cd "${srcdir}/${pkgname}/antsBuild"
  cmake \
      -DBUILD_ALL_ANTS_APPS=ON \
      -DBUILD_SHARED_LIBS=OFF \
      -DBUILD_STYLE_UTILS=OFF \
      -DBUILD_TESTING=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/opt/ANTs \
      -DEXTERNAL_PROJECT_BUILD_TYPE=Release \
      -DFORCE_EXTERNAL_BUILDS=OFF \
      -DITK_BUILD_MINC_SUPPORT=OFF \
      -DITK_VERSION_MAJOR=5 \
      -DOLD_BASELINE_TESTS=OFF \
      -DRUN_LONG_TESTS=ON \
      -DRUN_SHORT_TESTS=ON \
      -DSuperBuild_ANTS_USE_GIT_PROTOC=ON \
      -DUSE_SYSTEM_ITK=OFF \
      -DUSE_SYSTEM_SlicerExecutionMode=OFF \
      -DUSE_SYSTEM_VTK=ON \
      -DUSE_VTK=ON \
      ..
  make -j1
}

package() {
  cd "${srcdir}/${pkgname}/antsBuild/ANTS-build"
  make DESTDIR="${pkgdir}" install
}

