# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
# Contributor: Michael Bauer <michael@m-bauer.org>
pkgname=radicle-cli
pkgver=1.3.0
pkgrel=1
pkgdesc="Radicle command line interface"
arch=('x86_64')
url="https://radicle.xyz"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'openssh>=9.1' 'git>=2.34.0' 'glibc' 'zlib')
makedepends=('cargo' 'asciidoctor')

_man_pages="rad-id rad-patch rad git-remote-rad radicle-node"

source=("https://files.radicle.xyz/releases/$pkgver/heartwood-$pkgver.tar.gz")
noextract=("heartwood-$pkgver.tar.gz")

sha512sums=('a816cb12582a92e633d3f28c6a2649040a176e42a3b49c40bae5a3e8a6b47dcc75b44203bc662ef93aadbd0f4062503592ae9c757f8b97d9597ba26e77d93d4b')

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
