# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gtg
pkgver=0.6
pkgrel=9
pkgdesc='Personal GTD like organizer for the GNOME desktop environment'
url=https://getting-things-gnome.github.io
arch=(any)
license=(GPL-2.0-only)
depends=(gtksourceview4 gnome-icon-theme python-cairo python-dbus
         python-gobject 'python-liblarch>=3.2' python-lxml)
checkdepends=(python-mock python-nose python-pytest python-caldav)
makedepends=(meson ninja itstool)
optdepends=('pdftk: for the export and print plugin'
            'python-caldav: allows syncing with CalDAV servers'
            'python-cheetah3: for the export and print plugin'
			'texlive-bin: for pdflatex, needed by the export and print plugin'
			'texlive-core: for pdfjam, needed by the export and print plugin')
source=("https://github.com/getting-things-gnome/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.0.tar.xz"
        fix-python3.12.patch)
b2sums=('29c581e4264b3060561123e1b5e204d1fda2cb86fe34c2a285b415554a50ee0299ef500ad7895cbc7e6c00c5f25d2b1e79daad5c8b1233cf3b49f7b2289a8016'
        'a5f6e294f4bb910bb9573e0b890cd778b579fc4cfba42eab986f78bcc8db1aab2bc0b0e35a3018fadb3e4f3532bc8cd316cbf35e2712d7af8360f88d8e14f0c3')

prepare ()
{
	cd "${pkgname}-${pkgver}.0"
	patch -p1 -i"$srcdir/fix-python3.12.patch"
}

build ()
{
	rm -rf build
	arch-meson -Dprofile=default build "${pkgname}-${pkgver}.0"
	ninja -C build
}

check ()
{
	cd "${pkgname}-${pkgver}.0"
	./run-tests
}

package ()
{
	DESTDIR="${pkgdir}" ninja -C build install
}
