# Maintainer:

_pkgname="disman"
pkgname="$_pkgname"
pkgver=0.602.0
pkgrel=1
pkgdesc='Qt/C++ display management library (kwinft)'
url="https://github.com/winft/disman"
license=('LGPL-2.1-only')
arch=('x86_64' 'aarch64')

depends=(
  kcoreaddons
  kwayland
  qt6-base
  wrapland # AUR
)
makedepends=(
  extra-cmake-modules
  git
  microsoft-gsl
  ninja
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('52b0ad142d5b127b0fccc4ac0574381eb116f108391d8c3af7e1cd6d9c687602')

prepare() {
  sed -E \
    -e 's&^(find_package\(KF6)&find_package(KWayland)\n\1&' \
    -e 's&TYPE OPTIONAL&TYPE REQUIRED&' \
    -e '/^\s*Wayland$/d' \
    -e 's&KF6Wayland&KWayland&' \
    -i "$_pkgsrc/CMakeLists.txt"

  cat -n "$_pkgsrc/CMakeLists.txt"
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
