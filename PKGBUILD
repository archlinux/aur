# Maintainer:
# Contributor: Michael Migliore <mcmigliore+aur@gmail.com>
# Contributor: Mathieu Wespthal <mathieu.westphal+aur@gmail.com>

# prevent git-lfs error
export GIT_LFS_SKIP_SMUDGE=1

_pkgname="f3d"
pkgname="$_pkgname-git"
pkgver=2.5.0.r13.g0e0b9b0
pkgrel=1
pkgdesc='A fast and minimalist 3D viewer'
url="https://github.com/f3d-app/f3d"
license=('BSD-3-Clause')
arch=('x86_64')

depends=(
  alembic
  assimp
  boost-libs
  draco
  fmt
  glew
  hicolor-icon-theme
  libxcursor
  netcdf
  nlohmann-json
  onetbb
  opencascade
  openexr
  ospray
  pugixml
  python
  usd
  verdict
  vtk
)
makedepends=(
  boost
  cmake
  eigen
  fast_float
  git
  help2man
  jdk-openjdk
  ninja
  openmp
  pybind11
  python
  utf8cpp
)
optdepends=(
  java-runtime
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'

}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DF3D_BINDINGS_JAVA=ON
    -DF3D_BINDINGS_PYTHON=ON
    -DF3D_LINUX_GENERATE_MAN=ON
    -DF3D_MODULE_EXTERNAL_RENDERING=ON
    -DF3D_MODULE_RAYTRACING=ON
    -DF3D_MODULE_EXR=ON
    -DF3D_PLUGINS_STATIC_BUILD=ON
    -DF3D_PLUGIN_BUILD_ALEMBIC=ON
    -DF3D_PLUGIN_BUILD_ASSIMP=ON
    -DF3D_PLUGIN_BUILD_DRACO=ON
    -DF3D_PLUGIN_BUILD_OCCT=ON
    -DF3D_PLUGIN_BUILD_USD=ON
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  DESTDIR="$pkgdir" cmake --install build --component mimetypes
  DESTDIR="$pkgdir" cmake --install build --component sdk
  DESTDIR="$pkgdir" cmake --install build --component configuration

  install -Dm644 "$_pkgsrc/LICENSE.md" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
