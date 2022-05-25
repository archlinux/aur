# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgbase=gnome-software-git
pkgname=(gnome-software-git gnome-software-packagekit-plugin-git)
pkgver=42.0+r367+g0c3e21d1a
pkgrel=1
pkgdesc='GNOME Software Tools'
arch=(x86_64 aarch64)
url='https://wiki.gnome.org/Apps/Software/'
license=(GPL2)
makedepends=(
	appstream
	docbook-xsl
	flatpak
	fwupd
	git
	gnome-online-accounts
	gobject-introspection
	gsettings-desktop-schemas
	gspell
	gtk-doc
	libadwaita
	libpackagekit-glib
	libsysprof-capture
	libxmlb
	malcontent
	meson
	valgrind
)
provides=(gnome-software gnome-software-packagekit-plugin)
conflicts=(gnome-software gnome-software-packagekit-plugin)
source=('git+https://gitlab.gnome.org/GNOME/gnome-software.git')
b2sums=(SKIP)

pkgver() {
 	cd gnome-software
 	git describe --long --tags | sed 's/^GNOME_SOFTWARE_//;s/_/./g;s/[^-]*-g/r&/;s/-/+/g'
}

build() {
	# Ensure static library is non-LTO compatible
	CFLAGS+=" -ffat-lto-objects"

	arch-meson gnome-software build -D soup2=true \
		-D hardcoded_foss_webapps=false -D hardcoded_proprietary_webapps=false -D webapps=false
	meson compile -C build
}

check() {
	# build container troubles
	meson test -C build --print-errorlogs || :
}

_pick() {
	local p="$1" f d; shift
	for f; do
		d="$srcdir/$p/${f#$pkgdir/}"
		mkdir -p "$(dirname "$d")"
		mv "$f" "$d"
		rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
	done
}

package_gnome-software-git() {
	groups=(gnome)
	depends=(
		appstream
		gnome-online-accounts
		gsettings-desktop-schemas
		gspell
		libadwaita
		libpackagekit-glib
		libsysprof-capture
		libxmlb
	)
	optdepends=(
		'flatpak: Flatpak support plugin'
		'fwupd: fwupd support plugin'
		'malcontent: Parental control plugin'
	)
	provides=(gnome-software)
	conflicts=(gnome-software)

	meson install -C build --destdir "$pkgdir"

	local pkglibdir="$pkgdir/usr/lib/gnome-software"
	_pick packagekit-plugin "$pkglibdir"/plugins-*/libgs_plugin_packagekit*.so
}

package_gnome-software-packagekit-plugin-git() {
	pkgdesc="PackageKit support plugin for GNOME Software"
	depends=(
		archlinux-appstream-data
		gnome-software-git
		packagekit
	)
	provides=(gnome-software-packagekit-plugin)
	conflicts=(gnome-software-packagekit-plugin)
	mv packagekit-plugin/* "$pkgdir"
}
