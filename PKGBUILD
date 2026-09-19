# Maintainer: szdytom <szdytom@users.noreply.github.com>
#
# `markview` builds the same program from source. Both install the same files,
# so they conflict with each other.
pkgname=markview-bin
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
	"$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/markview-x86_64-unknown-linux-gnu.tar.gz"
	"markview-$pkgver-src.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	'markview.mime.xml'
)
sha256sums=(
	'517f5d19ef6744d35eca4045926a200b3b69464f54195c127d3b003f4b90e332'
	'a5cce31d36515dbf13a84da0c627b5bad18446749a4596988aaf9b1cb1a88b34'
	'c2b54efc155e407495127927cabafb92b369a4ead7e1a04d8246f9939bf280b0'
)

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
	local doc="$srcdir/markview-x86_64-unknown-linux-gnu"

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
	install -Dm644 "$doc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
