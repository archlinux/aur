# Maintainer: Juliette Cordor
pkgname=kiri
pkgver=0.2.2
pkgrel=1
pkgdesc='A small, fast container runtime for macOS, Windows and Linux with free Ngrok alternative'
arch=('x86_64' 'aarch64')
url='https://runkiri.com/'
license=('Apache-2.0')
makedepends=(
	'cargo'
	'clang'
)
depends=(
	# provides the kiri cli, engine and daemon
	'kiri-lite'
	'libwebkit2gtk-4.1.so=0-64'
	'libgtk-3.so=0-64'
	'libgdk-3.so=0-64'
	'libgdk_pixbuf-2.0.so=0-64'
	'libjavascriptcoregtk-4.1.so=0-64'
	'libgobject-2.0.so=0-64'
	'libglib-2.0.so=0-64'
	'libgcc_s.so=1-64'
)
options=(!lto)
optdepends=(
	'docker: use the docker cli with kiri'
	'docker-compose: use docker compose with kiri'
	'docker-buildx: use docker buildx with kiri'
)

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/libracoder/kiri/archive/refs/tags/v$pkgver.tar.gz"
	'kiri.sysusers'
)
sha512sums=(
	'a140491540e4985cb2fa887f975266f56274498aaa563c7c733b8a50b335cdeb5de029a386088ae1f28f9d9891d1e5917ccf7c7142c7bf20764eb22e21532e43'
	'1ef4eaf474069e760267a4152b380f7129804335593aa954da19265c015b1dd0f75bbd8795797454cc1f2b36db73aea3e36b4a7b5d703ca5a771f5bcf3836e20'
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo fetch --locked --target host-tuple
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export RUSTFLAGS="-Clinker=clang"

	cargo build --frozen --release -p kiri --features kiri/window
}

check() {
	cd "$srcdir/$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export RUSTFLAGS="-Clinker=clang"

	# tests currently failing
	# cargo test --frozen -p kiri -p kiri-init
}

package() {
	root="$srcdir/$pkgname-$pkgver"
	bindir="$root/target/release"
	servicedir="$root/packaging/linux"

	install -Dm755 "$bindir/kiri" "$pkgdir/usr/lib/kiri/kiri-window"
	# The password prompt for `kiri host-access` (the window's setup checklist).
	install -Dm644 "$servicedir/dev.kiri.host-access.policy" "$pkgdir/usr/share/polkit-1/actions/dev.kiri.host-access.policy"

	# kiri license
	install -Dm644 "$root/LICENSE" "$root/NOTICE" -t "$pkgdir/usr/share/licenses/$pkgname/"

	# app metainfo
	sed -e "s/@VERSION@/$version/" -e "s/@DATE@/$(date -u +%Y-%m-%d)/" "$root/contrib/linux/dev.kiri.Kiri.metainfo.xml" \
		> "$srcdir/dev.kiri.Kiri.metainfo.xml"
	install -Dm644 "$srcdir/dev.kiri.Kiri.metainfo.xml" -t "$pkgdir/usr/share/metainfo/dev.kiri.Kiri.metainfo.xml"

	# desktop entry
	install -Dm644 "$root/contrib/linux/kiri.desktop" "$pkgdir/usr/share/applications/kiri.desktop"
	# app icons
	for s in 16 32 64 128 256 512; do
	    install -Dm644 "$root/brand/icon/png/kiri-app-icon-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/kiri.png"
  	done
  	install -Dm644 "$root/brand/icon/kiri-app-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/kiri.svg"
}