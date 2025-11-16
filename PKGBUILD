# Maintainer: CoreCat <corecathx@proton.me>
pkgname=whisker-shell-git
pkgver=r47.7cd15a7
pkgrel=1
pkgdesc="Desktop shell built with Quickshell and follows Material 3 Design rules."
arch=('x86_64')
url="https://github.com/corecathx/whisker"
license=('GPL-3.0-only')
depends=(
    'quickshell' 'brightnessctl' 'bash' 'power-profiles-daemon' 'cava' 'matugen-bin'
    'networkmanager' 'fish' 'ttf-outfit' 'ttf-material-symbols-variable' 'qt6-multimedia-ffmpeg'
    'qt6ct' 'mpvpaper'
)
makedepends=('git' 'haxe' 'bluez')
provides=('whisker-shell' 'whisker')
conflicts=('whisker-shell' 'whisker')
source=(
    "whisker::git+https://github.com/corecathx/whisker.git"
    "whisker-cli::git+https://github.com/corecathx/whisker-cli.git"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/whisker"
    if git describe --tags --long >/dev/null 2>&1; then
        git describe --tags --long | sed 's/^v//; s/-/./g'
    else
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "$srcdir/whisker-cli"
    echo "  -> change directory: $PWD"

    export HAXELIB_PATH="$srcdir/haxelib"
    echo "  -> set HAXELIB_PATH to $HAXELIB_PATH"

    mkdir -p "$HAXELIB_PATH"
    echo "  -> create HAXELIB_PATH directory"

    echo "  -> haxelib install hxcpp --always --quiet"
    haxelib install hxcpp --always --quiet

    echo "  -> starting haxe build"
    haxe release.hxml
}

package() {
    # install whisker binary
    install -Dm755 "$srcdir/whisker-cli/target/cpp/whisker" "$pkgdir/usr/bin/whisker"

    # install whisker's quickshell config
    install -dm755 "$pkgdir/usr/share/whisker"
    cp -r "$srcdir/whisker/"* "$pkgdir/usr/share/whisker/"

    ## cleanup
    rm -rf "$pkgdir/usr/share/whisker/.git"*
    rm -rf "$srcdir/whisker-cli/target"
}
