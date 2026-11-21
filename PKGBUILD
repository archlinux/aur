# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine
pkgver=0.19.0
pkgrel=1
_ferriscope_ver=0.2.2
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
sha256sums=('f24aa3eeef166cdd646247c6ed8e13beec51ca1651163da5ad01649522361b9d'
            '8fbfcce2c117e558da8955e32d7d1cba5f21863040e324b36e0dcfabc3dc1ef5')

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
	install -Dm755 dist/moonshine-gamescope "$pkgdir/usr/bin/moonshine-gamescope"
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
