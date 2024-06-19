# Maintainer: Bart Libert <bart plus aur at libert dot email>
pkgname=xdg-desktop-portal-termfilechooser-fix-for-lf-git
pkgver=r11.6acc64b
pkgrel=1
pkgdesc='xdg-desktop-portal backend for your favorite terminal file chooser with fix for lf'
url="https://github.com/boydaihungst/xdg-desktop-portal-termfilechooser"
arch=('x86_64')
license=('MIT')
provides=('xdg-desktop-portal-impl')
depends=('xdg-desktop-portal' 'libinih')
makedepends=('meson' 'scdoc' 'git')
optdepends=(
    'lf: for choosing files'
    'kitty: default terminal for launching ranger'
)
source=(
    "${pkgname}::git+$url.git#branch=fix-for-lf"
)
sha512sums=('SKIP')
conflicts=(xdg-desktop-portal-termfilechooser-git)

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
