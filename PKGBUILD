# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='orbterm'
pkgname="$_pkgname-git"
pkgver='0.3.6.r15.gf177f49'
pkgrel='1'
pkgdesc='The default terminal for RedoxOS, compatible with Linux - git version'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://gitlab.redox-os.org/redox-os/$_pkgname"
license=('MIT')
depends=('sdl2')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname::git+$url"
	'update-orbfont.diff'
)
sha512sums=('SKIP'
            'd78fe9cf662dc286c77ed0526493deb39dbed614259108fc247b44c406cbdf1c70aef4d05ee6c816fd51035df2fb107466d6f06fbde6941576e34a7f89febfc0')

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "$srcdir/update-orbfont.diff"

	# Prepare correct target for our architecture
	_cargotarget="$CARCH-unknown-linux-gnu"

	if [ "$CARCH" = 'armv7h' ]; then
		_cargotarget='armv7-unknown-linux-gnueabihf'
	fi

	cargo fetch --locked --target "$_cargotarget"
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN='stable'
	export CARGO_TARGET_DIR='target'
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
