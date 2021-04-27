# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasmatube-git
pkgver=r60.630fd5e
pkgrel=1
pkgdesc="Kirigami YouTube video player based on libmpv and youtube-dl"
arch=(x86_64 aarch64)
url="https://invent.kde.org/lnj/plasmatube"
license=(GPL3)
depends=('ki18n' 'kirigami2' 'qt5-svg' 'youtube-dl' 'mpv')
makedepends=('git' 'extra-cmake-modules')
provides=('plasmatube')
conflicts=('plasmatube')
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
