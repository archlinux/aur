# Maintainer: Joey Dalton <jdeb89 at tuta dot io>

# This file is based on the gtk3-classic PKGBUILD:
# https://aur.archlinux.org/packages/gtk3-classic
# and uses xfce patches from:
# https://github.com/simplejack-src/gtk3-classic-xfce

__arch_pkg_commit="108c7090a77081cd124c819e014ced95b4648d55"
_gtkver=3.24.38

_gtk3_classic_commit="81d64cc99e69f5abddba6a9b336b187b142e8104"

pkgbase=gtk3-classic-xfce
pkgname=($pkgbase)
pkgver=${_gtkver}
pkgrel=1
pkgdesc="Patched GTK+3 that provides a more classic experience, with patches for xfce"
url="https://github.com/lah7/gtk3-classic"
conflicts=(gtk3 gtk3-typeahead gtk3-print-backends gtk3-nocsd gtk3-nocsd-git gtk3-nocsd-legacy-git gtk3-classic)
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
	"$pkgbase::git+$url.git#commit=$_gtk3_classic_commit"
 	"https://download.gnome.org/sources/gtk+/${pkgver%.*}/gtk+-$_gtkver.tar.xz"

	"gtk-query-immodules-3.0.hook::https://gitlab.archlinux.org/archlinux/packaging/packages/gtk3/-/raw/$__arch_pkg_commit/gtk-query-immodules-3.0.hook"
	settings.ini
        "https://github.com/simplejack-src/gtk3-classic-xfce/archive/refs/tags/$_gtkver.tar.gz"
)
sha256sums=('SKIP'
            'ce11decf018b25bdd8505544a4f87242854ec88be054d9ade5f3a20444dd8ee7'
            'a0319b6795410f06d38de1e8695a9bf9636ff2169f40701671580e60a108e229'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            '75e3beae2f38405faad570c9483920ea34726a16264311319c460966fd53031a')

prepare()
{
	cd gtk+-$_gtkver
        cp ../"$pkgbase"-$_gtkver/*.patch ../"$pkgbase"
        cat ../"$pkgbase"-$_gtkver/series >> ../"$pkgbase"/series
	QUILT_PATCHES=../"$pkgbase" quilt push -av

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

package_gtk3-classic-xfce()
{
	DESTDIR="$pkgdir" meson install -C build

	install -Dt "$pkgdir/usr/share/gtk-3.0" -m644 settings.ini
	install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-query-immodules-3.0.hook

	rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}
