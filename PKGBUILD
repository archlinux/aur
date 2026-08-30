# Maintainer: Umar Alfarouk <medrivia@gmail.com>

pkgname=mpv-music
pkgver=0.27.1
pkgrel=1
pkgdesc='Blazing-fast, terminal-native music player and library browser for mpv'
arch=(x86_64 aarch64)
url='https://github.com/FurqanHun/mpv-music'
license=(MIT)
depends=('mpv' 'libgcc')
optdepends=('yt-dlp: for playing URLs'
            'deno: JS runtime for YouTube playback (recommended)'
            'nodejs: alternative JS runtime for YouTube playback')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('840395c0eb51341de44c5679eabc72d020fef50c2bfebd17b8cfb83771a8a050')

# NOTE: the 'update' self-updater feature is intentionally not enabled;
# updates arrive via pacman.

# Disable LTO on x86_64: system-wide LTO poisons ring's C symbol visibility
# causing "undefined symbol: ring_core_0_17_14__LIMBS_less_than" errors
# https://github.com/briansmith/ring/issues/2746
[[ $CARCH == 'x86_64' ]] && options=(!lto)

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --frozen
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/mpv-music "$pkgdir/usr/bin/mpv-music"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
