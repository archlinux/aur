# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=tok-git
pkgver=r98.dce4c63
pkgrel=1
pkgdesc="Telegram client built using Kirigami"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/network/tok"
license=('GPL3')
depends=('kirigami2' 'knotifications' 'libtd-git' 'ki18n' 'icu')
makedepends=('git' 'extra-cmake-modules')
provides=('tok')
conflicts=('tok')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -B build -S "${pkgname%-git}" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
  install -Dm644 "${pkgname%-git}"/app\ data/icons/48/org.kde.Tok.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/org.kde.Tok.svg
  install -Dm644 "${pkgname%-git}"/app\ data/org.kde.Tok.desktop "${pkgdir}"/usr/share/applications/org.kde.Tok.desktop
  install -Dm644 "${pkgname%-git}"/app\ data/org.kde.Tok.notifyrc "${pkgdir}"/usr/share/knotifications5/org.kde.Tok.notifyrc
}
