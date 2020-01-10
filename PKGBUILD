# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='rage'
pkgname="rust-$_pkgname-git"
pkgver='0.1.1.r72.g125969e'
pkgrel='1'
pkgdesc='Rust implementation of the age encryption tool - git version'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/str4d/$_pkgname"
license=('Apache' 'MIT')
depends=('fuse2')
makedepends=('cargo' 'git')
provides=("rust-$_pkgname")
conflicts=("rust-$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

_sourcedirectory="$pkgname"

pkgver() {
	cd "$srcdir/$_sourcedirectory"
	git describe --long --tags | sed -e's/^v//' -e 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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
