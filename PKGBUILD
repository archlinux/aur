# Maintainer: hanker
# Contributor: envolution
# Contributor: James Williams <jowilliams12000 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=wallust
pkgver=3.5.2
pkgrel=1
pkgdesc="Generate colors from an image"
arch=(x86_64 i686)
url="https://codeberg.org/explosion-mental/wallust"
license=(MIT)
depends=(glibc libgcc)
makedepends=(cargo)
optdepends=(imagemagick)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/explosion-mental/$pkgname/archive/$pkgver.tar.gz")
options=(!lto)
sha256sums=('46c2592217f0de968437850b14b2e844f2af4158b70135b2b448dc426c0309a1')

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --features themes,doc --frozen --release
}

package() {
	cd "$pkgname"
	install -Dm755 -t "${pkgdir}/usr/bin" target/release/wallust
	install -Dm644 -t "${pkgdir}/usr/share/man/man1" man/wallust.1 man/wallust-theme.1 man/wallust-cs.1 man/wallust-run.1
	install -Dm644 -t "${pkgdir}/usr/share/man/man5" man/wallust.5
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/wallust/LICENSE"
}
# vim:set ts=2 sw=2 et:
