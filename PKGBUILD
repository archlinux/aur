# Maintainer: AImixAE <AImixAE[at]outlook[dot]com>

pkgname=openscreen-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Create stunning screen recordings for free. Open-source, no subscriptions, no watermarks, and free for commercial use. An alternative to Screen Studio."
arch=('any')
url="https://github.com/siddharthvaddem/openscreen"
license=('MIT')
groups=()
depends=('fuse')
makedepends=('nodejs' 'npm')
optdepends=()
provides=()
conflicts=('openscreen-appimage')
options=(!debug !strip)
source=(
    "openscreen-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "$url/raw/refs/heads/main/LICENSE"
    "openscreen.desktop"
    "openscreen"
)
sha256sums=('d9bc4d43242533cf15a0c10f8d2e527c95bccf8a2a28b7b88f39a632adfbc327' 'SKIP' 'SKIP' 'SKIP')

prepare() {
    (
        cd "openscreen-$pkgver"
        npm i
    )

    if [[ -d "openscreen-$pkgver/release" ]]; then
        echo "==> Clearing release dir"
        rm -r "openscreen-$pkgver/release"
    fi
}

build() {
    (
        cd "openscreen-$pkgver"
        npm run build
    )

    app=$(find $srcdir/openscreen-$pkgver/release -regex ".*\.AppImage")
    appdir=$(dirname $app)

    chmod +x "$app"
    (
        cd "$appdir"
        "$app" --appimage-extract
    )
}

check() {
    app=$(find $srcdir/openscreen-$pkgver/release -regex ".*\.AppImage")
    appdir=$(dirname $app)

    [[ -f "$app" ]]
}

package() {
    app=$(find $srcdir/openscreen-$pkgver/release -regex ".*\.AppImage")
    appdir=$(dirname $app)

    install -Dm755 "$srcdir/openscreen" "$pkgdir/usr/bin/openscreen"
    install -Dm755 "$app" "$pkgdir/opt/openscreen/Openscreen.AppImage"
    install -Dm755 "$srcdir/openscreen.desktop" "$pkgdir/usr/share/applications/openscreen.desktop"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/openscreen/LICENSE"

    icon_types="16 24 32 48 64 128 256 512 1024"
    for num in $icon_types; do
        install -Dm644 \
            "$appdir/squashfs-root/usr/share/icons/hicolor/${num}x${num}/apps/openscreen.png" \
            "$pkgdir/usr/share/icons/hicolor/${num}x${num}/apps/openscreen.png"
    done
}
