# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>
_pname=OpenSCQ30
_powner=Oppzippy
_deps_common=('libdbus-1.so')
_deps_gui=('libgtk-4.so' 'libadwaita-1.so')

pkgbase=openscq30
pkgname=($pkgbase-{cli,gui}) 
pkgver=1.8.0
pkgrel=1
pkgdesc="Cross platform application for controlling settings of Soundcore headphones"
arch=(x86_64 aarch64 armv7l)
url="https://github.com/$_powner/$_pname"
license=('GPL3')
groups=("$pkgbase")
makedepends=('pkgconf' 'cargo-make' 'rust')
depends=("${_deps_common[@]}" "${_deps_gui[@]}")
source=("$_pname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('7b3c006e2967bb1ef8479c343af37b85')
sha512sums=('1f4af7cc668e1080a5a6ec4ab7bf29bdf14a8a91678b453a8f1b0ae9bd433239feb93bfe0243e2157756a64f4fb9b9e329a88d8daa403c863854d9e48e484102')
b2sums=('7cc6f16dea275fef407d498247b933781b1a557d9e425563443d5eb88d7580f543ef6ffad51682e7f2f06fca9dfe35d4b0e62b8b5ebfaf42b66f9264f7ff18f2')

prepare() {
	cd "$srcdir/$_pname-$pkgver"
	echo "Removing 'android' from 'Cargo.toml' members..."
	sed -i 's/^\(members = \[.*\), "android"/\1/' Cargo.toml
}

build() {
	cd "$srcdir/$_pname-$pkgver"
	cargo make --profile release build
}

check() {
	cd "$srcdir/$_pname-$pkgver"
	cargo make test
}

package_openscq30-cli() {
	# Metadata
	pkgdesc="$pkgdesc - CLI application"
	depends=("${_deps_common[@]}")
	# Packaging
	cd "$srcdir/$_pname-$pkgver/cli"
	INSTALL_PREFIX="$pkgdir/usr/" cargo make --profile release install
}

package_openscq30-gui() {
	# Metadata
	pkgdesc="$pkgdesc - GTK4 GUI application"
	# Packaging
	cd "$srcdir/$_pname-$pkgver/gui"
	INSTALL_PREFIX="$pkgdir/usr/" cargo make --profile release install
}
