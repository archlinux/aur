# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>

# shellcheck shell=bash disable=SC2164,SC2034,SC2154

_pname=OpenSCQ30
_powner=Oppzippy
_pkgid=com.oppzippy.$_pname
_deps_common=('libdbus-1.so' 'libsqlite3.so' 'libsystemd.so')
_deps_gui=('cosmic-icon-theme' 'libxkbcommon.so')

pkgbase=openscq30
pkgname=("$pkgbase"-{cli,gui})
pkgver=2.10.1
pkgrel=1
pkgdesc="Cross platform application for controlling settings of Soundcore headphones"
arch=(x86_64 aarch64 armv7l)
url="https://github.com/$_powner/$_pname"
license=('GPL-3.0-or-later')
groups=("$pkgbase")
makedepends=('cargo' 'git')
depends=("${_deps_common[@]}" "${_deps_gui[@]}")
source=("$_pname::git+$url.git#tag=v$pkgver?signed")
md5sums=('c53333b748421d835cf7feea7cf142d6')
sha512sums=('fc428a655fdeb73e547ba610ccb3741ded1724ef1cd850e4153ff7fb717916b7c275fd1fe8c3cf75581b58b64d973ebf2c174066198540b2d4887320e57f646d')
b2sums=('e87ccd6093cd8e2e807887e95a44c432a3f668223ef00cbe0abf63b1606755b714ae321a8e946ec72208288a757cb4c794d757f6671dcc31185b66ac11baa209')
validpgpkeys=('58A1B3E704817B8778CBB86B72CE2DDCDA12B906')

prepare() {
	cd "$srcdir/$_pname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_pname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# shellcheck disable=SC2046
	cargo build --release --frozen $(echo "-p openscq30-"{cli,gui})
}

check() {
	cd "$srcdir/$_pname"
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
	cd "$srcdir/$_pname"
	## Install binary
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgbase}"
	# shellcheck disable=SC2128
	ln -s "${pkgbase}" "$pkgdir/usr/bin/$pkgname"
}

package_openscq30-gui() {
	# Metadata
	pkgdesc="$pkgdesc - Cosmic GUI application"
	# Packaging
	cd "$srcdir/$_pname"
	## Install binary
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgbase}-gui"
	## Install resources
	install -Dm0644 -t "$pkgdir/usr/share/metainfo/" "gui/resources/$_pkgid.metainfo.xml"
	install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" "gui/resources/$_pkgid.svg"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "gui/resources/$_pkgid.desktop"
}
