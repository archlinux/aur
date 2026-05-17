# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>

# shellcheck shell=bash disable=SC2164,SC2034,SC2154

_pname=OpenSCQ30
_powner=Oppzippy
_pkgid=com.oppzippy.$_pname
_deps_common=('libdbus-1.so' 'libsqlite3.so' 'libsystemd.so')
_deps_gui=('cosmic-icon-theme' 'libxkbcommon.so')

pkgbase=openscq30
pkgname=("$pkgbase"-{cli,gui})
pkgver=2.8.0
pkgrel=1
pkgdesc="Cross platform application for controlling settings of Soundcore headphones"
arch=(x86_64 aarch64 armv7l)
url="https://github.com/$_powner/$_pname"
license=('GPL-3.0-or-later')
groups=("$pkgbase")
makedepends=('cargo')
depends=("${_deps_common[@]}" "${_deps_gui[@]}")
source=("$_pname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('c9bfb547328de04229deb888f00d1c6c')
sha512sums=('2152e0940dedbb175856572f795806921cf063db934394161c1c7a4a72b35903c80aba2e10fea331123c21d211f27905213bf89907558506cc4769305f33397d')
b2sums=('97f8e4d856e018b0395c166ed7075cc6ccf09d74455f57cdd6fef5911dfd356ea9c78ad89dc9504e8e6a797b031a74bfe5c9c823a026ade01d4ce3374ce2692e')

prepare() {
	cd "$srcdir/$_pname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_pname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# shellcheck disable=SC2046
	cargo build --release --frozen $(echo "-p openscq30-"{cli,gui})
}

check() {
	cd "$srcdir/$_pname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	# shellcheck disable=SC2046
	env LC_ALL=C \
		cargo test --frozen $(echo "-p openscq30-"{lib,cli,gui})
}

package_openscq30-cli() {
	# Metadata
	pkgdesc="$pkgdesc - CLI application"
	depends=("${_deps_common[@]}")
	# Packaging
	cd "$srcdir/$_pname-$pkgver"
	## Install binary
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgbase}"
	# shellcheck disable=SC2128
	ln -s "${pkgbase}" "$pkgdir/usr/bin/$pkgname"
}

package_openscq30-gui() {
	# Metadata
	pkgdesc="$pkgdesc - Cosmic GUI application"
	# Packaging
	cd "$srcdir/$_pname-$pkgver"
	## Install binary
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgbase}-gui"
	## Install resources
	install -Dm0644 -t "$pkgdir/usr/share/metainfo/" "gui/resources/$_pkgid.metainfo.xml"
	install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" "gui/resources/$_pkgid.svg"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "gui/resources/$_pkgid.desktop"
}
