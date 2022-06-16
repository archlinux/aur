# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='shd'
pkgname="$_pkgname-git"
pkgver='0.1.3.r2.g8c68335'
pkgrel='1'
pkgdesc='Console tool to display drive list with commonly checked smart info - git version'
arch=('x86_64' 'i686' 'arm' 'aarch64')
url="https://github.com/alttch/$_pkgname"
license=('MIT')
depends=('smartmontools')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha512sums=('SKIP')

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Prepare correct target for our architecture
	_cargotarget="$CARCH-unknown-linux-musl"

	if [ "$CARCH" = 'arm' ]; then
		_cargotarget="${_cargotarget}eabihf"
	fi

	cargo update
	cargo fetch --locked --target "$_cargotarget"
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed -e 's/^v//' -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN='stable'
	export CARGO_TARGET_DIR='build'
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "build/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
