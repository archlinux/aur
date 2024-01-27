# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>
_pname=OpenSCQ30
_powner=Oppzippy
_deps_common=('libdbus-1.so')
_deps_gui=('libgtk-4.so' 'libadwaita-1.so')

pkgbase=openscq30
pkgname=($pkgbase-{cli,gui}) 
pkgver=1.10.6
pkgrel=1
pkgdesc="Cross platform application for controlling settings of Soundcore headphones"
arch=(x86_64 aarch64 armv7l)
url="https://github.com/$_powner/$_pname"
license=('GPL3')
groups=("$pkgbase")
makedepends=('pkgconf' 'cargo-make' 'rust')
depends=("${_deps_common[@]}" "${_deps_gui[@]}")
source=("$_pname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('71da9b6e3d158216ba31039d595094c5')
sha512sums=('b61dbf0f567d9c886af9a25401de9a252ad780f5bc11d5351866ba2a612c96065285e888eda110ab67e50f0c1ba985217bdc2554a80f630264fe661dbdcddb03')
b2sums=('775b1993c277c523537a8fa060daef2911517c41ad4537dbdd823d18bea128913cbc7e0a590607a210493282b0c9bdc07907bb23f9259143403fa742d3765952')

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
