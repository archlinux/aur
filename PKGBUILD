# Maintainer: Blaadick <null>

pkgname="blaadpapers-git"
pkgdesc="Fast & clean wallpaper manager (latest commit from master)"
url="https://github.com/Blaadick/BlaadPapers"
license=("GPL-3.0-or-later")
pkgver="0.5.0.r0.g3015815"
pkgrel=1
arch=("x86_64")
depends=(
    "qt6-base"
    "qt6-declarative"
    "qt6-svg"
    "qt6-imageformats"
    "curl"
    "yyjson"
    "libvips"
    "ffmpeg"
    "mpvpaper"
    "bstyle"
)
makedepends=(
    "git"
    "cmake"
    "ninja"
    "imageinfo"
)
provides=("blaadpapers")
conflicts=("blaadpapers")
source=("blaadpapers::git+$url.git")
sha512sums=("SKIP")

pkgver() {
    cd "blaadpapers"

    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "blaadpapers"

    cmake -B cmake-build-release-linux -S . -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-w"
    cmake --build cmake-build-release-linux --parallel
}

package() {
    cd "blaadpapers"

    install -Dm755 "cmake-build-release-linux/gui/blaadpapers" "$pkgdir/usr/bin/blaadpapers"
    install -Dm755 "cmake-build-release-linux/cli/blaadpaperscli" "$pkgdir/usr/bin/blaadpaperscli"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "gui/resource/blaadpapers.desktop" "$pkgdir/usr/share/applications/blaadpapers.desktop"
    install -Dm644 "cli/resource/blaadpapers-install.desktop" "$pkgdir/usr/share/applications/blaadpapers-install.desktop"
    install -Dm644 "cli/resource/blaadpapers-url.desktop" "$pkgdir/usr/share/applications/blaadpapers-url.desktop"
    install -Dm644 "cli/resource/blaadpaperscli.fish" "$pkgdir/usr/share/fish/vendor_completions.d/blaadpaperscli.fish"
    install -Dm644 "cli/resource/blaadpaperscli.zsh" "$pkgdir/usr/share/zsh/site-functions/_blaadpaperscli"
    install -Dm644 "shared/resource/blaadpapers.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/blaadpapers.svg"

    for size in 8 16 18 22 24 32 36 42 44 48 64 72 84 96 128 256 512 1024; do
        install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        vips thumbnail "shared/resource/blaadpapers.svg" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/blaadpapers.png" $size
    done
}
