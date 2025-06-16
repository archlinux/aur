# Maintainer: Myriade <myriademedieval@proton.me>
pkgname=dong
pkgver=0.1.1
pkgrel=2
pkgdesc="A striking clock on your computer"
arch=(x86_64)
url="https://gitlab.com/TuTiuTe/dong"
license=('GPL-3.0-only')
depends=(
	alsa-lib
	gcc-libs
	glibc
)
makedepends=(
	cargo
	alsa-lib
	glibc
	gcc-libs
)
provides=(dong)
conflicts=(dong)
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
noextract=()
sha256sums=('632ebf4c01926b3bbb6112a930cac3d8ee97e8bd1c3470a48aff94a8fadcff47')
options=(!lto !debug)

prepare() {
	cd "$pkgname-v$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-v$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

# check() {
# 	cd "$pkgname-v$pkgver"
# 	export RUSTUP_TOOLCHAIN=stable
# 	export CARGO_TARGET_DIR=target
# 	cargo test --frozen --all-features
# }

package() {
	cd "$pkgname-v$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644  "daemon/systemd/dong.service" "${pkgdir}/etc/systemd/user/dong.service"
}
