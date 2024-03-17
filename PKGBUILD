# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>

# shellcheck shell=bash disable=SC2164,SC2034,SC2154

_pname=OpenSCQ30
_powner=Oppzippy
_pkgid=com.oppzippy.$_pname
_deps_common=('libdbus-1.so')
_deps_gui=('libgtk-4.so' 'libadwaita-1.so')

pkgbase=openscq30
pkgname=("$pkgbase"-{cli,gui}) 
pkgver=1.11.0
pkgrel=1
pkgdesc="Cross platform application for controlling settings of Soundcore headphones"
arch=(x86_64 aarch64 armv7l)
url="https://github.com/$_powner/$_pname"
license=('GPL-3.0-or-later')
groups=("$pkgbase")
makedepends=('cargo')
depends=("${_deps_common[@]}" "${_deps_gui[@]}")
source=("$_pname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('e89f3d54f7c27f6db4305ee127fc916c')
sha512sums=('3aee765bb6a8db8651c2dea7af7ec53163630cbb17393af0e4acd048681e39ef122e020180519ea9a1d1924d06ceff16bcb74eafec164d5c9ec353b0531cf7dc')
b2sums=('020c5f8b2b796c2f33bec788c5dcf76a2a9074fa19032459e84920b5d832ea4792f19cb0b21d203c30b9b9443c7389da95bb33f9e125fc651b4ebfb17e19aa61')

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
	cargo build --release --frozen $(echo "-p openscq30_"{cli,gui})
}

check() {
	cd "$srcdir/$_pname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	# shellcheck disable=SC2046
	env LC_ALL=C \
		cargo test --frozen --features bluetooth,demo $(echo "-p openscq30_"{lib,cli,gui})
}

package_openscq30-cli() {
	# Metadata
	pkgdesc="$pkgdesc - CLI application"
	depends=("${_deps_common[@]}")
	# Packaging
	cd "$srcdir/$_pname-$pkgver"
	## Install binary
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgbase}_cli"
	# shellcheck disable=SC2128
	ln -s "${pkgbase}_cli" "$pkgdir/usr/bin/$pkgname"
}

package_openscq30-gui() {
	# Metadata
	pkgdesc="$pkgdesc - GTK4 GUI application"
	# Packaging
	cd "$srcdir/$_pname-$pkgver"
	## Install binary
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgbase}_gui"
	# shellcheck disable=SC2128
	ln -s "${pkgbase}_gui" "$pkgdir/usr/bin/$pkgname"
	## Install resources
	install -Dm0644 -t "$pkgdir/usr/share/metainfo/" "gui/resources/$_pkgid.metainfo.xml"
	install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/" "gui/resources/$_pkgid.svg"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "gui/resources/$_pkgid.desktop"
	## Install locales
	# shellcheck disable=SC2013
	for _l in '' $(cat 'gui/po/LINGUAS'); do
		_ext="${_l:+'po'}"
		_ext="${_ext:-'pot'}"
		install -dm0755 "$pkgdir/usr/share/locale/${_l:-en}/LC_MESSAGES"
		msgfmt --output-file "$pkgdir/usr/share/locale/${_l:-en}/LC_MESSAGES/$_pkgid.mo" "gui/po/$_l${_l:+/}$_pkgid.$_ext"
		chmod 0644 "$pkgdir/usr/share/locale/${_l:-en}/LC_MESSAGES/$_pkgid.mo"
	done
}
