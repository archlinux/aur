# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
# Contributor: Michael Bauer <michael@m-bauer.org>
pkgname=radicle-cli-git
_pkgname=radicle-cli
pkgver=20241105.f6aa46a2
pkgrel=4
pkgdesc="Radicle command line interface"
arch=('x86_64' 'aarch64')
_repoid=z3gqcJUoA1n9HaHKufZs5FCSGazv5
url="https://radicle.xyz"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc' 'zlib' 'git>=2.34.0' 'openssh')
makedepends=('cargo' 'asciidoctor')
source=("heartwood::git+https://seed.radicle.xyz/$_repoid.git")
provides=("$_pkgname" "radicle-node")
conflicts=("$_pkgname" "radicle-node")

sha512sums=('SKIP')

_man_pages="rad-id rad-patch rad git-remote-rad radicle-node"

pkgver() {
	cd "$srcdir/heartwood"
	git log -1 --format=%cd.%h --date=short|tr -d -
}

prepare() {
	cd "$srcdir/heartwood"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/heartwood"
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features

	for page in $_man_pages; do
		bash scripts/build-man-pages.sh target "$page.1.adoc"
	done
}

check() {
	cd "$srcdir/heartwood"
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/heartwood"
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
