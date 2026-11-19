# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine
pkgver=0.18.0
pkgrel=2
_ferriscope_ver=0.1.0
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('BSD-2-Clause')
makedepends=(clang cmake git jq libc++ rust)
depends=(
	gcc-libs
	glibc
	libevdev
	libxkbcommon
	mesa
	opus
	wayland
	xorg-xwayland
)
provides=(moonshine)
conflicts=(moonshine)
options=(!lto)

source=(
	"https://github.com/hgaiser/moonshine/archive/refs/tags/v$pkgver.tar.gz"
	"ferriscope-$_ferriscope_ver.tar.gz::https://github.com/hgaiser/ferriscope/archive/refs/tags/v$_ferriscope_ver.tar.gz"
)
sha256sums=('7eb2e22a8ed48137833ba281770d3b45f6a1aa71814b4877f28cae620d4d4a5a'
            'f2da0cb2d66756f691d2c0ca55b8d04eef6e5c0500ba8fbc6d9bd68c45960baa')

build() {
	cd "$srcdir/moonshine-$pkgver"
	cargo build --release --workspace --locked
	# ferriscope's WSI layer, built from the verified source archive. The
	# version must match ferriscope in Cargo.lock.
	FERRISCOPE_SRC="$srcdir/ferriscope-$_ferriscope_ver" \
		DESTDIR="$srcdir/wsi" dist/install-wsi.sh
}

package() {
	cd "$srcdir/moonshine-$pkgver"
	install -Dm755 target/release/moonshine "$pkgdir/usr/bin/moonshine"
	install -Dm755 dist/start-moonshine.sh "$pkgdir/usr/bin/start-moonshine.sh"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/ferriscope-$_ferriscope_ver/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE.ferriscope"
	install -Dm644 "$srcdir/ferriscope-$_ferriscope_ver/protocol/ferriscope-swapchain-v1.xml" \
		"$pkgdir/usr/share/licenses/$pkgname/ferriscope-swapchain-v1.xml"
	install -Dm644 dist/moonshine@.service "$pkgdir/usr/lib/systemd/system/moonshine@.service"
	install -Dm644 dist/60-moonshine.rules "$pkgdir/usr/lib/udev/rules.d/60-moonshine.rules"
	install -Dm644 dist/moonshine-modules.conf "$pkgdir/usr/lib/modules-load.d/moonshine.conf"
	install -Dm644 dist/50-moonshine-inhibit-sleep.rules "$pkgdir/usr/share/polkit-1/rules.d/50-moonshine-inhibit-sleep.rules"
	install -Dm644 dist/moonshine-sysusers.conf "$pkgdir/usr/lib/sysusers.d/moonshine.conf"
	cp -a "$srcdir/wsi/usr" "$pkgdir/"
}
