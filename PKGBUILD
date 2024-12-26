# Maintainer: Gregory Anders <greg at gpanders dot com>
_pkgbasename=ghostty
pkgname=${_pkgbasename}
pkgrel=1
pkgver=1.0.0
pkgdesc="Fast, native, feature-rich terminal emulator pushing modern features"
arch=('x86_64' 'aarch64' 'i686')
url="https://ghostty.org"
provides=('ghostty')
conflicts=('ghostty')
license=('MIT')
depends=(
	'bzip2'
	'fontconfig'
	'freetype2'
	'gtk4'
	'harfbuzz'
	'libadwaita'
	'libpng'
	'oniguruma'
	'pixman'
	'zlib'
)
makedepends=('zig>=0.13.0' 'zig<0.14.0' 'pandoc-cli')
source=("https://release.files.ghostty.org/${pkgver}/ghostty-source.tar.gz")
sha256sums=('7fcb5fed08bd23d54be138af4f63a78cf5addddbe40322465b520cf14c46f181')

build() {
        cd "${srcdir}/${_pkgbasename}-source"

	ZIG_GLOBAL_CACHE_DIR="${srcdir}/tmp" ./nix/build-support/fetch-zig-cache.sh
	zig build --system "${srcdir}/tmp/p" -Doptimize=ReleaseFast -Demit-docs
}

package() {
	cd "${srcdir}/${_pkgbasename}-source"

	zig build -p "${pkgdir}"/usr --system "${srcdir}/tmp/p" -Doptimize=ReleaseFast -Demit-docs
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$_pkgbasename/LICENSE"
}
