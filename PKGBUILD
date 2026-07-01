# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>

# shellcheck shell=bash disable=SC2164,SC2034,SC2154

_pname=OpenSCQ30
_powner=Oppzippy
_pkgid=com.oppzippy.$_pname
_deps_common=('libdbus-1.so' 'libsqlite3.so' 'libsystemd.so')
_deps_gui=('cosmic-icon-theme' 'libxkbcommon.so')

pkgbase=openscq30
pkgname=("$pkgbase"-{cli,gui})
pkgver=2.9.0
pkgrel=1
pkgdesc="Cross platform application for controlling settings of Soundcore headphones"
arch=(x86_64 aarch64 armv7l)
url="https://github.com/$_powner/$_pname"
license=('GPL-3.0-or-later')
groups=("$pkgbase")
makedepends=('cargo')
depends=("${_deps_common[@]}" "${_deps_gui[@]}")
source=("$_pname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('68d2b554f44d28b8c063e391dbff390d')
sha512sums=('b9763a47f8124d32751d8c10eee9217e9fcd5b51f32ba7f0fade03096cdf2e428d1306f90ed04109b3c0dce5bff5f43060025a110980b9e724d11ef2a813565a')
b2sums=('863ffe2c47d84b8f325a9f5a0a0be0f81aa08b25f65e79f8e9f632c6c0a2d2ca023a6272d56b9f721bc54c3a4ed0091306b239fdfb285a60611e91fb0f816edf')

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
