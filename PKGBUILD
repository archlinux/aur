# Maintainer: Stéphane Jourdois <stephane@jourdois.fr>
pkgname=wlr-utils
pkgver=1.11.1
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
sha256sums=('5c2c8c3d62f7f660775c4ddc36a09334f18bb99b21a5b3b5426049d7f605f977')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# The `wlr-utils` bundle crate builds all six binaries in one shot (it is kept
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
	DESTDIR="$pkgdir" PREFIX=/usr sh packaging/install.sh
}
