pkgname=rubik-git
pkgdesc="A keyboard driven virtual Rubik's cube made in rust."
pkgver=r17.8f577ae
pkgrel=1
_reponame=rubik
arch=('x86_64')
url="https://github.com/alansartorio/rubik"
makedepends=('git' 'rust' 'cargo')
source=("git+$url.git")
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	env CARGO_INCREMENTAL=0 cargo build --release --locked --offline
}

check() {
	cd "$pkgname"
	env CARGO_INCREMENTAL=0 cargo test --locked --offline
}

package() {
	cd "$pkgname"
	
	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "extra/Rubik.desktop"
	install -D -m755 "target/release/rubik" "$pkgdir/usr/bin/rubik"
}
