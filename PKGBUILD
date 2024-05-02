# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=systemctl-tui
pkgver=0.3.4
pkgrel=1
pkgdesc='A fast, simple TUI for interacting with systemd services and their logs'
arch=(x86_64)
url="https://github.com/rgwood/$pkgname"
license=(MIT)
depends=(gcc-libs # libgcc_s.so
         glibc) # libm.so libc.so
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('0e759b3fad3d947f23424ff34a81c30310446a7f3da4802966d99e408b07408b')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

package() {
	cd "$_archive"
	install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/$pkgname"
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/$pkgname/" LICENSE
}
