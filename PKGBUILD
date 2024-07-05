# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>

# shellcheck shell=bash disable=SC2164,SC2034,SC2154

_pname=OpenSCQ30
_powner=Oppzippy
_pkgid=com.oppzippy.$_pname
_deps_common=('libdbus-1.so')
_deps_gui=('libgtk-4.so' 'libadwaita-1.so')

pkgbase=openscq30
pkgname=("$pkgbase"-{cli,gui}) 
pkgver=1.12.0
pkgrel=2
pkgdesc="Cross platform application for controlling settings of Soundcore headphones"
arch=(x86_64 aarch64 armv7l)
url="https://github.com/$_powner/$_pname"
license=('GPL-3.0-or-later')
groups=("$pkgbase")
makedepends=('cargo')
depends=("${_deps_common[@]}" "${_deps_gui[@]}")
source=("$_pname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('f38a59d617d4f85df363372bc8b4c6c9')
sha512sums=('1a7dcf6febdfe58fb944071e6dd233cf01285d27605bd71195f00cf03350f1d8961893cbb48225a13358ca7df5f8bf00adeca00cd2db8bb7a99cf1721140de55')
b2sums=('b290751df2a6a313a3f2d7f99f9404d9e7c42fbcff73251d27e9ae89b2b2ae5958371e5cff98cac0b5c1f701ac8ae646e104103cf3f1efc7837adc661a03deed')

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
	install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" "gui/resources/$_pkgid.svg"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "gui/resources/$_pkgid.desktop"
	## Install locales
	# shellcheck disable=SC2013
	for _l in '' $(cat 'gui/po/LINGUAS'); do
		_ext="${_l:+po}"
		_ext="${_ext:-pot}"
		install -dm0755 "$pkgdir/usr/share/locale/${_l:-en}/LC_MESSAGES"
		msgfmt --output-file "$pkgdir/usr/share/locale/${_l:-en}/LC_MESSAGES/$_pkgid.mo" "gui/po/$_l${_l:+/}$_pkgid.$_ext"
		chmod 0644 "$pkgdir/usr/share/locale/${_l:-en}/LC_MESSAGES/$_pkgid.mo"
	done
}
