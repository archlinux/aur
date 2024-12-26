# Maintainer: Gregory Anders <greg at gpanders dot com>
_pkgbasename=ghostty
pkgname=${_pkgbasename}
pkgrel=1
pkgver=1.0.0
pkgdesc="Fast, native, feature-rich terminal emulator pushing modern features"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/ghostty-org/${_pkgbasename}"
provides=('ghostty')
conflicts=('ghostty')
license=()
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
source=("https://github.com/ghostty-org/ghostty/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bd12953c8bbe7149e2f94e7e578a88e981932a69aa483f5ce9a2cfba726e0015')

build() {
        cd "${srcdir}/${_pkgbasename}-${pkgver}"

	ZIG_GLOBAL_CACHE_DIR="${srcdir}/tmp" ./nix/build-support/fetch-zig-cache.sh
	zig build --system "${srcdir}/tmp/p" -Doptimize=ReleaseFast -Demit-docs
}

package() {
	cd "${srcdir}/${_pkgbasename}-${pkgver}"

	zig build -p "${pkgdir}"/usr --system "${srcdir}/tmp/p" -Doptimize=ReleaseFast -Demit-docs
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$_pkgbasename/LICENSE"
}
