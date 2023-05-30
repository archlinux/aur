# Maintainer: Isabel <isabel@isabelroses.com>
pkgname=catppuccinifier-gui-git
_pkgname=catppuccinifier-gui
pkgver=r58.6253fbe
pkgrel=1
pkgdesc="An application to catppuccinifiy your images."
arch=('x86_64')
url="https://github.com/lighttigerXIV/catppuccinifier"
license=()
provides=('catppuccinifier-gui')
conflicts=('catppuccinifier-gui')
depends=('npm' 'cmake' 'imagemagick' 'libadwaita' 'webkit2gtk' 'base-devel' 'curl' 'wget' 'openssl' 'appmenu-gtk-module' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips')
makedepends=('git' 'cargo')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname/src/source-code/catppuccinifier-gui"
	npm ci
	npm run build
	cd "src-tauri"
	cargo build --release
}

package() {
	cd "$pkgname"
	#desktop file
	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "src/releases/linux/installation-files/Catppuccinifier.desktop"
	#binary
	install -Dm755 "src/source-code/catppuccinifier-gui/src-tauri/target/release/catppuccinifier-gui" "$pkgdir/usr/bin/catppuccinifier-gui"
	#docs
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
	#reqired files
	mkdir -p "$HOME/.local/share/catppuccinifier"
	cp -p -r "src/releases/linux/installation-files/flavors/" "$HOME/.local/share/catppuccinifier/flavors/"
	#icon
	install -Dm644 "src/releases/linux/installation-files/catppuccinifier.png" "$pkgdir/usr/share/pixmaps/catppuccinifier.png"
}
