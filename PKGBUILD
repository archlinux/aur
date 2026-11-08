# Maintainer: Giovanni Scafora <scafora.giovanni@gmail.com>

pkgname=leolink-git
pkgver=0.3.0+r11+ge8f66fc
pkgrel=1
pkgdesc="Native Linux client for Reolink cameras: live view, motion alerts, recording - git version"
arch=('x86_64')
url="https://github.com/tombueng/leolink"
license=('MIT')
depends=('qtkeychain-qt6' 'mpv' 'hicolor-icon-theme')
makedepends=('git' 'qt6-svg' 'cmake' 'ninja' 'qt6-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('leolink::git+https://github.com/tombueng/leolink.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/+/g' ||
      printf "r%s+%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
    cmake -S "${pkgname%-git}" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

check() {
    cmake --build build --target validate-metadata
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "${pkgname%-git}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
