#Maintainer: doyouevensheesh <dheerajre@proton.me>
pkgname=clippy-git
# Defined by function
pkgver=r93.0d8c850
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
    '143f5ca84f8496055b33e9fb03dff24edb948a5e144cefed4cf6fe3dbf6e1eb4'
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

    mkdir -p "$pkgdir/usr/share/clippy/node_modules"
    cp -r "$pkgname/node_modules/node-llama-cpp" "$pkgdir/usr/share/clippy/node_modules/"

    install -Dm 755 "clippy-launcher.sh" "$pkgdir/usr/bin/clippy"
    install -Dm 644 "clippy.desktop" "$pkgdir/usr/share/applications/clippy.desktop"

    install -Dm 644 "$pkgname/assets/icon.png" "$pkgdir/usr/share/pixmaps/clippy.png"

}
