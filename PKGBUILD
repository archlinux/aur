# Maintainer: Alan Sartorio

pkgname=rubik-git
pkgdesc="A keyboard driven virtual Rubik's cube made in rust."
pkgver=v1.1.0.r8.g5db3b0f
pkgrel=1
epoch=1
_reponame=rubik
arch=('x86_64')
url="https://github.com/alansartorio/rubik"
makedepends=('git' 'rust' 'cargo')
source=("git+$url.git")
md5sums=(SKIP)
license=('MIT')

pkgver() {
    cd "$srcdir/$_reponame"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_reponame"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_reponame"
	env CARGO_INCREMENTAL=0 cargo build --release --locked --offline --bin rubik
}

check() {
	cd "$srcdir/$_reponame"
	env CARGO_INCREMENTAL=0 cargo test --locked --offline --bin rubik
}

package() {
	cd "$srcdir/$_reponame"
	
	install -D -m644 "extra/Rubik.desktop" "$pkgdir/usr/share/applications/Rubik.desktop" 
	install -D -m755 "target/release/rubik" "$pkgdir/usr/bin/rubik"
}
