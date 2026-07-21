_repoowner="Blaadick"
_reponame="BlaadPapers"

pkgname="blaadpapers"
pkgdesc="Fast & clean wallpaper manager"
license=("GPL-3.0-only")
pkgver="0.4.3"
pkgrel=1
arch=("any")
depends=(
    "qt6-base"
    "qt6-declarative"
    "qt6-svg"
    "libvips"
    "ffmpeg"
    "nlohmann-json"
    "mpvpaper"
    "bstyle-qml-theme"
)
makedepends=(
    "cmake"
    "ninja"
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_repoowner/$_reponame/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("b032c722281e2259c90cdfa59cb1a819aaf845b4651b7b0d87b513fdc68c147869b913ca6ecccfa31e8fd7e6d317afd1e0ee3de8406c08f3811d3922add72dcb")
url="https://github.com/$_repoowner/$_reponame"

build() {
    cd "$_reponame-$pkgver"

    cmake -B "cmake-build" -S . -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-w"
    cmake --build "cmake-build" --parallel
}

package() {
    cd "$_reponame-$pkgver"

    install -Dm755 "cmake-build/gui/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "cmake-build/cli/${pkgname}cli" "$pkgdir/usr/bin/${pkgname}cli"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "resource/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "resource/$pkgname-url.desktop" "$pkgdir/usr/share/applications/$pkgname-url.desktop"
    install -Dm644 "resource/${pkgname}cli.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}cli.fish"
    install -Dm644 "resource/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

    for size in 8 16 18 22 24 32 36 42 44 48 64 72 84 96 128 256 512 1024; do
        install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        vips thumbnail "resource/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png" $size
    done
}
