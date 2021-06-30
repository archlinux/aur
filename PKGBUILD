# Maintainer: Germain Z. <https://github.com/GermainZ>
pkgname=xdg-desktop-portal-termfilechooser-git
pkgver=r1.53ac508
pkgrel=1
pkgdesc='xdg-desktop-portal backend for your favorite terminal file chooser'
url="https://github.com/GermainZ/xdg-desktop-portal-termfilechooser"
arch=('x86_64')
license=('MIT')
provides=('xdg-desktop-portal-impl')
depends=('xdg-desktop-portal' 'libinih')
makedepends=('meson' 'scdoc')
optdepends=(
    'ranger: default for choosing files'
    'kitty: default terminal for launching ranger'
)
source=(
    "${pkgname}::git+https://github.com/GermainZ/xdg-desktop-portal-termfilechooser.git"
)
sha512sums=('SKIP')

pkgver () {
    cd "${pkgname}"
    (
         set -o pipefail
         git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${pkgname}"
    arch-meson -Dsd-bus-provider=libsystemd build
    ninja -C build
}

package() {
    cd "${pkgname}"
    DESTDIR="${pkgdir}" ninja -C build install
    install -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE
}
