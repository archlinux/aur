# Maintainer: Jack Roehr <jack@seatgull.com>
pkgname=vector-git
pkgver=v0.12.0.r2551.g4384165b84
pkgrel=0
depends=("zlib" "gcc-libs")
makedepends=('cargo-nightly' 'git' 'rust')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://vector.dev"
license=("MPL")
pkgdesc="A high-performance observability data pipeline."
source=("vector::git+https://github.com/vectordotdev/vector"
	vector.sysusers
	vector.tmpfiles)
b2sums=('SKIP'
	'97a1b1905fc6ae87a64797de6b72608a312e54a07df9183582df555f33c2c9106e7ee1c3e1156b7753e6273822b3ce894c756232e3d808b02a6f27c7ec26b00f'
	'210ddfcd6078a97ab4507054c3fb5bbea83da3048a41ba83e835f7a476cd62b77b4687284dc34a57d792fc8aacb225496f902ebcc6ddf07439df38a3311d7724')
reponame="vector"

pkgver() {
	cd "$reponame"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$reponame"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$reponame"
	export RUSTUP_TOOLCHAIN=nightly
	cargo build --release
}

package() {
	install -Dm755 "$reponame/target/release/vector" "$pkgdir/usr/bin/vector"
	install -Dm644 "$reponame/config/vector.toml" "$pkgdir/etc/vector/vector.toml"
	install -Dm644 "$reponame/distribution/systemd/vector.service" "$pkgdir/usr/lib/systemd/system/vector.service"
	install -Dm644 "vector.sysusers" "$pkgdir/usr/lib/sysusers.d/vector.conf"
	install -Dm644 "vector.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/vector.conf"
}
