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
	cd "$srcdir"
	install -d "$pkgdir"/usr/share/"$_pkgname"
	install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" "$pkgname/src/Linux/README.md"
	install -Dm755 "$pkgname/src/Linux/binaries-source/catppuccinifier-gui/target/release/catppuccinifier-gui" "$pkgdir/usr/bin/catppuccinifier-gui"
	mkdir -p "$HOME/.local/share/catppuccinifier"
	cp -p -r "$pkgname/src/Linux/installation-files/flavors/" "$HOME/.local/share/catppuccinifier/flavors/"
	sed -i "s|Icon=.*|Icon=$pkgdir/usr/share/$_pkgname/catppuccinifier.png|g" "$pkgname/src/Linux/installation-files/Catppuccinifier.desktop"
	sed -i "s|Exec=.*|Exec=catppuccinifier-gui|g" "$pkgname/src/Linux/installation-files/Catppuccinifier.desktop"
	install -Dm644 -t "$pkgdir/usr/share/applications/" "$pkgname/src/Linux/installation-files/Catppuccinifier.desktop"
	install -Dm644 -t "$pkgdir/usr/share/$_pkgname/" "$pkgname/src/Linux/installation-files/catppuccinifier.png"
}