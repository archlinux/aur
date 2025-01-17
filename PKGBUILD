# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>

# shellcheck shell=bash disable=SC2164,SC2034,SC2154

_pname=OpenSCQ30
_powner=Oppzippy
_pkgid=com.oppzippy.$_pname
_deps_common=('libdbus-1.so')
_deps_gui=('libgtk-4.so' 'libadwaita-1.so')

pkgbase=openscq30
pkgname=("$pkgbase"-{cli,gui}) 
pkgver=1.19.1
pkgrel=1
pkgdesc="Cross platform application for controlling settings of Soundcore headphones"
arch=(x86_64 aarch64 armv7l)
url="https://github.com/$_powner/$_pname"
license=('GPL-3.0-or-later')
groups=("$pkgbase")
makedepends=('cargo')
depends=("${_deps_common[@]}" "${_deps_gui[@]}")
source=("$_pname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('f8eece86a53bd56c83e4a7fd225d3755')
sha512sums=('57af82d887f322d2299c694cb6b25819b58ff467e1d6578b75068418101049a97a15c771bf3641660e8a920a9e753f35cfa0fac8adebbd95b59f1255f9339af9')
b2sums=('8252aef942d1ad4dbe16cc2c0b563d534cb3fa9d41d4f0ecdddb73c63da432b3c206a34866f0dcd4450eb968b47ae2474ca88790d595cce1d94a61558aa40741')

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
