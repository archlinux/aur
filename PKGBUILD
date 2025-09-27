# Maintainer: Blaadick <null>

repoowner="Blaadick"
reponame="BlaadPapers"
pkgname="blaadpapers"
pkgdesc="Fast & clean wallpaper manager"
license=("MIT")
pkgver="0.2.0"
pkgrel=1
arch=("any")
depends=("qt6-base" "hyprpaper")
makedepends=("cmake" "ninja" "librsvg")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$repoowner/$reponame/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("SKIP")
url="https://github.com/$repoowner/$reponame"
options=("!debug")

build() {
    cd "$reponame-$pkgver" || exit
    cmake -B cmake-build-release -G Ninja -DCMAKE_BUILD_TYPE=Release
    cmake --build cmake-build-release -j "$(nproc --ignore=2)"
}

package() {
    cd "$reponame-$pkgver" || exit

    install -Dm755 "./cmake-build-release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "./resource/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "./resource/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
    install -Dm644 "./resource/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

    for size in 16 22 24 32 36 48 64 72 96 128 192 256 384 512; do
        install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        rsvg-convert -w $size -h $size -o "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png" "./resource/$pkgname.svg"
    done
}
