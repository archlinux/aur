# Maintainer:
# Contributor: Christoph Sterz <christoph.sterz@kdab.com>

_pkgname="kddockwidgets"
pkgname="$_pkgname-git"
pkgver=2.4.0.r41.ga467f98
pkgrel=1
pkgdesc="Dock Widgets Library by KDAB for Qt6"
url="https://github.com/KDAB/KDDockWidgets"
license=(
  'GPL-2.0-only'
  'GPL-3.0-only'
)
arch=('x86_64')

depends=(
  'qt6-base'
  'qt6-declarative'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'qt6-tools'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=(
  'SKIP'
)

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
    -DKDDockWidgets_EXAMPLES=OFF
    -DKDDockWidgets_FRONTENDS='qtwidgets;qtquick'
    -DKDDockWidgets_NO_SPDLOG=ON
    -DKDDockWidgets_QT6=ON
    -DKDDockWidgets_X11EXTRAS=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
