# Maintainer: Martin Kühl <martin.kuehl@posteo.net>
# Contributor: Masaki Waga <masakiwaga@gmail.com>
pkgname=teip
pkgver=2.3.2
pkgrel=1
epoch=
pkgdesc='Masking tape to help commands "do one thing well"'
arch=(i686 x86_64 armv6h armv7h)
url="https://github.com/greymd/teip"
license=(MIT)
groups=()
depends=(glibc gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/greymd/teip/archive/v${pkgver}.tar.gz"
        cargo-lock.patch)
sha256sums=('c9e45d9f5fb263a67c42907d05d8a20dd62b910175270a59decc475e66ea6031'
            'c2929a186925d0286fc91e0e37cd370ae6dc23e8e3c4e902a1bd1c8548074edd')

prepare() {
	cd "$pkgname-$pkgver"
	patch -Np0 -i ../cargo-lock.patch
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
