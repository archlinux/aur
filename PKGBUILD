# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="citadel-git"
pkgver=r196.8cf1dd2
pkgrel=1
pkgdesc="Manage your ebook library without frustrations. Calibre compatible."
url="https://github.com/every-day-things/citadel"
license=("MIT")
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

pepare(){
 cd "${pkgname%-git}"
 # explicitely build a deb package https://tauri.app/v1/guides/building/linux/#prerequisites
 sed -i "src-tauri/tauri.conf.json" \
     -e 's|"targets": .*,|"targets": ["deb"],|'
}

build(){
 cd "${pkgname%-git}"
 export RUSTUP_TOOLCHAIN=stable
 export CARGO_TARGET_DIR=target
 # install dependencies, including tauri and vite
 bun install
 # build front-end and back-end
 bun run build
}

package(){
 cd "${pkgname%-git}"
 # use the files used to bundle the .deb package
 cp -r "src-tauri/target/release/bundle/deb/"*"/data/"* "$pkgdir"
 install -D -m 664 "LICENSE" -t "$pkgdir/usr/share/licenses/citadel"
}
