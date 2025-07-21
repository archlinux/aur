# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
# Contributor: Michael Bauer <michael@m-bauer.org>
pkgname=radicle-cli
pkgver=1.2.1
pkgrel=1
pkgdesc="Radicle command line interface"
arch=('x86_64')
url="https://radicle.xyz"
license=('MIT' 'Apache-2.0')
depends=('libusb' 'gcc-libs' 'openssh' 'git' 'glibc' 'zlib')
makedepends=('cargo' 'asciidoctor')

_man_pages="rad-id rad-patch rad git-remote-rad radicle-node"

source=("https://files.radicle.xyz/releases/$pkgver/heartwood-$pkgver.tar.gz")
noextract=("heartwood-$pkgver.tar.gz")

sha512sums=('371f1e8907ebe2fa13a75e0a48cc37944bea14138f8496ca974892430d18d70d5144668248b922b61b9497ba0203ecaec8353df6e8d792e092b37401a5ac3264')

prepare() {
  mkdir -p "$srcdir/heartwood-$pkgver"
	cd "$srcdir/heartwood-$pkgver"
	bsdtar xzf ../heartwood-$pkgver.tar.gz
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

	install -Dm0644 systemd/system/radicle-node.service "$pkgdir/usr/lib/systemd/user/radicle-node.service"
}
