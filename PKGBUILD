# Maintainer: szdytom <szdytom@users.noreply.github.com>
#
# `markview-bin` packages the prebuilt archive from the same release. Both
# install the same files, so they conflict with each other.
pkgname=markview
pkgver=0.1.4
pkgrel=1
pkgdesc='A fast, native Markdown reader with publication-quality typography.'
arch=('x86_64')
url='https://github.com/szdytom/markview'
license=('MIT')
depends=(
	'fontconfig'
	'glibc'
	'libx11'
	'libxcursor'
	'libxi'
	'libxkbcommon'
	'wayland'
	'vulkan-icd-loader'
	'xdg-desktop-portal'
)
makedepends=('cargo' 'rust>=1.92' 'fontconfig')
optdepends=(
	'noto-fonts-cjk: CJK glyphs for Chinese, Japanese, and Korean text'
	'noto-fonts-emoji: colour Emoji glyphs'
	'vulkan-intel: Vulkan driver for Intel GPUs'
	'vulkan-nouveau: Vulkan driver for NVIDIA GPUs with Nouveau'
	'vulkan-radeon: Vulkan driver for AMD GPUs'
)
install="$pkgname.install"
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	'markview.mime.xml'
)
sha256sums=(
	'a5cce31d36515dbf13a84da0c627b5bad18446749a4596988aaf9b1cb1a88b34'
	'c2b54efc155e407495127927cabafb92b369a4ead7e1a04d8246f9939bf280b0'
)

build() {
	local cargo_home="$srcdir/cargo-home"
	local target_dir="$srcdir/target"
	export CARGO_HOME="$cargo_home"
	export CARGO_TARGET_DIR="$target_dir"

	cd "$pkgname-$pkgver"

	# `makepkg` exports Arch's `CFLAGS`, whose `-flto=auto` the `cc` crate
	# passes while compiling `ring`'s hand-written assembly. Those LTO objects
	# then lose their `ring_core_*` symbols at rustc's final link, so the
	# compiler flags are dropped for this build and cargo owns the C flags.
	unset CFLAGS CXXFLAGS LDFLAGS

	# Pinning to the stable toolchain keeps the build off a rustup-default
	# nightly. `+stable` is a no-op on a plain `rust` installation.
	# The registry lives under `$srcdir` so that nothing is written to the
	# builder's home directory, and so the cache is removed with the build.
	cargo +stable fetch --locked
	cargo +stable build --release --locked --offline
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 "$srcdir/target/release/$pkgname" \
		"$pkgdir/usr/bin/$pkgname"

	install -Dm644 packaging/markview.desktop \
		"$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 assets/markview-icon-color.svg \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
	for size in 16 32 48 64 128 256 512 1024; do
		install -Dm644 "assets/icons/$pkgname-$size.png" \
			"$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
	done
	install -Dm644 "$srcdir/markview.mime.xml" \
		"$pkgdir/usr/share/mime/packages/$pkgname.xml"

	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 THIRD_PARTY.md "$pkgdir/usr/share/doc/$pkgname/THIRD_PARTY.md"
	install -Dm644 licenses/KaTeX-OFL.txt \
		"$pkgdir/usr/share/doc/$pkgname/KaTeX-OFL.txt"
	install -Dm644 licenses/Noto-OFL.txt \
		"$pkgdir/usr/share/doc/$pkgname/Noto-OFL.txt"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
