# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Sir-Photch <sir-photch at posteo dot me>

pkgname=adguardian
_pkgname=AdGuardian-Term
pkgver=1.7.0
pkgrel=1
pkgdesc="Terminal-based, real-time traffic monitoring and statistics for your AdGuard Home instance"
arch=(x86_64)
url="https://github.com/Lissy93/AdGuardian-Term"
license=(MIT)
makedepends=(cargo)
optdepends=('gum: interactive prompt for generation of environment file for authentication')
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz"
	adguardian.bash)

sha512sums=('afcae8af5f4aca2ece103dbc0c4eb76808d55533d5ac7a7605f54f08741b13d7e3b7a1ece1920ec9bb66efcd0e66b01d2144245ae453f55a8abf91ed2b79edf5'
            'e025063ba440cef8e5d6bd764e327397e513e8584a322e95e9805b31284a886c836b56531196d4d1185d8c2ccc8b550fbce03a480a21828c2a9221b3fe798cc4')

options=(!lto) # LTO causes aws-lc-sys to fail to link during cargo build

prepare() {
	cd "$_pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target host-tuple
}

build() {
	cd "$_pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	install -Dm755 adguardian.bash "$pkgdir/usr/bin/$pkgname"
	
    	cd "$_pkgname-$pkgver"

    	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/_$pkgname"

	install -Dm644 .github/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
