# Maintainer:
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)

# options
: ${_alpinever:=3.14} # Source tarball from Alpine Linux is about 1GB.
: ${_gcc_version:=12}

# basic info
_pkgname=mapbox-gl-native
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=1.6.0
pkgrel=3
pkgdesc="C++ library that powers customizable vector maps in native applications"
url="https://github.com/mapbox/mapbox-gl-native"
arch=("x86_64" "aarch64")
license=('BSD')

depends=(
  "gcc${_gcc_version:?}-libs"

  'glfw'
)
makedepends=(
  "gcc${_gcc_version:?}"

  'cmake'
  'git'
  'ninja'
  'qt5-base'
)

_pkgsrc="${_pkgname:?}"
_dl_url="https://distfiles.alpinelinux.org/distfiles/v${_alpinever:?}"
_dl_file="${_pkgname}-${pkgver}.tar.gz"

source=(
  "${_dl_file:?}"::"${_dl_url:?}/$_dl_file"
  'allow-qt-deprecations.patch'
  'fix-compilation.patch'
  '16591.patch'
  'arch-include-dir.patch'
)
sha256sums=(
  '41bb6ff6a6466ea7e74429da7b766373cee197bb7356d51365934ee1699d6355'
  '721208fa7cb3874289c65a22354bc9a0a89150b4d656a106b04d84254fc25b9d'
  'b3a9c9a410dabf2382d1500952fa30e73e42162e451f46f1ca7533003261abcd'
  'efc3b434ed353830d9b6d63c0db714da89f3915a1624dcecc455bc5fe9f3eb17'
  'c0cdf1e9ad2169abeb0143e0af3a9b6eb362728e824b943a53a976ef07da9e13'
)

prepare() {
  apply-patch() {
    printf '\nApplying patch %s\n' "$1"
    patch -Np1 -F100 -i "$1"
  }

  cd "${_pkgsrc:?}"
  apply-patch "${srcdir:?}/allow-qt-deprecations.patch"
  apply-patch "${srcdir:?}/fix-compilation.patch"
  apply-patch "${srcdir:?}/16591.patch"
  apply-patch "${srcdir:?}/arch-include-dir.patch"
}

build() {
  export CC="gcc-${_gcc_version:?}"
  export CXX="g++-${_gcc_version:?}"
  export LDFLAGS="-Wl,--copy-dt-needed-entries"

  local _cmake_options=(
    -B build
    -S "${_pkgsrc:?}"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'

    -DMBGL_WITH_QT=ON
    -DMBGL_WITH_WERROR=OFF

    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}
