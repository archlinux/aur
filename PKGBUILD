# Maintainer: psychosomat <hello@ddark.dev>

pkgname=openscreen-git
pkgver=r500.e7d5f51
pkgrel=1
pkgdesc="Create stunning demos for free. Open-source, no subscriptions, no watermarks, and free for commercial use. An alternative to Screen Studio."
arch=('x86_64')
url="https://github.com/getopenscreen/openscreen"
license=('MIT')
depends=('fuse')
makedepends=('git' 'nodejs' 'npm')
conflicts=('openscreen' 'openscreen-appimage' 'openscreen-bin')
options=(!strip !debug)
source=("openscreen-git::git+https://github.com/getopenscreen/openscreen" "openscreen" "openscreen.desktop" "Build_AppImage_Only.patch")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/openscreen-git"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/openscreen-git"
    patch -p1 < "$srcdir/Build_AppImage_Only.patch"
    npm i
}

build() {
    cd "$srcdir/openscreen-git"
    npm run build

    app=$(find release -regex ".*\.AppImage" | head -n1)
    appdir=$(dirname "$app")

    echo "==> Extracting AppImage..."
    chmod +x "$app"
    (
        cd "$appdir"
        "$app" --appimage-extract > /dev/null
    )
}

package() {
    cd "$srcdir/openscreen-git"

    app=$(find release -regex ".*\.AppImage" | head -n1)
    appdir=$(dirname "$app")

    install -Dm755 "$srcdir/openscreen" "$pkgdir/usr/bin/openscreen"
    install -Dm755 "$app" "$pkgdir/opt/openscreen/Openscreen.AppImage"
    install -Dm755 "$srcdir/openscreen.desktop" "$pkgdir/usr/share/applications/openscreen.desktop"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/openscreen-git/LICENSE"

    icon_types="16 24 32 48 64 128 256 512 1024"
    for num in $icon_types; do
        install -Dm644 \
            "$appdir/squashfs-root/usr/share/icons/hicolor/${num}x${num}/apps/openscreen.png" \
            "$pkgdir/usr/share/icons/hicolor/${num}x${num}/apps/openscreen.png"
    done
}
