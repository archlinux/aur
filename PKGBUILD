# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
# Contributor: Michael Bauer <michael@m-bauer.org>
pkgname=radicle-cli
pkgver=1.0.0
pkgrel=2
pkgdesc="Radicle command line interface"
arch=('x86_64')
url="https://radicle/xyz"
license=('MIT' 'Apache-2.0')
depends=('libusb' 'gcc-libs' 'openssh' 'git' 'glibc' 'zlib')
makedepends=('cargo' 'git')

_man_pages="rad-id rad-patch rad git-remote-rad radicle-node"
 
_pkgver_commit=d39ba83c
_repoid=z3gqcJUoA1n9HaHKufZs5FCSGazv5

source=("heartwood-$pkgver::git+https://seed.radicle.xyz/$_repoid.git#commit=$_pkgver_commit")

sha512sums=('SKIP')

prepare() {
	cd "$srcdir/heartwood-$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/heartwood-$pkgver"
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features

	for page in $_man_pages; do
		bash scripts/build-man-pages.sh target "$page.1.adoc"
	done
}

check() {
	cd "$srcdir/heartwood-$pkgver"
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/heartwood-$pkgver"
	find target/release \
		-maxdepth 1 \
		-executable \
		-type f \
		-exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +

	for page in $_man_pages; do
		install -Dm0644 "target/$page.1" "$pkgdir/usr/share/man/man1/$page.1"
	done

	install -Dm0644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
	install -Dm0644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"

	install -Dm0644 systemd/radicle-node.service "$pkgdir/usr/lib/systemd/user/radicle-node.service"
}
