# Maintainer: Alex Avance <aravance@gmail.com>
pkgname=enclavectl-git
pkgver=r1.1c1b3b6
pkgrel=1
pkgdesc="Control an Enclave CineHome Smart Center over Bluetooth"
arch=('x86_64' 'aarch64')
url="https://github.com/aravance/enclavectl"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('git' 'cargo')
provides=('enclavectl')
conflicts=('enclavectl')
source=("$pkgname::git+https://github.com/aravance/enclavectl.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	install -Dm0755 "target/release/enclavectl" "$pkgdir/usr/bin/enclavectl"
	install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
