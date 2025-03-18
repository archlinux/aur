# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='vsd'
pkgver='0.3.3'
pkgrel='1'
pkgdesc='Download video streams served over HTTP from websites, HLS and DASH playlists'
arch=('x86_64' 'aarch64')
url="https://github.com/clitic/$pkgname"
license=('(MIT OR Apache-2.0) AND GPL-2.0-or-later')
makedepends=('cargo')
optdepends=(
	'ffmpeg: required for transmuxing and transcoding streams'
	'chromium: required for capture and collect subcommands'
)
options=('!lto')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-bento4.tar.gz::https://github.com/axiomatic-systems/Bento4/archive/v1.6.0-641.tar.gz"
)
b2sums=('f84f630b4b8eeefa495e6ca8652e7d7731d35b24a1797b16b806ee7789bf7c569b01c85f9d51771e1b155e179a572df08e9bf67c9559d33e41d6c5af4d267508'
        '8bec91edcba170917de5941d94fecbc2028d4503651e7863b5c6a5d24bbe442b7a5d53644770d3221c28c5a9f2a2620c04e836f748660a808e27e157db93b117')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN='stable'
	_cargotarget="$(rustc -vV | sed -n 's/host: //p')"

	# Move the Bento4 repo to the correct location
	rm -rf 'bento4-src/Bento4/'
	mv '../Bento4-1.6.0-641/' 'bento4-src/Bento4/'

	# Fetch dependencies
	cargo fetch --locked --target "$_cargotarget"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN='stable'
	export CARGO_TARGET_DIR='target'
	_cargotarget="$(rustc -vV | sed -n 's/host: //p')"
	cargo build --frozen --release --target "$_cargotarget" --package "$pkgname" --all-features
}

check() {
	_cargotarget="$(rustc -vV | sed -n 's/host: //p')"
	_checkoutput="$("$srcdir/$_sourcedirectory/target/$_cargotarget/release/$pkgname" --version)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "^$pkgname $pkgver$"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	_cargotarget="$(rustc -vV | sed -n 's/host: //p')"
	install -Dm755 "target/$_cargotarget/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
