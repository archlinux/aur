# Maintainer: Sasha Marie te Rehorst <sasha.marieterehorst@gmail.com>
# Contributor: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kirigami-addons-git
_pkgname=kirigami-addons
pkgver=1.11.0.r6.ge4c4e0c
pkgrel=1
pkgdesc="Add-ons for the Kirigami framework (Git version)"
arch=(x86_64)
url="https://invent.kde.org/libraries/kirigami-addons"
license=(GPL-2.0-or-later LGPL-2.1-or-later)
depends=(gcc-libs glibc kcolorscheme kconfig kcoreaddons kcrash kglobalaccel kguiaddons ki18n kiconthemes kirigami kitemmodels ksvg qt6-base qt6-declarative qt6-multimedia sonnet)
makedepends=(git extra-cmake-modules)
conflicts=(kirigami-addons)
provides=(kirigami-addons)
source=("git+https://invent.kde.org/libraries/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  local _ver
  _ver="$(git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
  if [ -z "$_ver" ]; then
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  else
    echo "$_ver"
  fi
}

build() {
  cmake -B build -S $_pkgname \
    -DBUILD_TESTING=OFF \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
