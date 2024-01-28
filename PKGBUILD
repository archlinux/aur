pkgname=shoved
pkgver=0.1.0
pkgrel=1
pkgdesc="A push notification daemon"
arch=("x86_64" "aarch64")
license=("GPL-3.0-only")
makedepends=("cargo")
source=("https://git.sr.ht/~vpzom/shoved/archive/v0.1.0.tar.gz" "shoved.service")
sha256sums=('98dcec2ea1aee02d1d1f7151f463c89d4d5823fd71e700679451418f7c15ed61' 'SKIP')

prepare() {
	cd $pkgname-v$pkgver
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-v$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
	install -Dm644 -t "$pkgdir/usr/lib/systemd/user/" shoved.service

    cd $pkgname-v$pkgver
	install -Dm0755 -t "$pkgdir/usr/bin/" target/release/shoved target/release/shoved-register
}
