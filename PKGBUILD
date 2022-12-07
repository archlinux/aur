pkgname=httm
pkgver=0.17.9
pkgrel=1
pkgdesc="Prints the size, date and locations of available unique versions (deduplicated by modify time and size) of files residing on ZFS or BTRFS snapshots."
arch=('x86_64')
url="https://github.com/kimono-koans/httm"
license=('MPL-2.0')
conflicts=('httm-bin')
options=('!strip' '!emptydirs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('6a1e9c511dd816956af2b2f44153cd2cc82223c2736899278c6e686c3c53119c4df2e39330b7d613dfa9aa73fbc3340387d8c433c5e6437bafef0d6d9603da6e')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build(){
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# use cargo to build from a tagged release
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --frozen --release --all-features
}

package(){
	# install executable
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# install man page
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"

	# install README.md
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# install LICENSE
	install -Dm644 "${srcdir}/${pkgname}-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
