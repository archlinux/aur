# Maintainer:
# Contributor: Michael Migliore <mcmigliore+aur@gmail.com>
# Contributor: Mathieu Wespthal <mathieu.westphal+aur@gmail.com>

# prevent git-lfs error
export GIT_LFS_SKIP_SMUDGE=1

: ${_build_usd:=false}

_pkgname="f3d"
pkgname="$_pkgname-git"
pkgver=3.1.0.r140.g041870f
pkgrel=1
pkgdesc='A fast and minimalist 3D viewer'
url="https://github.com/f3d-app/f3d"
license=('BSD-3-Clause')
arch=('x86_64')

depends=(
  alembic
  assimp
  draco
  hicolor-icon-theme
  libxcursor
  netcdf
  onetbb
  opencascade
  openexr
  openmp
  openvdb
  ospray
  python
  vtk
)
makedepends=(
  cmake
  eigen
  fast_float
  git
  help2man
  jdk-openjdk
  ninja
  nlohmann-json
  pybind11
  utf8cpp
)
optdepends=(
  java-runtime
)

if [[ "${_build_usd::1}" == "t" ]]; then
  depends+=(usd)
  makedepends+=(cuda)
fi

provides=("$_pkgname=${pkgver%%.g*}")
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
    -DF3D_MODULE_RAYTRACING=ON
    -DF3D_MODULE_EXR=ON
    -DF3D_PLUGINS_STATIC_BUILD=ON
    -DF3D_PLUGIN_BUILD_ALEMBIC=ON
    -DF3D_PLUGIN_BUILD_ASSIMP=ON
    -DF3D_PLUGIN_BUILD_DRACO=ON
    -DF3D_PLUGIN_BUILD_HDF=ON
    -DF3D_PLUGIN_BUILD_OCCT=ON
    -DF3D_PLUGIN_BUILD_USD=${_build_usd}
    -DF3D_PLUGIN_BUILD_VDB=ON
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
