# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='orbterm'
pkgver='0.3.6'
_commit='033ac47355554f20e2935f86f382b9aa9be5fcdd'
pkgrel='7'
pkgdesc='The default terminal for RedoxOS, compatible with Linux'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://gitlab.redox-os.org/redox-os/$pkgname"
license=('MIT')
depends=('sdl2')
makedepends=('cargo')
source=(
	"$pkgname-$pkgver::git+$url#commit=$_commit?signed"
	"$pkgname-$pkgver-Cargo.lock::$url/-/raw/505cac5d5c071eb8d10ec5e4843ec0a83ad18c9b/Cargo.lock"
	"$pkgname-$pkgver-Cargo.toml::$url/-/raw/505cac5d5c071eb8d10ec5e4843ec0a83ad18c9b/Cargo.toml"
)
sha512sums=('SKIP'
            '7cc14d115b787459630c15cc351595ca12c70d89faec1bc9ac85ec9fd185210e25097d8d12d85ccb5264ced6731a650596254515b0668d32044257272ba3bf4e'
            'da2ffef5ea6c3c0e9240f2951c30b0abeb5623bedfeec6b1c30d1b58e17808928190466d6a72ce0707204c888cdc5d5c1e973afa8ca31903b61261af148debbc')
validpgpkeys=('DA0878FCF806089ED4FDDF58E988B49EE78A7FB1') # Jeremy Soller <jeremy@system76.com> (available on keyserver.ubuntu.com)

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Use current Cargo toml and lock files, since the tagged versions no longer build
	rm -rf 'Cargo.lock' 'Cargo.toml'
	mv "$srcdir/$pkgname-$pkgver-Cargo.lock" 'Cargo.lock'
	mv "$srcdir/$pkgname-$pkgver-Cargo.toml" 'Cargo.toml'

	# Prepare correct target for our architecture
	_cargotarget="$CARCH-unknown-linux-gnu"

	if [ "$CARCH" = 'armv7h' ]; then
		_cargotarget='armv7-unknown-linux-gnueabihf'
	fi

	cargo fetch --locked --target "$_cargotarget"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN='stable'
	export CARGO_TARGET_DIR='target'
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
