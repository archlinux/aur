# Maintainer: Luke Horwell <code@horwell.me>
# Contributor: Jonathon Fernyhough <jonathon+m2x.dev>
# Contributor: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of GTK3 package.
# https://gitlab.archlinux.org/archlinux/packaging/packages/gtk3/-/commits/main

__arch_pkg_commit="c2ecfe23993aeff132fbd58d6b1174c98444cbd4"
_gtkver=3.24.43

_gtk3_classic_commit="3b57bf6500de137fafe60f9b6b4cda427be11655"

pkgbase=gtk3-classic
pkgname=($pkgbase)
pkgver=${_gtkver}
pkgrel=2
pkgdesc="Patched GTK+3 that provides a more classic experience"
url="https://github.com/lah7/gtk3-classic"
conflicts=(gtk3 gtk3-typeahead gtk3-print-backends gtk3-nocsd gtk3-nocsd-git gtk3-nocsd-legacy-git)
provides=(gtk3=$_gtkver gtk3-typeahead=$_gtkver gtk3-mushrooms=$_gtkver gtk3-print-backends
          libgtk-3.so libgdk-3.so libgailutil-3.so)
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
	at-spi2-core
	cairo
	desktop-file-utils
	fribidi
	gdk-pixbuf2
	gtk-update-icon-cache
	libepoxy
	librsvg
	libxcomposite
	libxcursor
	libxdamage
	libxi
	libxinerama
	libxkbcommon
	libxrandr
	pango
	shared-mime-info
	wayland
)
optdepends=(
	'adwaita-icon-theme: default icon theme'
	'cantarell-fonts: default font'
	'colord: color management support'
	'dconf: default GSettings backend'
	'libcups: printer support in print dialog'
)
makedepends=(
	cairo
	cantarell-fonts
	desktop-file-utils
	fribidi
	gdk-pixbuf2
	git
	glib2-devel
	gobject-introspection
	gtk-update-icon-cache
	hicolor-icon-theme
	libcups
	libegl
	libepoxy
	libgl
	librsvg
	libxcomposite
	libxcursor
	libxdamage
	libxi
	libxinerama
	libxkbcommon
	libxrandr
	meson
	pango
	python-packaging
	quilt
	sassc
	shared-mime-info
	wayland
	wayland-protocols
)
install=gtk3.install
source=(
	git+$url.git#commit=$_gtk3_classic_commit
 	"https://download.gnome.org/sources/gtk+/${pkgver%.*}/gtk+-$_gtkver.tar.xz"

	"gtk-query-immodules-3.0.hook::https://gitlab.archlinux.org/archlinux/packaging/packages/gtk3/-/raw/$__arch_pkg_commit/gtk-query-immodules-3.0.hook"
	settings.ini
)
sha256sums=('440e8782716db5cb8b8783d3f4f14c5aaf653c53d6111365c77f7bc947a9281c'
            '7e04f0648515034b806b74ae5d774d87cffb1a2a96c468cb5be476d51bf2f3c7'
            'a0319b6795410f06d38de1e8695a9bf9636ff2169f40701671580e60a108e229'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202')

prepare()
{
	cd gtk+-$_gtkver
	QUILT_PATCHES=../$pkgbase quilt push -av

	rm -f "$srcdir"/gtk+-"$_gtkver"/gtk/theme/Adwaita/gtk-contained{,-dark}.css
	cat "$srcdir/$pkgbase/smaller-adwaita.css" | tee -a "$srcdir"/gtk+-"$_gtkver"/gtk/theme/Adwaita/gtk-contained{,-dark}.css > /dev/null
}

build()
{
	CFLAGS+=" -DG_DISABLE_CAST_CHECKS"

	# 64-bit
	arch-meson gtk+-$_gtkver build \
		-D broadway_backend=true \
		-D colord=auto \
		-D demos=false \
		-D examples=false \
		-D introspection=true \
		-D tests=false \
		-D installed_tests=false
	ninja -C build
}

package_gtk3-classic()
{
	DESTDIR="$pkgdir" meson install -C build

	install -Dm644 settings.ini -t "$pkgdir/usr/share/gtk-3.0"
	install -Dm644 gtk-query-immodules-3.0.hook -t "$pkgdir/usr/share/libalpm/hooks"

	rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}
