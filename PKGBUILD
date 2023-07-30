# Maintainer: Jan0660 <jan0660@tutanota.com>
pkgname=kittygifs-git
pkgdesc="A tool to optimize your gifkittyposting, and of course posting of other gifs."
pkgver() {
  cd "kittygifs"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r73.8dddf6e
pkgrel=1
arch=("x86_64")
url="https://github.com/Jan0660/kittygifs"
license=("AGPL3")
groups=()
provides=("kittygifs")
conflicts=("kittygifs")
makedepends=("pnpm" "base-devel" "curl" "wget" "file" "openssl" "librsvg" "libvips" "git" "cargo" "rust" "gtk3" "libappindicator-gtk3" "appmenu-gtk-module" "webkit2gtk-4.1")
depends=("webkit2gtk-4.1" "appmenu-gtk-module" "gtk3" "libappindicator-gtk3")
optdepends=("xdotool: for automatic posting on Xorg" "ydotool: for automatic posting on Wayland(and Xorg)")
source=("git+https://github.com/Jan0660/kittygifs.git")
sha256sums=("SKIP")

package() {
    cd "$srcdir/kittygifs/frontend"
    # wipe bundles dir just to be sure
    rm -rf "$srcdir/kittygifs/frontend/bundles"
    pnpm install --frozen-lockfile
    pnpm build
    pnpm exec tauri build --bundles deb --config "{\"build\": {\"devPath\": \"./\", \"distDir\": \"$srcdir/kittygifs/frontend/dist\"}}"
    # extract the deb package(without relying on version) and its data.tar.gz
    cd "$srcdir/kittygifs/frontend/src-tauri/target/release/bundle/deb"
    ar x kittygifs_*.deb
    tar -xf data.tar.gz -C "$pkgdir"
    chmod +x $pkgdir/usr/bin/kittygifs
}
