# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>

# shellcheck shell=bash disable=SC2164,SC2034,SC2154

_pname=OpenSCQ30
_powner=Oppzippy
_pkgid=com.oppzippy.$_pname
_deps_common=('libdbus-1.so' 'libsqlite3.so' 'libsystemd.so')
_deps_gui=('cosmic-icon-theme' 'libxkbcommon.so')

pkgbase=openscq30
pkgname=("$pkgbase"-{cli,gui})
pkgver=2.13.0
pkgrel=1
pkgdesc="Cross platform application for controlling settings of Soundcore headphones"
arch=(x86_64 aarch64 armv7l)
url="https://github.com/$_powner/$_pname"
license=('GPL-3.0-or-later')
groups=("$pkgbase")
makedepends=('cargo' 'git')
depends=("${_deps_common[@]}" "${_deps_gui[@]}")
source=("$_pname::git+$url.git#tag=v$pkgver?signed")
md5sums=('05bdb6130ca675c965f920bcb596a3c4')
sha512sums=('69a8281c437769a1cf1b4799d1aa9d77aa9085a360a4f7ffc3983e973f8a9d74836a8eda593cb3afd7f08a059588639a3342b8d0288afbb4d21daee9aa00ddad')
b2sums=('bf1060fdfd98dbccecde44f809c52be8f985d8aae100096c8750bbe9d9afb416cdc547c2ab5105de3ad307df6ad75af923a4a15b321e4dc7ee07bc112e544e48')
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
