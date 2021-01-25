# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=pikasso-git
pkgver=r18.45e8709
pkgrel=2
pkgdesc="Simple drawing programs using Kirigami for the UI and Rust for the rendering"
arch=('x86_64')
url="https://invent.kde.org/graphics/pikasso"
license=('GPL3')
depends=('ki18n' 'kconfig' 'kirigami2')
makedepends=('git' 'extra-cmake-modules' 'corrosion-git')
provides=('pikasso')
conflicts=('pikasso')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname%-git}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
  make -C build
}

package() {
  cd "${pkgname%-git}"
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}