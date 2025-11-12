# Maintainer: Torben <git at letorbi dot com>
# Contributor: emersion <contact at emersion dot fr>
# Contributor: Techlive Zheng <techlivezheng at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo at gmail dot com>

pkgname=geary-git
pkgver=46.0.r61.g746efdc41
pkgrel=1
arch=(i686 x86_64)
pkgdesc="An email application built around conversations, for the GNOME 3 desktop."
url="https://gitlab.gnome.org/GNOME/geary"
license=(GPL-3.0-or-later)
depends=(
    at-spi2-core
    cairo
    dconf
    enchant
    folks
    gcr
    gdk-pixbuf2
    glib2
    glibc
    gmime3
    #gnome-online-accounts # namcap: maybe not needed
    gsound
    gspell
    gtk3
    hicolor-icon-theme
    icu
    #iso-codes # namcap: maybe not needed
    json-glib
    libgee
    libgoa
    libhandy
    libpeas
    libsecret
    libsoup3
    libstemmer
    libunwind
    libxml2
    libytnef
    #org.freedesktop.secrets # namcap: maybe not needed
    pango
    sqlite
    webkit2gtk-4.1
)
makedepends=(
    appstream-glib
    #cmake # not required anymore
    git
    gobject-introspection
    itstool
    meson
    vala
    #yelp-tools # not required anymore
)
conflicts=(geary)
source=('git+https://gitlab.gnome.org/GNOME/geary.git')
sha256sums=('SKIP')

prepare() {
    ln -s "$srcdir/geary" "$srcdir/$pkgname"
    #cd "$pkgname"
    #patch -Np1 -i ../../libsoup2.patch
}

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/^gnome-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    local meson_options=(
      -D profile=release
    )

    arch-meson geary build "${meson_options[@]}"
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
