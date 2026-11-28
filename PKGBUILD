# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine-git
pkgver=r1014.337c475
pkgrel=1
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('BSD-2-Clause')
makedepends=(clang cmake git jq libc++ rust)
depends=(
	bubblewrap
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
	"${pkgname%-git}::git+https://github.com/hgaiser/moonshine"
)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release --workspace --locked
	# ferriscope's WSI layer, from the ferriscope version in Cargo.lock.
	DESTDIR="$srcdir/wsi" dist/install-wsi.sh
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 target/release/moonshine "$pkgdir/usr/bin/moonshine"
	install -Dm755 dist/start-moonshine.sh "$pkgdir/usr/bin/start-moonshine.sh"
	install -Dm755 dist/moonshine-gamescope "$pkgdir/usr/bin/moonshine-gamescope"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# install-wsi.sh clones ferriscope into target/ferriscope-src/v<version>.
	local ferriscope
	ferriscope=$(printf '%s\n' target/ferriscope-src/v* | sort -V | tail -n1)
	install -Dm644 "$ferriscope/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.ferriscope"
	install -Dm644 "$ferriscope/protocol/ferriscope-swapchain-v1.xml" \
		"$pkgdir/usr/share/licenses/$pkgname/ferriscope-swapchain-v1.xml"
	install -Dm644 dist/moonshine@.service "$pkgdir/usr/lib/systemd/system/moonshine@.service"
	install -Dm644 dist/60-moonshine.rules "$pkgdir/usr/lib/udev/rules.d/60-moonshine.rules"
	install -Dm644 dist/72-moonshine-isolation.rules "$pkgdir/usr/lib/udev/rules.d/72-moonshine-isolation.rules"
	install -Dm644 dist/moonshine-modules.conf "$pkgdir/usr/lib/modules-load.d/moonshine.conf"
	install -Dm644 dist/50-moonshine-inhibit-sleep.rules "$pkgdir/usr/share/polkit-1/rules.d/50-moonshine-inhibit-sleep.rules"
	install -Dm644 dist/moonshine-sysusers.conf "$pkgdir/usr/lib/sysusers.d/moonshine.conf"
	cp -a "$srcdir/wsi/usr" "$pkgdir/"
}
