# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=gnome-papers-git
_gitname=papers
pkgver=46.1.r78.g6e9a48dc
pkgrel=1
pkgdesc="A document viewer for PDF and other document formats aimed at the GNOME desktop"
arch=('x86_64')
license=('GPL-2.0')
url="https://gitlab.gnome.org/GNOME/Incubator/papers"
depends=('glibc' 'gcc-libs' 'glib2' 'gtk4' 'dbus' 'libadwaita' 'libgirepository'
         'libnautilus-extension' 'libsecret' 'libxml2' 'exempi' 'gdk-pixbuf2' 'cairo' 'zlib'
         'libspectre' 'libarchive' 'djvulibre' 'poppler-glib' 'libtiff' 'libgxps')
conflicts=('gnome-papers')
provides=('gnome-papers')
makedepends=('rust' 'cargo' 'git' 'meson' 'glib2-devel' 'gobject-introspection' 'gi-docgen' 'itstool')
source=("git+https://gitlab.gnome.org/GNOME/Incubator/papers.git"
	'0001-Sanitize-build-system.patch')
sha256sums=('SKIP'
            '1fca202fcae9bb6e491c7c0aaf88b22d94f47d4a3497b4b64911d73aef24546d')

pkgver() {
	cd "${_gitname}"
	git describe --long | sed 's/^v//;s/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd "${_gitname}"
	for p in "${source[@]}"; do
		if [[ $p == *.patch ]]; then
			git apply -3 "${srcdir}/$p"
		fi
	done
}

build() {
	arch-meson "${_gitname}" build -Dps=enabled
	meson compile -C build
	meson install -C build --destdir "${srcdir}/dest"
}

package() {
	mv dest/* -t "${pkgdir}"
}
