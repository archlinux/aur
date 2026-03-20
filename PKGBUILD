# Maintainer: AImixAE <AImixAE[at]outlook[dot]com>

pkgname=openscreen-git
pkgver=r372.dd0b7d6
pkgrel=1
pkgdesc="Create stunning screen recordings for free. Open-source, no subscriptions, no watermarks, and free for commercial use. An alternative to Screen Studio."
arch=('x86_64')
url="https://github.com/siddharthvaddem/openscreen"
license=('MIT')
depends=('fuse')
makedepends=('git' 'nodejs' 'npm')
provides=()
conflicts=('openscreen-appimage' 'openscreen-bin')
options=(!strip !debug)
source=("openscreen-git::git+$url" "openscreen" "openscreen.desktop")
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/openscreen-git"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/openscreen-git"
    npm i

    if [[ -d "openscreen-$pkgver/release" ]]; then
        rm -rv "openscreen-$pkgver/release"
    fi
}

build() {
    cd "$srcdir/openscreen-git"
    npm run build

    app=$(find $srcdir/openscreen-git/release -regex ".*\.AppImage")
    appdir=$(dirname $app)

    chmod +x "$app"
    (
        cd "$appdir"
        "$app" --appimage-extract
    )
}

check() {
    app=$(find $srcdir/openscreen-git/release -regex ".*\.AppImage")
    appdir=$(dirname $app)

    [[ -f "$app" ]]
}

package() {
    app=$(find $srcdir/openscreen-git/release -regex ".*\.AppImage")
    appdir=$(dirname $app)

    install -Dm755 "$srcdir/openscreen" "$pkgdir/usr/bin/openscreen"
    install -Dm755 "$app" "$pkgdir/opt/openscreen/Openscreen.AppImage"
    install -Dm755 "$srcdir/openscreen.desktop" "$pkgdir/usr/share/applications/openscreen.desktop"

    icon_types="16 24 32 48 64 128 256 512 1024"
    for num in $icon_types; do
        install -Dm644 \
            "$appdir/squashfs-root/usr/share/icons/hicolor/${num}x${num}/apps/openscreen.png" \
            "$pkgdir/usr/share/icons/hicolor/${num}x${num}/apps/openscreen.png"
    done
}
