# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="citadel-git"
pkgver=r201.0ec173e
pkgrel=1
pkgdesc="Manage your ebook library without frustrations. Calibre compatible."
url="https://github.com/every-day-things/citadel"
license=("MIT")
arch=("x86_64" "aarch64" "armv7h")
provides=("citadel")
conflicts=("citadel")
depends=("webkit2gtk" "gtk3")
makedepends=("bun" "cargo")
optdepends=("calibre: initialize ebook library")
source=("git+$url")
b2sums=("SKIP")

pkgver(){
 cd "${pkgname%-git}"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
 cd "${pkgname%-git}"
 export RUSTUP_TOOLCHAIN=stable
 export CARGO_TARGET_DIR=target
 # install dependencies, including tauri and vite
 bun install
 # build front-end and back-end, limiting the targets to a .deb package
 bun run build --bundles deb
}

package(){
 cd "${pkgname%-git}"
 # use the files used to bundle the .deb package
 cp -r "src-tauri/target/release/bundle/deb/"*"/data/"* "$pkgdir"
 install -D -m 664 "LICENSE" -t "$pkgdir/usr/share/licenses/citadel"
}
