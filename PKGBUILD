# Maintainer: Isabel <isabelroseslive@gmail.com>
pkgname=catppuccinifier-gui-git
_pkgname=catppuccinifier-gui
pkgver=r38.bba178a
pkgrel=1
pkgdesc="An application to catppuccinifiy your images."
arch=('x86_64')
url="https://github.com/lighttigerXIV/catppuccinifier"
license=()
depends=('imagemagick' 'libadwaita')
makedepends=('git' 'cargo')
source=("$pkgname::git+$url")
md5sums=('SKIP')

build() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname/src/Linux/binaries-source/catppuccinifier-gui"
	cargo build --release
}

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $pkgname
	#binary
	install -Dm755 "$src/Linux/binaries-source/catppuccinifier-gui/target/release/catppuccinifier-gui" "$pkgdir/usr/bin/catppuccinifier-gui"
	#docs
	install -Dm644 "src/Linux/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
	#reqired files
	mkdir -p "$HOME/.local/share/catppuccinifier"
	cp -p -r "src/Linux/installation-files/flavors/" "$HOME/.local/share/catppuccinifier/flavors/"
	#icon
	install -Dm644 "/src/Linux/installation-files/catppuccinifier.png" "$pkgdir/usr/share/pixmaps/catppuccinifier.png"
	#desktop file
	sed -i "s|Icon=.*|Icon=catppuccinifier|g" "src/Linux/installation-files/Catppuccinifier.desktop"
	sed -i "s|Exec=.*|Exec=catppuccinifier-gui|g" "src/Linux/installation-files/Catppuccinifier.desktop"
	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/Catppuccinifier.desktop" "src/Linux/installation-files/Catppuccinifier.desktop" 
}