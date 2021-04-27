# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=keepassk-git
pkgver=r1.9bd9801
pkgrel=1
pkgdesc="A Kirigami password manager for KDBX password databases"
arch=(x86_64 aarch64)
url="https://invent.kde.org/tfella/keepassk"
license=(GPL3)
depends=('ki18n' 'kirigami2' 'kcoreaddons' 'qt5-svg')
makedepends=('git' 'extra-cmake-modules' 'corrosion-git')
provides=('keepassk')
conflicts=('keepassk')
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
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "${pkgname%-git}"
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
