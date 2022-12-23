# Maintainer: Luke Horwell <code@horwell.me>
# Contributor: Jonathon Fernyhough <jonathon+m2x.dev>
# Contributor: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of GTK3 package.
# https://git.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/gtk3

__arch_pkg_commit="ec12847fb811add133b399aaf0916c96eb03862e"
_gtkver=3.24.36

_gtk3_classic_commit="ca470ac4870271fd9b40a4478c15a70fd10a3a68"

pkgbase=gtk3-classic
pkgname=($pkgbase)
pkgver=${_gtkver}
pkgrel=1
pkgdesc="GTK3 patched to provide a more classic experience"
url="https://github.com/lah7/gtk3-classic"
conflicts=(gtk3 gtk3-typeahead gtk3-print-backends gtk3-nocsd gtk3-nocsd-git gtk3-nocsd-legacy-git)
provides=(gtk3=$_gtkver gtk3-typeahead=$_gtkver gtk3-mushrooms=$_gtkver gtk3-print-backends
          libgtk-3.so libgdk-3.so libgailutil-3.so)
arch=(x86_64)
license=(LGPL)
depends=(
	at-spi2-atk
	atk
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
	adwaita-icon-theme
	at-spi2-atk
	atk
	cairo
	cantarell-fonts
	desktop-file-utils
	fribidi
	gdk-pixbuf2
	git
	gobject-introspection
	gtk-update-icon-cache
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

	"gtk-query-immodules-3.0.hook::https://raw.githubusercontent.com/archlinux/svntogit-packages/$__arch_pkg_commit/trunk/gtk-query-immodules-3.0.hook"
	settings.ini
)
sha256sums=('SKIP'
            '27a6ef157743350c807ffea59baa1d70226dbede82a5e953ffd58ea6059fe691'
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
		-D demos=true \
		-D examples=false \
		-D introspection=true \
		-D tests=false \
		-D installed_tests=false
	ninja -C build
}

package_gtk3-classic()
{
	DESTDIR="$pkgdir" meson install -C build

	install -Dt "$pkgdir/usr/share/gtk-3.0" -m644 settings.ini
	install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-query-immodules-3.0.hook

	rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}
