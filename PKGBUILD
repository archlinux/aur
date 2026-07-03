# Maintainer: Gregory Anders <greg at gpanders dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: kaij <contact at kaij dot tech>

_pkgbase=ghostty
pkgname=($_pkgbase-git $_pkgbase-shell-integration-git $_pkgbase-terminfo-git $_pkgbase-nautilus-git)
pkgrel=1
pkgver=1.3.1.r1209.gd560c64
pkgdesc="Fast, native, feature-rich terminal emulator pushing modern features"
arch=(x86_64 aarch64 i686)
url="https://github.com/ghostty-org/$_pkgbase"
license=(MIT)
depends=(bzip2
         fontconfig libfontconfig.so
         freetype2 libfreetype.so
         glibc # libc.so libm.so
         glib2 libglib-2.0.so libgio-2.0.so libgobject-2.0.so
         gtk4 libgtk-4.so
         gtk4-layer-shell
         libx11 # libX11.so
         harfbuzz libharfbuzz.so
         libadwaita libadwaita-1.so
         libpng
         oniguruma # libonig.so
         pixman
         wayland libwayland-client.so
         zlib)
makedepends=(blueprint-compiler
             git
             pandoc-cli
             'zig<0.16.0')
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$_pkgbase"
	# c.f. https://github.com/ghostty-org/ghostty/discussions/13176
	echo "https://deps.files.ghostty.org/uucode-0.2.0-ZZjBPqZVVABQepOqZHR7vV_NcaN-wats0IB6o-Exj6m9.tar.gz" >> build.zig.zon.txt
	ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache/" ./nix/build-support/fetch-zig-cache.sh
}

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "$_pkgbase"
	DESTDIR=build zig build \
		--summary all \
		--prefix "/usr" \
		--system "$srcdir/zig-global-cache/p" \
		-Doptimize=ReleaseFast \
		-Dgtk-x11=true \
		-Dcpu=baseline \
		-Dpie=true \
		-Demit-docs \
		-Dversion-string="${pkgver%.r*}-r${pkgver#*.r}-$pkgrel-arch" \
		--build-id=sha1
}

package_ghostty-git() {
	depends+=("${_pkgbase}"-shell-integration-git
	          "${_pkgbase}"-terminfo-git)
	provides=("${pkgname%-git}=$pkgver")
	conflicts=(${pkgname%-git})
	optdepends+=("ghostty-nautilus: Open in Ghostty context menu in GNOME Files")
	cd "$_pkgbase"
	cp -a build/* "$pkgdir/"
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/$pkgname/" LICENSE
	rm -r "$pkgdir"/usr/share/terminfo
	rm -r "$pkgdir"/usr/share/ghostty/shell-integration
}

package_ghostty-shell-integration-git() {
	pkgdesc='Shell integration scripts for ghostty'
	depends=()
	provides=("${pkgname%-git}=$pkgver")
	conflicts=(${pkgname%-git})
	cd "$_pkgbase"
	mkdir -p "$pkgdir/usr/share/ghostty/shell-integration"
	cp -r build/usr/share/ghostty/shell-integration/* "$pkgdir/usr/share/ghostty/shell-integration/"
}

package_ghostty-terminfo-git() {
	pkgdesc='Terminfo for ghostty'
	depends=()
	provides=("${pkgname%-git}=$pkgver")
	conflicts=(${pkgname%-git})
	cd "$_pkgbase"
	mkdir -p "$pkgdir/usr/share/terminfo"
	cp -r build/usr/share/terminfo/* "$pkgdir/usr/share/terminfo/"
}

package_ghostty-nautilus-git() {
	pkgdesc='Open in Ghostty for GNOME Files'
	depends=(ghostty nautilus-python)
	provides=("${pkgname%-git}=$pkgver")
	conflicts=(${pkgname%-git})
	# Unlike the rest of ghostty, the nautilus extension is GPL-2.0-or-later
	# because nautilus-python itself is GPL-2 as well.
	license=(GPL-2.0-or-later)
	cd "$_pkgbase"
	mkdir -p "$pkgdir"/usr/share/nautilus-python/
	cp -r build/usr/share/nautilus-python/* "$pkgdir"/usr/share/nautilus-python/
}
