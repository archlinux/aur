# Maintainer: Blaadick <null>

repoowner="Blaadick"
reponame="BlaadPapers"
pkgname="blaadpapers"
pkgdesc="Fast & clean wallpaper manager"
license=("GPL-3.0-only")
pkgver="0.4.0"
pkgrel=1
arch=("any")
depends=(
    "qt6-base"
    "qt6-declarative"
    "qt6-svg"
    "qt6-shadertools"
    "ffmpeg"
    "libvips"
    "nlohmann-json"
    "mpvpaper"
    "bstyle-qml-theme"
)
makedepends=(
    "cmake"
    "ninja"
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/$repoowner/$reponame/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("SKIP")
url="https://github.com/$repoowner/$reponame"
options=("!debug")

build() {
    cd "$reponame-$pkgver" || exit

    cmake -B cmake-build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-w"
    cmake --build cmake-build --parallel
}

package() {
    cd "$reponame-$pkgver" || exit

    install -Dm755 "./cmake-build/gui/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "./cmake-build/cli/${pkgname}cli" "$pkgdir/usr/bin/${pkgname}cli"
    install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "./resource/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "./resource/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
    install -Dm644 "./resource/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

    for size in 8 16 18 22 24 32 36 42 44 48 64 72 84 96 128 256 512 1024; do
        install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        vips thumbnail "./resource/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png" $size
    done
}
