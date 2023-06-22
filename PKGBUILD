# Maintainer: Isabel <isabel@isabelroses.com>
pkgname=catppuccinifier-gui-git
_pkgname=catppuccinifier-gui
pkgver=r64.29a1f05
pkgrel=1
pkgdesc="An application to catppuccinifiy your images."
arch=('x86_64')
url="https://github.com/lighttigerXIV/catppuccinifier"
license=()
provides=('catppuccinifier-gui')
conflicts=('catppuccinifier-gui')
depends=('npm' 'cmake' 'libadwaita' 'webkit2gtk' 'base-devel' 'curl' 'wget' 'openssl' 'appmenu-gtk-module' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips')
makedepends=('git' 'cargo')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname/src/catppuccinifier-gui"
    npm ci
    npm run build
    cd "src-tauri"
    cargo build --release
}

package() {
    cd "$pkgname"
    #desktop file
    desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "src/assets/Catppuccinifier.desktop"
    #binary
    install -Dm755 "src/catppuccinifier-gui/src-tauri/target/release/catppuccinifier-gui" "$pkgdir/usr/bin/catppuccinifier-gui"
    #docs
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    #icon
    install -Dm644 "src/assets/catppuccinifier.png" "$pkgdir/usr/share/pixmaps/catppuccinifier.png"
}
