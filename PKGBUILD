# Maintainer: Zane Fernandes <zane.ferns360@gmail.com>
_pkgbasename=ghostty
pkgname=${_pkgbasename}-x86_64-v3-git
pkgrel=1
pkgver=r11113.d8e7a6634
pkgdesc="Fast, native, feature-rich terminal emulator with modern x86_64-v3 optimizations and bundled shell integration + terminfo"
arch=('x86_64')
url="https://github.com/ghostty-org/${_pkgbasename}"
provides=('ghostty')
conflicts=('ghostty' 'ghostty-git' 'ghostty-git-zen3')
license=('MIT')
depends=(bzip2
         fontconfig libfontconfig.so
         freetype2 libfreetype.so
         gcc-libs
         glibc
         glib2 libglib-2.0.so libgio-2.0.so libgobject-2.0.so
         gtk4 libgtk-4.so
         gtk4-layer-shell
         libx11
         harfbuzz libharfbuzz.so
         libadwaita libadwaita-1.so
         libpng
         oniguruma
         pixman
         wayland libwayland-client.so
         zlib)
makedepends=(blueprint-compiler
             git
             pandoc-cli
             zig)
source=("git+https://github.com/ghostty-org/${_pkgbasename}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgbasename}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgbasename}"
	ZIG_GLOBAL_CACHE_DIR="${srcdir}/tmp" ./nix/build-support/fetch-zig-cache.sh
	zig build \
		--system "${srcdir}/tmp/p" \
		-Dgtk-wayland=true \
		-Dgtk-x11=true \
		-Dpie=true \
		-Dcpu=x86_64_v3 \
		-Doptimize=ReleaseFast \
		-Demit-docs
}

package() {
	cd "${srcdir}/${_pkgbasename}"
	ZIG_GLOBAL_CACHE_DIR="${srcdir}/tmp" ./nix/build-support/fetch-zig-cache.sh
	DESTDIR="${pkgdir}" zig build install \
		--system "${srcdir}/tmp/p" \
		-Dgtk-wayland=true \
		-Dgtk-x11=true \
		-Dpie=true \
		-Dcpu=x86_64_v3 \
		-Doptimize=ReleaseFast \
		-Demit-docs

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
