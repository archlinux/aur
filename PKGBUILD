# Maintainer: Suggon <maharjansagun99@protonmail.com>
pkgname=ttf-comic-mono-patched
pkgver=1.0.0
pkgrel=1
pkgdesc='Comic Mono with corrected metadata and font weights'
license=('MIT')
arch=('any')
url='https://dtinth.github.io/comic-mono-font/'
makedepends=('git' 'fontforge')
provides=('comic-mono')
conflicts=('ttf-comic-mono-git')

_commit='95ef988207abadd99ca63f115773ee7fcbe0f420'

source=(
	"git+https://github.com/dtinth/comic-mono-font.git#commit=${_commit}"
	'patch_comicmono_bold.py'
)
sha256sums=(
	'SKIP'
	'3d036c21f10083111725f91ab78a4a704d5de9d5e312b881f5cf9dc7ca59cd37'
)

prepare() {
	cd "$srcdir/comic-mono-font"

	# Problem 1: ComicMono-Bold's OS/2 weight is "400 Regular" -- same as the
	# regular ComicMono. This causes `fontconfig` to pick up the "bold" variant
	# if the system has both weights installed.

	# Problem 2: ComicMono-Bold is closer to a "Medium" weight, contrary to its
	# name. If Problem 1 is solved, it's now impossible to distinguish bold text in
	# paragraphs with mixed styles.

	# Solution: Rename ComicMono-Bold and its metadata to "Medium", and let the
	# application itself synthesize a "Bold" variant for the family by emboldening
	# the existing "Regular" variant.

	fontforge -script "$srcdir/patch_comicmono_bold.py"
}

package() {
	cd "$srcdir/comic-mono-font"

	install -Dm644 'ComicMono.ttf' -t "${pkgdir}/usr/share/fonts/TTF"
	install -Dm644 'ComicMono-Medium.ttf' -t "${pkgdir}/usr/share/fonts/TTF"
	install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname%-*}"
}
