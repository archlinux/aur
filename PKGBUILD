# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='rage'
pkgname="rust-$_pkgname"
pkgver='0.2.0'
pkgrel='1'
pkgdesc='Rust implementation of the age encryption tool'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/str4d/$_pkgname"
license=('Apache' 'MIT')
depends=('fuse2')
makedepends=('cargo')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('80aa55c4e3c6c5e76136d179974e4b6de7c913d3ee53b0999888d4a08c0d5a11')

_sourcedirectory="$_pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory"
	cargo build --release --locked --all-features
	cargo run --release --locked --all-features --example generate-docs
}

package() {
	cd "$srcdir/$_sourcedirectory/target"
	for binary in "$_pkgname" "$_pkgname-keygen" "$_pkgname-mount"; do
		install -Dm755 "release/$binary" "$pkgdir/usr/bin/$binary"
		install -Dm644 "$binary.1.gz" "$pkgdir/usr/share/man/man1/$binary.1.gz"
	done
	install -Dm644 '../LICENSE-MIT' "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
