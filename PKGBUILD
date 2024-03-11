# Maintainer: Bart De Vries <bart at mogwai dot be>
# Contributor: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kasts-git
pkgver=24.04.70_r1549.g3f1440ae
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
pkgdesc="Kirigami-based podcast player"
url="https://invent.kde.org/multimedia/kasts"
license=('GPL2')
depends=('qt6-multimedia' 'qt6-declarative' 'qtkeychain-qt6' 'kirigami' 'ki18n'
         'kconfig' 'kcoreaddons' 'syndication' 'taglib' 'threadweaver' 'vlc'
         'kirigami-addons')
makedepends=('extra-cmake-modules' 'git' 'qt6-svg' 'qt6-tools')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    _major_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MAJOR' CMakeLists.txt | cut -d '"' -f2)"
    _minor_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MINOR' CMakeLists.txt | cut -d '"' -f2)"
    _micro_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MICRO' CMakeLists.txt | cut -d '"' -f2)"
    echo "${_major_ver}.${_minor_ver}.${_micro_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_MAJOR_VERSION=6 \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -B build \
    -S "${pkgname%-git}"
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
}
