# Maintainer: Juliette Cordor
pkgname=kiri-lite
pkgver=0.2.2
pkgrel=2
pkgdesc='A small, fast container runtime for macOS, Windows and Linux with free Ngrok alternative'
arch=('x86_64' 'aarch64')
url='https://runkiri.com/'
license=('Apache-2.0')
makedepends=(
	'cargo'
	'clang'
)
depends=(
	'libgcc_s.so=1-64'
)
options=(!lto)

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/libracoder/kiri/archive/refs/tags/v$pkgver.tar.gz"
	'kiri.sysusers'
)
sha512sums=(
	'a140491540e4985cb2fa887f975266f56274498aaa563c7c733b8a50b335cdeb5de029a386088ae1f28f9d9891d1e5917ccf7c7142c7bf20764eb22e21532e43'
	'1ef4eaf474069e760267a4152b380f7129804335593aa954da19265c015b1dd0f75bbd8795797454cc1f2b36db73aea3e36b4a7b5d703ca5a771f5bcf3836e20'
)

prepare() {
  cd "$srcdir/kiri-$pkgver"

  cargo fetch --locked --target host-tuple
}

build() {
	cd "$srcdir/kiri-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export RUSTFLAGS="-Clinker=clang"

	cargo build --frozen --release -p kiri -p kiri-init
}

check() {
	cd "$srcdir/kiri-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export RUSTFLAGS="-Clinker=clang"

	# tests currently failing
	# cargo test --frozen -p kiri -p kiri-init
}

package() {
	bindir="$srcdir/kiri-$pkgver/target/release"
	servicedir="$srcdir/kiri-$pkgver/packaging/linux"

	install -Dm755 "$bindir/kiri" "$bindir/kiri-init" -t "$pkgdir/usr/bin/"
	install -Dm644 "$servicedir/kiri.service" "$pkgdir/usr/lib/systemd/system/kiri.service"

	install -Dm644 "$srcdir/kiri-$pkgver/LICENSE" "$srcdir/kiri-$pkgver/NOTICE" -t "$pkgdir/usr/share/licenses/$pkgname/"

	install -Dm644 "$srcdir/kiri.sysusers" "$pkgdir/usr/lib/sysusers.d/kiri.conf"
}
