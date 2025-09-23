# Maintainer: CoreCat <corecathx@proton.me>
pkgname=whisker-shell-git
pkgver=r36.fc99cbe
pkgrel=1
pkgdesc="Desktop shell built with Quickshell and follows Material 3 Design rules."
arch=('x86_64')
url="https://github.com/corecathx/whisker"
license=('GPL-3.0-only')
depends=(
    'quickshell-git' 'brightnessctl' 'bash' 'haxe' 'power-profiles-daemon' 'cava' 'matugen-bin'
    'networkmanager' 'fish' 'ttf-outfit' 'ttf-material-symbols-variable'
)
makedepends=('git')
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
    haxe release.hxml
}

package() {
    # we install the `whisker` command
    install -Dm755 "$srcdir/whisker-cli/target/cpp/whisker" "$pkgdir/usr/bin/whisker"
    
    # install whisker's quickshell config
    install -dm755 "$pkgdir/usr/share/whisker"
    cp -r "$srcdir/whisker/"* "$pkgdir/usr/share/whisker/"
    
    ## clean up ##
    # .git metadata
    rm -rf "$pkgdir/usr/share/whisker/.git"*
    
    # haxe build artifacts
    rm -rf "$srcdir/whisker-cli/target"
}
