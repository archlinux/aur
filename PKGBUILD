# Maintainer: Andrew Rabert <ar@nullsum.net>
pkgname=jellyfin-desktop-git
pkgver=0.r408.bdd2dc0
pkgrel=2
epoch=1
license=('GPL-2.0-only')
pkgdesc="Jellyfin Desktop Client"
arch=('x86_64')
url="https://github.com/jellyfin/jellyfin-desktop"
depends=(
    'cef'
    'jellyfin-desktop-libmpv-git'
    'systemd-libs'
)
makedepends=(
    'cmake'
    'git'
    'ninja'
    'plasma-wayland-protocols'
    'python'
    'vulkan-headers'
    'wayland-protocols'
)
provides=('jellyfin-desktop')
conflicts=('jellyfin-desktop')
replaces=('jellyfin-desktop-cef-git')
source=("git+${url}.git")
sha256sums=('SKIP')
options=(!debug)

pkgver() {
    cd jellyfin-desktop
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd jellyfin-desktop

    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DEXTERNAL_MPV_DIR=/opt/jellyfin-desktop/libmpv

    cmake --build build
}

package() {
    cd jellyfin-desktop

    # Pin cef dependency to the exact version used at build time.
    # The wrapper is statically linked, so the API hash baked into the binary
    # must match the runtime libcef.so — a version mismatch causes a fatal error.
    local _cef_ver
    _cef_ver=$(pacman -Q cef | awk '{print $2}')
    depends+=("cef=${_cef_ver}")

    install -dm755 "$pkgdir/opt/jellyfin-desktop"

    # Main binary
    install -m755 build/jellyfin-desktop "$pkgdir/opt/jellyfin-desktop/"

    # Symlink to /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/jellyfin-desktop/jellyfin-desktop "$pkgdir/usr/bin/jellyfin-desktop"

    # Icon
    install -Dm644 resources/linux/org.jellyfin.JellyfinDesktop.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.jellyfin.JellyfinDesktop.svg"

    # Desktop entry
    install -Dm644 resources/linux/org.jellyfin.JellyfinDesktop.desktop \
        "$pkgdir/usr/share/applications/org.jellyfin.JellyfinDesktop.desktop"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
