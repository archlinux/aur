# Maintainer: AImixAE <AImixAE[at]outlook[dot]com>

pkgname=openscreen-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Create stunning screen recordings for free. Open-source, no subscriptions, no watermarks, and free for commercial use. An alternative to Screen Studio."
arch=('any')
url="https://github.com/siddharthvaddem/openscreen"
license=('MIT')
groups=()
depends=('fuse')
makedepends=('nodejs' 'pnpm')
optdepends=()
provides=()
conflicts=('openscreen-appimage')
options=(!debug !strip)
source=(
    "openscreen.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "$url/raw/refs/heads/main/LICENSE"
    "openscreen.desktop"
    "openscreen"
)
sha256sums=('ea95cd708c13b4ea2ff2ec8bf7edfca10f2f3f7d95f638d455fa2130db7f5744' 'SKIP' 'SKIP' 'SKIP')

prepare() {
	(
        cd "openscreen-$pkgver"
        pnpm i
	)

	if [[ -d "openscreen-$pkgver/release" ]]; then
        echo "==> Clearing release dir"
        rm -r "openscreen-$pkgver/release"
    fi
}

build() {
	(
        cd "openscreen-$pkgver"
        pnpm run build
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
