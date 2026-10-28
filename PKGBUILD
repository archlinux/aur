# Maintainer: Jan Claussen <jan dot claussen10 at web dot de>

pkgname=bigscreen-ui-git
_pkgname=bigscreen-ui
pkgver=1.0.0.r70.gc57d02b
pkgrel=1
pkgdesc="Reusable Qt Quick components for TV/console style applications (Plasma Bigscreen)"
arch=('x86_64' 'aarch64')
url="https://invent.kde.org/libraries/bigscreen-ui"
license=('LGPL-2.0-or-later' 'LGPL-2.1-only' 'LGPL-3.0-only' 'CC-BY-SA-4.0')
depends=(
  'gcc-libs'
  'glibc'
  'kcolorscheme'
  'kcoreaddons'
  'ki18n'
  'kirigami'
  'qqc2-desktop-style'
  'qt6-base'
  'qt6-declarative'
)
makedepends=(
  'extra-cmake-modules'
  'git'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://invent.kde.org/libraries/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  _ver=$(sed -nE 's/^project\(bigscreen-ui VERSION ([0-9.]+)\).*/\1/p' CMakeLists.txt)
  printf "%s.r%s.g%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DBUILD_EXAMPLES=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

