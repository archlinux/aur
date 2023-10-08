# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>
_pname=OpenSCQ30
_powner=Oppzippy
_deps_common=('libdbus-1.so')
_deps_gui=('libgtk-4.so' 'libadwaita-1.so')

pkgbase=openscq30
pkgname=($pkgbase-{cli,gui}) 
pkgver=1.7.0
pkgrel=1
pkgdesc="Cross platform application for controlling settings of Soundcore headphones"
arch=(x86_64 aarch64 armv7l)
url="https://github.com/$_powner/$_pname"
license=('GPL3')
groups=("$pkgbase")
makedepends=('pkgconf' 'cargo-make' 'rust')
depends=("${_deps_common[@]}" "${_deps_gui[@]}")
source=("$_pname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('b7eb7a644e75eb47721d1571cbafb6eb')
sha512sums=('44a78f01fecbb1e277d55648eb609683049864f58cbd0b6f429bfb6793c75c3b2e1583aad6826f2343331b9b9b9017094a5f87bbbdf9e1b861c59f621bd7719e')
b2sums=('f689c7e9944a6efbbd0c1810a9aaffce455158ad9588b08f85de7dcb1419f0eb19f80c3a895574b95fed6cbd39855c6c6436d32354abc60075b93e8b6aa15c6b')

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
