# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="citadel-git"
pkgver=r178.a408af5
pkgrel=1
pkgdesc="Manage your ebook library without frustrations. Calibre compatible."
url="https://github.com/every-day-things/citadel"
license=("custom:none")
arch=("x86_64" "aarch64" "armv7h")
provides=("citadel")
conflicts=("citadel")
depends=("webkit2gtk" "gtk3")
makedepends=("bun" "cargo")
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
 # build front-end and back-end
 # Error failed to bundle project: error running appimage.sh 2024-01-14
 bun run build || true
}

package(){
 cd "${pkgname%-git}"
 # use the files used to bundle the .deb package
 cp -r "src-tauri/target/release/bundle/deb/"*"/data/"* "$pkgdir"
}
