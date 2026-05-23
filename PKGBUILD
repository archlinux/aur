# Maintainer: AImixAE <AImixAE[at]outlook[dot]com>

pkgname=openscreen-bin
pkgver=1.4.0
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
    "Build_AppImage_Only.patch"
)
sha256sums=('bcf638edc983a3b23c0c39ac422108348ea6efc24b7faa29912d62b6f86d0572' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

_find_appimage() {
    app="release/$pkgver/Openscreen-Linux-$pkgver.AppImage"
    [[ ! -f "$app" ]] && app=$(find $srcdir/openscreen-$pkgver/release -regex ".*\.AppImage")

    echo $app
}

prepare() {
    patch -p0 < Build_AppImage_Only.patch

    (
        cd "openscreen-$pkgver"
        npm i
    )

    # if [[ -d "openscreen-$pkgver/release" ]]; then
    #     echo "==> Clearing release dir"
    #     rm -r "openscreen-$pkgver/release"
    # fi
}

build() {
    (
        cd "openscreen-$pkgver"
        npm run build
    )

    app=$(_find_appimage)
    appdir=$(dirname $app)

    echo "==> Extracting AppImage..."
    chmod +x "$app"
    (
        cd "$appdir"
        "$app" --appimage-extract > /dev/null
    )
}

check() {
    app=$(_find_appimage)
    appdir=$(dirname $app)

    [[ -f "$app" ]]
}

package() {
    app=$(_find_appimage)
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
