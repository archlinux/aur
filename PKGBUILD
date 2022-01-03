# Maintainer: Wachid Adi Nugroho <wachidadinugroho.maya@gmail.com>

pkgname=plasma-phone-components-git
_pkgname=${pkgname%-git}
pkgver=v5.22.90.r115.gf849a5f
pkgrel=1
pkgdesc='General UI components for Plasma Phone including shell, containment and applets.'
arch=(x86_64)
url=https://invent.kde.org/plasma/plasma-phone-components
license=(GPL3)
groups=(plasma)
depends=(
  ki18n
  kio
  knotifications
  kservice
  kwayland
  kwin
  modemmanager-qt
  plasma-framework
  qt5-base
  qt5-declarative
)
optdepends=(
  'kauth: Abstraction to system policy and authentication features'
  'kcodecs: Provide a collection of methods to manipulate strings using various encodings'
  'kcoreaddons: Addons to QtCore'
  'kjobwidgets: Widgets for tracking KJob instances'
  'kpackage: Framework that lets applications manage user installable packages of non-binary assets'
  'solid: Hardware integration and detection'
)
makedepends=(cmake extra-cmake-modules git)
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+$url.git)
sha256sums=(SKIP)

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
