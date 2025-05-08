#Maintainer: doyouevensheesh <dheerajre@proton.me>
pkgname=clippy-git
# Defined by function
pkgver=r97.99dedd8
pkgrel=1
pkdesc="Run a variety of large language models locally on your computer while sticking with a user interface of the 1990s."
arch=("x86_64" "aarch64")
url="https://github.com/felixrieseberg/clippy"
license=("unknown")
depends=("electron")
makedepends=("git" "nodejs" "npm")
checkdepends=()
provides=(clippy)

source=(
    "$pkgname::git+${url}.git"
    "clippy.desktop"
    "clippy-launcher.sh"
    "clippy.patch"
)
sha256sums=(
    'SKIP'
    'a8ade25f0b460a626d1a85e84280262b79455089835a669386da25f84b1b97bc'
    'e54087cd955e20be54b58a24735bbf2eac4da0e819cb7bf46080713d0328c9fc'
    '79f630394bd05b6860b6ce23c3704be245d7ec50c315fa241198a8b11dfccca5'
)
pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    patch -p1 -i "$srcdir/clippy.patch"
}

build() {
    cd "$pkgname"
    npm install 
    npm run make
}

package() {
    cd "$srcdir"

    install -Dm 644 "$pkgname/out/Clippy-linux-x64/resources/app.asar" "$pkgdir/usr/share/clippy/app.asar"

    cp -r "$pkgname/out/Clippy-linux-x64/resources/app.asar.unpacked" "$pkgdir/usr/share/clippy/"

    install -Dm 755 "clippy-launcher.sh" "$pkgdir/usr/bin/clippy"
    install -Dm 644 "clippy.desktop" "$pkgdir/usr/share/applications/clippy.desktop"

    install -Dm 644 "$pkgname/assets/icon.png" "$pkgdir/usr/share/pixmaps/clippy.png"

}
