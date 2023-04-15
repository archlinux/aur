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
	install -d "$pkgdir"/usr/share/"$_pkgname"
	cd "$pkgname"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	cd "src/Linux"
	install -Dm755 "binaries-source/catppuccinifier-gui/target/release/catppuccinifier-gui" "$pkgdir/usr/bin/catppuccinifier-gui"
	mkdir -p "$HOME/.local/share/catppuccinifier"
	cp -p -r "installation-files/flavors/" "$HOME/.local/share/catppuccinifier/flavors/"
	sed -i "s|Icon=.*|Icon=$pkgdir/usr/share/$pkgname/catppuccinifier.png|g" "installation-files/Catppuccinifier.desktop"
	sed -i "s|Exec=.*|Exec=catppuccinifier-gui|g" "installation-files/Catppuccinifier.desktop"
	install -Dm644 -t "$pkgdir/usr/share/applications/" "installation-files/Catppuccinifier.desktop"
	install -Dm644 -t "$pkgdir/usr/share/$pkgname/" "installation-files/catppuccinifier.png"
}