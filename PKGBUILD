# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>
_pname=OpenSCQ30
_powner=Oppzippy
_deps_common=('libdbus-1.so')
_deps_gui=('libgtk-4.so' 'libadwaita-1.so')

pkgbase=openscq30
pkgname=($pkgbase-{cli,gui}) 
pkgver=1.10.3
pkgrel=1
pkgdesc="Cross platform application for controlling settings of Soundcore headphones"
arch=(x86_64 aarch64 armv7l)
url="https://github.com/$_powner/$_pname"
license=('GPL3')
groups=("$pkgbase")
makedepends=('pkgconf' 'cargo-make' 'rust')
depends=("${_deps_common[@]}" "${_deps_gui[@]}")
source=("$_pname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('00e10bee0828ef76f881323a2f68c726')
sha512sums=('ea33ed28812e1b6d347b20d049dd35687be4c552db6d2e172b4588c93db4d249ef2f43b0b25c9ef5e5eb2b9af3ada1ee838ed6b569d5665d172033b866e317ea')
b2sums=('3c2460888e4e175f2207eb92d3e3d9b5c331c3e61046e781be006eaceb0a2e92d137a8da59da0f89a9f6e4c4ae5cfee2eeb2ed2cae343d2d929f66f08e07d530')

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
	LC_ALL=C LANG=C cargo make test
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
