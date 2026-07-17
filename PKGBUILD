# Maintainer: Andrew Rabert <ar@nullsum.net>
pkgname=jellium-desktop-git
pkgver=0.r1069.e672351
pkgrel=1
license=('GPL-2.0-only')
pkgdesc="A Jellyfin Desktop Client"
arch=('x86_64')
url="https://github.com/andrewrabert/jellium-desktop"
depends=(
    'cef'
    'libglvnd'
    'libxcb'
    'libxkbcommon'
    'libxkbcommon-x11'
    'mpv'
    'wayland'
    'xdg-utils'
)
makedepends=(
    'clang'
    'git'
    'rust'
)
provides=('jellium-desktop')
conflicts=('jellium-desktop')
source=("git+${url}.git")
sha256sums=('SKIP')
options=(!debug !lto)

pkgver() {
    cd jellium-desktop
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd jellium-desktop
    cargo xtask build \
        --cef-path /usr/lib/cef \
        --external-mpv /usr \
        --out build
}

package() {
    cd jellium-desktop

    # Main binary
    install -Dm755 build/jellium-desktop "$pkgdir/usr/bin/jellium-desktop"

    # Icon
    install -Dm644 resources/linux/net.nullsum.JelliumDesktop.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/net.nullsum.JelliumDesktop.svg"

    # Desktop entry
    install -Dm644 resources/linux/net.nullsum.JelliumDesktop.desktop \
        "$pkgdir/usr/share/applications/net.nullsum.JelliumDesktop.desktop"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
