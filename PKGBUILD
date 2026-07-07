# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='vsd'
pkgver='0.5.0'
pkgrel='2'
pkgdesc='Download video streams served over HTTP from websites, HLS and DASH playlists'
arch=('x86_64' 'aarch64')
url="https://github.com/clitic/$pkgname"
license=('(MIT OR Apache-2.0) AND GPL-2.0-or-later')
makedepends=('cargo' 'git')
optdepends=(
	'ffmpeg: required for transmuxing and transcoding streams'
	'chromium: required for capture and collect subcommands'
)
options=('!lto')
source=("$pkgname::git+$url#tag=vsd-$pkgver?signed")
b2sums=('9ded7eb402cd431364b21340f8c2cd0f6d219d9a0d8c310b080c952e5167292edae9c41649ba2fa2b81d1ff4b545ef80a468de91ed80bdaa62704d5288ade664')
validpgpkeys=('F3F06E548985227BA295D65CE01A8B4D6029DDA6') # Apoorv Sachan <clitic21@gmail.com> (https://github.com/clitic.gpg)

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN='stable'
	_cargotarget="$(rustc -vV | sed -n 's/host: //p')"

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
