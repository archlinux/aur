# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=smaragd-git
pkgver=v0.1.1.r39.g55e13e7
pkgrel=1
pkgdesc="KWin plugin to support Emerald themes in KDE"
arch=(x86_64)
url="https://invent.kde.org/plasma/smaragd"
license=(GPL3)
depends=('kconfig' 'kcoreaddons' 'ki18n' 'kwidgetsaddons' 'kdecoration' 'glib2' 'cairo')
makedepends=('git' 'extra-cmake-modules')
optdepends=('emerald-themes: extra themes')
provides=('smaragd')
conflicts=('smaragd')
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
