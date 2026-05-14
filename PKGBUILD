# Maintainer: GGORG <me at ggorg dot xyz>

pkgname=hypr-kdeconnect-fix-git
_pkgname=${pkgname%-git}
pkgver=r11.ea55f66
pkgrel=1
pkgdesc="RemoteDesktop portal bridge for KDE Connect remote input on Hyprland"
arch=('x86_64')
url="https://github.com/gfhdhytghd/hypr-kdeconnect-fix"
license=('MIT')
depends=('xdg-desktop-portal' 'qt6-base>=6.5' 'wayland>=1.20' 'libxkbcommon>=1.5' 'libei>=1.4')
makedepends=('git' 'cmake' 'ninja')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cmake -S "${srcdir}/${_pkgname}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
