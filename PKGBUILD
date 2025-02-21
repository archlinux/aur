# Maintainer:

_pkgname="wrapland"
pkgname="$_pkgname"
pkgver=0.602.0
pkgrel=3
pkgdesc='Qt/C++ library wrapping libwayland (kwinft)'
url="https://github.com/winft/wrapland"
license=('LGPL-2.1-only')
arch=('x86_64' 'aarch64')

depends=(
  libglvnd
  qt6-base
  wayland
)
makedepends=(
  doxygen
  extra-cmake-modules
  git
  microsoft-gsl
  ninja
  wayland-protocols
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('553f655cc82dd82b2015f28d41e22b0f51a5d6dff6cf4605b589a2a2bee74b6a')

prepare() {
  sed -E -e '/^typedef uint/d' \
    -i "$_pkgsrc"/extern/drm_fourcc.h
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
