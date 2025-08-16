# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='vsd'
pkgver='0.4.3'
pkgrel='1'
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
source=(
	"$pkgname-$pkgver::git+$url#tag=vsd-$pkgver?signed"
	"$pkgname-$pkgver-bento4::git+https://github.com/axiomatic-systems/Bento4#commit=dc264854d1f76c370b65b18d9f303a95f7f21ab1"
)
b2sums=('0a201fc3bb70e08ee761bcb11a6c37973b53dbd03a68a20edc2320664feee4c4a913962f2d06d80317248ca867f954817089bb27f30d73264e665ebc7dba31ba'
        'a7dcf2e4e0ad17fe18d6c30d85a5358dcd9d5a8a8ed2c614ea5dcc435b0cfab479197453b0ae01667f4a6eaf9d2e750a4708de4a6205ea1e5fa83fea3fed4f2d')
validpgpkeys=('F3F06E548985227BA295D65CE01A8B4D6029DDA6') # Apoorv Sachan <clitic21@gmail.com> (https://github.com/clitic.gpg)

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN='stable'
	_cargotarget="$(rustc -vV | sed -n 's/host: //p')"

	# Provide Bento4 submodule
	git submodule init 'bento4-src/Bento4'
	git config 'submodule.bento4-src/Bento4.url' "$srcdir/$pkgname-$pkgver-bento4/"
	git -c protocol.file.allow=always submodule update 'bento4-src/Bento4'

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
