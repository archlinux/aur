# Maintainer: Michael Bauer <michael@m-bauer.org>
pkgname=radicle-cli-git
pkgver=20240405.bc247dff
pkgrel=1
pkgdesc="Radicle command line interface"
arch=('x86_64' 'aarch64')
_repoid=z3gqcJUoA1n9HaHKufZs5FCSGazv5
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:$_repoid"
license=('MIT' 'Apache-2.0')
depends=('libusb' 'gcc-libs' 'openssl')
makedepends=('git' 'cargo')
source=("git+https://seed.radicle.xyz/$_repoid.git")

sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_repoid"
	git log -1 --format=%cd.%h --date=short|tr -d -
}

prepare() {
	cd $_repoid
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd $_repoid
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd $_repoid
	cargo test --frozen --all-features
}

package() {
	cd $_repoid
	find target/release \
		-maxdepth 1 \
		-executable \
		-type f \
		-exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
