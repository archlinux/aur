# Maintainer: Radiolin <anton.osi@outlook.com>

pkgbase=gnome-software-appstream-git
pkgname=(gnome-software-appstream-git gnome-software-packagekit-plugin-appstream-git)
pkgver=48.0+r177+g149166546
pkgrel=1
pkgdesc='GNOME Software Tools (AppStream Git variant)'
arch=(x86_64 aarch64)
url='https://wiki.gnome.org/Apps/Software/'
license=(GPL2)
makedepends=(
	appstream
	itstool
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
options=(!debug)

pkgver() {
	cd gnome-software
	git describe --long --tags | sed 's/^GNOME_SOFTWARE_//;s/_/./g;s/[^-]*-g/r&/;s/-/+/g'
}

build() {
	# Ensure static library is non-LTO compatible
	CFLAGS+=" -ffat-lto-objects"

	arch-meson gnome-software build \
		-D hardcoded_foss_webapps=false \
		-D hardcoded_proprietary_webapps=false \
		-D webapps=false
	meson compile -C build
}

check() {
	export LANG=en_US.UTF-8
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

package_gnome-software-appstream-git() {
	pkgdesc="GNOME Software (AppStream Git variant)"
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

package_gnome-software-packagekit-plugin-appstream-git() {
	pkgdesc="PackageKit support plugin for GNOME Software (AppStream Git variant)"
	depends=(
		archlinux-appstream-data
		gnome-software-appstream-git
		packagekit
	)
	provides=(gnome-software-packagekit-plugin)
	conflicts=(gnome-software-packagekit-plugin)
	mv packagekit-plugin/* "$pkgdir"
}

