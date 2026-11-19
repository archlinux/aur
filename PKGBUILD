# Maintainer: szdytom <szdytom@users.noreply.github.com>
#
# `markview` builds the same program from source. Both install the same files,
# so they conflict with each other.
pkgname=markview-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='A fast, native Markdown reader with publication-quality typography.'
arch=('x86_64' 'aarch64')
url='https://github.com/szdytom/markview'
license=('MIT')
options=('!strip' '!debug')
depends=(
	'fontconfig'
	'glibc'
	'hicolor-icon-theme'
	'libgcc'
	'libx11'
	'libxcursor'
	'libxi'
	'libxkbcommon'
	'wayland'
	'vulkan-icd-loader'
	'xdg-desktop-portal'
)
depends_aarch64=('libglvnd')
optdepends=(
	'noto-fonts-cjk: CJK glyphs for Chinese, Japanese, and Korean text'
	'noto-fonts-emoji: colour Emoji glyphs'
	'vulkan-intel: Vulkan driver for Intel GPUs'
	'vulkan-nouveau: Vulkan driver for NVIDIA GPUs with Nouveau'
	'vulkan-radeon: Vulkan driver for AMD GPUs'
)
provides=('markview')
conflicts=('markview')
install="$pkgname.install"
# The release archive carries only the executable and the license texts. The
# desktop entry and the icons do not exist as standalone release assets, so the
# matching source archive is fetched as well and `prepare()` takes them from
# there. Every source is checksummed; nothing is downloaded during packaging.
source=(
	"markview-$pkgver-src.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	'markview.mime.xml'
)
source_x86_64=(
	"$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/markview-x86_64-unknown-linux-gnu.tar.gz"
)
source_aarch64=(
	"$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/markview-aarch64-unknown-linux-gnu.tar.gz"
)
sha256sums=(
	'9056657e49b3f67b6620d175132ecb65a38c32aa316ff5ec76c7cf03a1f8a3a8'
	'c2b54efc155e407495127927cabafb92b369a4ead7e1a04d8246f9939bf280b0'
)
sha256sums_x86_64=('6cfc033e9c2943dc6d3d26102134a37874674560a17781a9ac1bb06adbea783f')
sha256sums_aarch64=('122fe6a25fd171425dbe853b02121c47ef1caa76a7b31b6b654a7cd75c2b6cf3')

prepare() {
	local src="$srcdir/markview-$pkgver"

	bsdtar -x --no-same-owner -f "$srcdir/markview-$pkgver-src.tar.gz" -C "$srcdir" \
		"markview-$pkgver/packaging/markview.desktop" \
		"markview-$pkgver/assets/markview-icon-color.svg"
	mv "$src/packaging/markview.desktop" "$srcdir/markview.desktop"
	mv "$src/assets/markview-icon-color.svg" "$srcdir/markview-icon-color.svg"

	local size
	for size in 16 32 48 64 128 256 512 1024; do
		bsdtar -x --no-same-owner -f "$srcdir/markview-$pkgver-src.tar.gz" \
			-C "$srcdir" "markview-$pkgver/assets/icons/markview-$size.png"
		mv "$src/assets/icons/markview-$size.png" "$srcdir/markview-$size.png"
	done
	rm -rf "$src"
}

package() {
	local doc="$srcdir/markview-$CARCH-unknown-linux-gnu"

	install -Dm755 "$doc/markview" "$pkgdir/usr/bin/markview"

	install -Dm644 "$srcdir/markview.desktop" \
		"$pkgdir/usr/share/applications/markview.desktop"
	install -Dm644 "$srcdir/markview-icon-color.svg" \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/markview.svg"
	for size in 16 32 48 64 128 256 512 1024; do
		install -Dm644 "$srcdir/markview-$size.png" \
			"$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/markview.png"
	done
	install -Dm644 "$srcdir/markview.mime.xml" \
		"$pkgdir/usr/share/mime/packages/markview.xml"

	install -Dm644 "$doc/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "$doc/THIRD_PARTY.md" \
		"$pkgdir/usr/share/doc/$pkgname/THIRD_PARTY.md"
	install -Dm644 "$doc/licenses/KaTeX-OFL.txt" \
		"$pkgdir/usr/share/doc/$pkgname/KaTeX-OFL.txt"
	install -Dm644 "$doc/licenses/Noto-OFL.txt" \
		"$pkgdir/usr/share/doc/$pkgname/Noto-OFL.txt"
	install -Dm644 "$doc/licenses/Lucide-ISC.txt" \
		"$pkgdir/usr/share/doc/$pkgname/Lucide-ISC.txt"
	install -Dm644 "$doc/licenses/RobotoFlex-OFL.txt" \
		"$pkgdir/usr/share/doc/$pkgname/RobotoFlex-OFL.txt"
	install -Dm644 "$doc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
