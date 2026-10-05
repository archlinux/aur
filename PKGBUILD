# Maintainer: Joey Dalton <jdeb89 at tuta dot io>

# This file is based on the gtk3-classic PKGBUILD:
# https://aur.archlinux.org/packages/gtk3-classic
# and uses xfce patches from:
# https://github.com/simplejack-src/gtk3-classic-xfce (repository no longer available)

__arch_pkg_commit="f5ba7bf3a87dacd8f332e083eaecaee25be8636b"
_gtkver=3.24.52

_gtk3_classic_commit="1adb3ea1fb666564c1ec7e2bc1c567de3798b75a"

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
source=(git+$url.git#commit=$_gtk3_classic_commit
        "https://gitlab.gnome.org/GNOME/gtk/-/archive/$_gtkver/gtk-$_gtkver.tar.gz"
        # https://gitlab.archlinux.org/archlinux/packaging/packages/gtk3/-/raw/$__arch_pkg_commit/gtk-remove-immodules-cache.hook
        gtk-remove-immodules-cache.hook
        # https://gitlab.archlinux.org/archlinux/packaging/packages/gtk3/-/raw/$__arch_pkg_commit/gtk-query-immodules-3.0.hook
        gtk-query-immodules-3.0.hook
        settings.ini
        appearance__file-chooser-xfce.patch
)
sha256sums=('2469fa03798678187bb9df9e0006126832a0fca9b87a8493254b9b865ca3834e'
            'e62514019679f831fcb37f3d294a761c3a6c14f1d346745ad11d70c2be17146e'
            '8b0e709db60de160b391ed5b37d93d5c80271ebc4771410ab381ade067ec4865'
            'fc38d4b0c21d6e4879fc9160756c7bad1deedac151d9530a0b860c3deaa6d6f0'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'd0ada6a7a4124f8cf5b1a1881029b7eb9f0bbda777080b9acc62ef449319a6f2')

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
    install -Dm644 gtk-*.hook -t "$pkgdir/usr/share/libalpm/hooks"

    rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}
