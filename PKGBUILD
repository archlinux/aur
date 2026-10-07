# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Sir-Photch <sir-photch at posteo dot me>

pkgname=adguardian
_pkgname=AdGuardian-Term
pkgver=1.8.0
pkgrel=1
pkgdesc="Terminal-based, real-time traffic monitoring and statistics for your AdGuard Home instance"
arch=(x86_64)
url="https://github.com/Lissy93/AdGuardian-Term"
license=(MIT)
makedepends=(cargo)
optdepends=('gum: interactive prompt for generation of environment file for authentication')
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz"
	adguardian.bash)

sha512sums=('c4f3958f8b7e1628b00bbc0a208addb674801729968c001c1ca4d8a22333e9d6fa83de806b37d56c8f158c25cdd2e2aaa8acdeec14a540d8c6cf85af8dd453fc'
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
