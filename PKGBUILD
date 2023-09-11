# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>
_pname=OpenSCQ30
_powner=Oppzippy
_deps_common=('libdbus-1.so')
_deps_gui=('libgtk-4.so' 'libadwaita-1.so')

pkgbase=openscq30
pkgname=($pkgbase-{cli,gui}) 
pkgver=1.6.0
pkgrel=2
pkgdesc="Cross platform application for controlling settings of Soundcore headphones"
arch=(x86_64 aarch64 armv7l)
url="https://github.com/$_powner/$_pname"
license=('GPL3')
groups=("$pkgbase")
makedepends=('pkgconf' 'cargo-make' 'rust')
depends=("${_deps_common[@]}" "${_deps_gui[@]}")
source=("$_pname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('e3b5170d10a356abc375d6a0505ad59a')
sha512sums=('1ae08fb932b2d04c48fe9cb6485bec45b5b096d84451c7160ae53d9453c0375049e03638e9958dd603b59e98ac45678f153d2c1b0615a9a0ce2c2e73727c83f2')
b2sums=('ac62e5510e3d4d5feb82bbd29926de4134e805e03e2b58df183422f2e4dfc6be2fda4f328c899206485e733151357cffdce29cb1e0e6b5302a9592735d613469')

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
