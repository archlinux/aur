# Maintainer: Alan Sartorio

pkgname=rubik-git
pkgdesc="A keyboard driven virtual Rubik's cube made in rust."
pkgver=r18.e534ef9
pkgrel=1
_reponame=rubik
arch=('x86_64')
url="https://github.com/alansartorio/rubik"
makedepends=('git' 'rust' 'cargo')
source=("git+$url.git")
md5sums=(SKIP)
license=('MIT')

pkgver() {
    cd "$srcdir/$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_reponame"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_reponame"
	env CARGO_INCREMENTAL=0 cargo build --release --locked --offline
}

check() {
	cd "$srcdir/$_reponame"
	env CARGO_INCREMENTAL=0 cargo test --locked --offline
}

package() {
	cd "$srcdir/$_reponame"
	
	install -D -m644 "extra/Rubik.desktop" "$pkgdir/usr/share/applications/Rubik.desktop" 
	install -D -m755 "target/release/rubik" "$pkgdir/usr/bin/rubik"
}
