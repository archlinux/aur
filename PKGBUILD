# Maintainer: cuzrawr
# Contributor: Jonathon Fernyhough <jonathon+m2x.dev>
# Contributor: Luke Horwell <code@horwell.me>
# Contributor: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of GTK3 package.
# https://git.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/gtk3

__arch_pkg_commit="ef36b28a894a3de835464d89a3ac0bc2898c2317"
_gtkver=3.24.34

_gtk3_classic_commit="221a3257c5d804520e3a26270ac2fc4673d39eb4"

pkgbase=gtk3-classic-noatk-64
pkgname=($pkgbase)
pkgver=${_gtkver}
pkgrel=1
pkgdesc="GTK3 patched to provide a more classic experience. No ATK. No 32-bit libs. No printing, cloudproviders, etc. ( see PKGBUILD for details ) ."
url="https://github.com/lah7/gtk3-classic"
conflicts=(gtk3 gtk3-classic gtk3-typeahead gtk3-print-backends)
provides=(gtk3=$_gtkver gtk3-typeahead=$_gtkver gtk3-print-backends
          libgtk-3.so libgdk-3.so libgailutil-3.so)
arch=(x86_64)
license=(LGPL)
makedepends=(
	git gobject-introspection libcanberra meson quilt sassc

	atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2 fribidi
	libxcomposite libxdamage pango shared-mime-info libxkbcommon
	json-glib librsvg desktop-file-utils mesa gtk-update-icon-cache
	adwaita-icon-theme
)
install=gtk3.install
source=(
	git+$url.git#commit=$_gtk3_classic_commit
	"https://download.gnome.org/sources/gtk+/${pkgver%.*}/gtk+-$_gtkver.tar.xz"
	"gtk-query-immodules-3.0.hook::https://raw.githubusercontent.com/archlinux/svntogit-packages/$__arch_pkg_commit/trunk/gtk-query-immodules-3.0.hook"
	settings.ini
)
sha256sums=('SKIP'
            'dbc69f90ddc821b8d1441f00374dc1da4323a2eafa9078e61edbe5eeefa852ec'
            'a0319b6795410f06d38de1e8695a9bf9636ff2169f40701671580e60a108e229'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202')
prepare()
{
	cd gtk+-$_gtkver
	mv ../gtk3-classic ../$pkgbase
	QUILT_PATCHES=../$pkgbase quilt push -av

	rm -f "$srcdir"/gtk+-"$_gtkver"/gtk/theme/Adwaita/gtk-contained{,-dark}.css
	cat "$srcdir/$pkgbase/smaller-adwaita.css" | tee -a "$srcdir"/gtk+-"$_gtkver"/gtk/theme/Adwaita/gtk-contained{,-dark}.css > /dev/null
}

build()
{
    #CFLAGS=" -DG_DISABLE_CAST_CHECKS -O3 -pipe -fno-plt"
    #CXXFLAGS=" -Os -pipe -fno-plt"
    #

    CFLAGS+="  -O3 -pipe -fno-plt  -DG_DISABLE_CAST_CHECKS"
    CXXFLAGS+=" -Os -pipe -fno-plt "


	# Remove atk - patch (aka at-spi/atk-bridge removal patch)
	# Installed atk package (libs) still required for build.
        # Original NETBSD patch included but not used ( file: original.NETBSD.atk-bridge.patch )
        # Here the same patch trough sed util:

	sed -i 's/atk_bridge_adaptor_init.*$//g' "gtk+-$_gtkver/gtk/a11y/gtkaccessibility.c"
	sed -i 's/^#.*atk-bridge.h.$//g' "gtk+-$_gtkver/gtk/a11y/gtkaccessibility.c"

	# 64-bit build
	# Enable or disable options by commenting lines ( or change true / false )
        
        arch-meson --buildtype release --strip gtk+-$_gtkver build \
                -D broadway_backend=false \
                -D demos=false \
                -D tests=false \
                -D installed_tests=false \
                -D print_backends=file \
                -D win32_backend=false \
                -D quartz_backend=false  \
                -D colord=no \
                -D cloudproviders=false \
                -D gtk_doc=false \
                -D examples=false \
                -D print_backends=file \
                -D tracker3=false \
                -D man=false

        ninja -C build
# Tips:
#
# tracker3         is search backend
# broadway_backend is allowing html5 gtk3 applications work
# cloudproviders   for nextcloud or similar projects integrations
#
# introspection=false can cause this bug:
#   File "/usr/lib/python3.9/site-packages/gi/__init__.py", line 129, in require_version
#    raise ValueError('Namespace %s not available for version %s' %
# ValueError: Namespace Gtk not available for version 3.0
#
# oldflags:
#                -D introspection=false \
#                -D ENABLE_NLS=0 \
#                -D wayland_backend=false

}

package_gtk3-classic-noatk-64()
{
	depends=(
		atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2 fribidi
		libxcomposite libxdamage pango shared-mime-info libxkbcommon
		json-glib librsvg desktop-file-utils mesa gtk-update-icon-cache
	)
	optdepends=(
		'dconf: default GSettings backend'
		'libcanberra: sounds events'
		'adwaita-icon-theme: default icon theme'
		'cantarell-fonts: default font'
	)

	DESTDIR="$pkgdir" meson install -C build

	install -Dt "$pkgdir/usr/share/gtk-3.0" -m644 settings.ini
	install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-query-immodules-3.0.hook

	rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}

