# Maintainer: Stéphane Jourdois <stephane@jourdois.fr>
pkgname=wlr-utils
pkgver=1.7.0
pkgrel=1
pkgdesc='Native screen tools for wlroots compositors: pick, switch, capture, inspect and annotate — one capture engine'
arch=('x86_64')
url='https://github.com/sjourdois/wlr-utils'
license=('MIT' 'Apache-2.0')
# makepkg's LTO compiles the `webp` crate's vendored libwebp to bitcode the final Rust
# link can't resolve (undefined WebP*/WebPMux* symbols); this build doesn't support it.
options=('!lto')
# The whole suite: EGL/GLES + Wayland + fonts for every tool, libgbm for the
# zero-copy capture path, FFmpeg/VAAPI for wlr-shot recording, PipeWire for its
# audio track, Tesseract/Leptonica for wlr-peek OCR, and D-Bus for wlr-draw's tray.
depends=('wayland' 'libxkbcommon' 'fontconfig' 'libglvnd' 'mesa' 'ffmpeg' 'libva'
         'libpipewire' 'tesseract' 'leptonica' 'dbus')
makedepends=('cargo' 'clang')
optdepends=('noto-fonts-cjk: render CJK (Japanese/Chinese/Korean) text'
            'tesseract-data-eng: English OCR for `wlr-peek ocr`'
            'tesseract-data-fra: French OCR for `wlr-peek ocr`'
            'xdg-desktop-portal-wlr: screencast portal that drives wlr-chooser')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6f13fb7e12db75e8fd17e80b0f1664ca607e886bb3963d7630930e15db61bc32')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# The `wlr-utils` bundle crate builds all five binaries in one shot (it is kept
	# out of the workspace default set, so it must be named explicitly).
	cargo build --frozen --release -p wlr-utils
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --release --workspace
}

package() {
	cd "$pkgname-$pkgver"
	for _bin in wlr-chooser wlr-switcher wlr-peek wlr-shot wlr-draw; do
		install -Dm755 "target/release/$_bin" "$pkgdir/usr/bin/$_bin"
	done
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
	install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
