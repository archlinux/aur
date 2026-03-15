# Maintainer: Andrew Rabert <ar@nullsum.net>
pkgname=jellyfin-desktop-cef-git
pkgver=0.r272.21c63ec
pkgrel=1
license=('GPL-2.0-only')
pkgdesc="Experimental rewrite of Jellyfin Desktop built on CEF"
arch=('x86_64')
url="https://github.com/jellyfin-labs/jellyfin-desktop-cef"
depends=(
    'jellyfin-desktop-cef-libcef-bin'
    'jellyfin-desktop-cef-libmpv-git'
    'sdl3'
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
provides=('jellyfin-desktop-cef')
conflicts=('jellyfin-desktop-cef')
source=("git+${url}.git")
sha256sums=('SKIP')
options=(!debug)

pkgver() {
    cd jellyfin-desktop-cef
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd jellyfin-desktop-cef

    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DEXTERNAL_CEF_DIR=/opt/jellyfin-desktop-cef/libcef \
        -DEXTERNAL_MPV_DIR=/opt/jellyfin-desktop-cef/libmpv

    cmake --build build
}

package() {
    cd jellyfin-desktop-cef

    install -dm755 "$pkgdir/opt/jellyfin-desktop-cef"

    # Main binary
    install -m755 build/jellyfin-desktop-cef "$pkgdir/opt/jellyfin-desktop-cef/"

    # Symlink to /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/jellyfin-desktop-cef/jellyfin-desktop-cef "$pkgdir/usr/bin/jellyfin-desktop-cef"

    # Icon
    install -Dm644 resources/linux/org.jellyfin.JellyfinDesktopCEF.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.jellyfin.JellyfinDesktopCEF.svg"

    # Desktop entry
    install -Dm644 resources/linux/org.jellyfin.JellyfinDesktopCEF.desktop \
        "$pkgdir/usr/share/applications/org.jellyfin.JellyfinDesktopCEF.desktop"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
