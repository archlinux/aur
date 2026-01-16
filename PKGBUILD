# Maintainer: Sasha Marie te Rehorst <sasha.marieterehorst@gmail.com>
# Contributor: Martin Stolpe <martin dot stolpe at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=kuserfeedback
pkgname=kuserfeedback-git
pkgver=6.22.0.r10.ge2a29c6
pkgrel=1
pkgdesc="Framework for collecting user feedback for applications via telemetry and surveys (Qt6) (Git version)"
arch=(x86_64)
url="https://kde.org/products/frameworks/"
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gcc-libs glibc qt6-base)
makedepends=(git extra-cmake-modules qt6-tools clang qt6-charts qt6-svg qt6-declarative)
optdepends=('qt6-declarative: QML bindings'
            'qt6-charts: User Feedback console'
            'qt6-svg: User Feedback console')
conflicts=(kuserfeedback kuserfeedback5)
provides=(kuserfeedback)
replaces=(kuserfeedback5)
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
