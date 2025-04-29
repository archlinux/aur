# Maintainer: Joey Dalton <jdeb89 at tuta dot io>

# This file is based on the gtk3-classic PKGBUILD:
# https://aur.archlinux.org/packages/gtk3-classic
# and uses xfce patches from:
# https://github.com/simplejack-src/gtk3-classic-xfce (repository no longer available)

__arch_pkg_commit="8f2788260973cbce3821ba4a4bacd265ef468425"
_gtkver=3.24.49

_gtk3_classic_commit="d20969e08403d4df124ef44138977b9cff6e4c44"

_gtk3_classic=gtk3-classic

pkgbase=gtk3-classic-xfce
pkgname=($pkgbase)
pkgver=${_gtkver}
pkgrel=1
pkgdesc="Patched GTK+3 that provides a more classic experience, with patches for xfce"
url="https://github.com/lah7/gtk3-classic"
conflicts=(
	gtk3
    gtk3-classic
	gtk3-typeahead
	gtk3-print-backends
	gtk3-nocsd
	gtk3-nocsd-git
	gtk3-nocsd-legacy-git
)
provides=(
    gtk3-classic=$_gtkver
	gtk3=$_gtkver
	gtk3-typeahead=$_gtkver
	gtk3-mushrooms=$_gtkver
	gtk3-print-backends
	libgtk-3.so
	libgdk-3.so
	libgailutil-3.so
)
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
	cantarell-fonts
	git
	glib2-devel
	gobject-introspection
	hicolor-icon-theme
	libcups
	libegl
	libgl
	meson
	python-packaging
	quilt
	sassc
	wayland-protocols
)
install=gtk3.install
source=(git+$url.git#commit=$_gtk3_classic_commit
 	    "https://gitlab.gnome.org/GNOME/gtk/-/archive/$_gtkver/gtk-$_gtkver.tar.gz"
	    "gtk-query-immodules-3.0.hook::https://gitlab.archlinux.org/archlinux/packaging/packages/gtk3/-/raw/$__arch_pkg_commit/gtk-query-immodules-3.0.hook"
	    settings.ini
        appearance__file-chooser-xfce.patch
)
sha256sums=('6fbfbe5eee1d8dff978a3d2c9fb2ac0e0ad3f0fe78b227225d18ed144de8d0d9'
            'a2958d82986c81794e953a3762335fa7c78948706d23cced421f7245ca544cbc'
            'a0319b6795410f06d38de1e8695a9bf9636ff2169f40701671580e60a108e229'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'c443bfa1f70ac5ce2102c83b38b193e78f614b606cb0dae807ecd25d591f1e99')

prepare()
{
	cd gtk-$_gtkver
    cp ../"appearance__file-chooser-xfce.patch" ../"$_gtk3_classic"
    echo "appearance__file-chooser-xfce.patch" >> ../"$_gtk3_classic"/series
	QUILT_PATCHES=../"$_gtk3_classic" quilt push -av

	rm -f "$srcdir"/gtk-"$_gtkver"/gtk/theme/Adwaita/gtk-contained{,-dark}.css
	cat "$srcdir/$pkgbase/smaller-adwaita.css" | tee -a "$srcdir"/gtk-"$_gtkver"/gtk/theme/Adwaita/gtk-contained{,-dark}.css > /dev/null
}

build()
{
	CFLAGS+=" -DG_DISABLE_CAST_CHECKS"

	# 64-bit
	arch-meson gtk-$_gtkver build \
		-D broadway_backend=true \
		-D colord=auto \
		-D demos=false \
		-D examples=false \
		-D introspection=true \
		-D tests=false \
		-D installed_tests=false
	ninja -C build
}

package_gtk3-classic-xfce()
{
	DESTDIR="$pkgdir" meson install -C build

	install -Dm644 settings.ini -t "$pkgdir/usr/share/gtk-3.0"
	install -Dm644 gtk-query-immodules-3.0.hook -t "$pkgdir/usr/share/libalpm/hooks"

	rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}
