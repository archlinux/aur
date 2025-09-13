# Maintainer: hunkyburrito <hunkyburrito@protonmail.com>
pkgname=xdg-desktop-portal-termfilechooser-hunkyburrito-git
pkgver=v1.2.1.r0.g51d5c15
pkgrel=1
pkgdesc='xdg-desktop-portal backend for your favorite terminal file chooser (hunkyburrito fork)'
url="https://github.com/hunkyburrito/xdg-desktop-portal-termfilechooser"
arch=('x86_64')
license=('MIT')
provides=('xdg-desktop-portal-impl')
depends=('xdg-desktop-portal' 'libinih')
makedepends=('meson' 'scdoc' 'git')
optdepends=(
    'kitty: default terminal for launching wrappers'
    'lf: wrapper included'
    'nnn: wrapper included'
    'ranger: wrapper included'
    'vifm: wrapper included'
    'yazi: wrapper included'
)
source=(
    "${pkgname}::git+$url.git"
)
sha512sums=('SKIP')
conflicts=(xdg-desktop-portal-termfilechooser-git xdg-desktop-portal-termfilechooser-boydaihungst-git xdg-desktop-portal-termfilechooser-nosystemd-git)

pkgver () {
    cd "${pkgname}"
    (
         set -o pipefail
         git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
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
