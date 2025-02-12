# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='vsd'
pkgver='0.3.2'
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
	"$pkgname-$pkgver-bento4.tar.gz::https://github.com/axiomatic-systems/Bento4/archive/v1.6.0-640.tar.gz"
)
b2sums=('46f2ffe7d83ec6be42a24cd0301d97c69d1a7a6abaf2ca6fffc0366b46ba560e8cb1094ceab99433f7f90813a233cf6430495779b9631ec03e8068db8a7f4a7c'
        '4addca8575e65daf5410a76d59ee200aecfe0d24c55bc19773ddc75723f584eab62681130a1796ccabed6e117ddb7765d75177e2a2b9cd39b7f99d500c35384f')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN='stable'
	_cargotarget="$(rustc -vV | sed -n 's/host: //p')"

	# Move the Bento4 repo to the correct location
	rm -rf 'bento4-src/Bento4/'
	mv '../Bento4-1.6.0-640/' 'bento4-src/Bento4/'

	# Generate lockfile
	cargo generate-lockfile

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
