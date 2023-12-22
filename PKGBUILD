# Maintainer: Torben <git at letorbi dot com>
# Contributor: emersion <contact at emersion dot fr>
# Contributor: Techlive Zheng <techlivezheng at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo at gmail dot com>

pkgname=geary-git
pkgver=44.0.r86.gf39839a92
pkgrel=1
pkgdesc="An email application built around conversations, for the GNOME 3 desktop."
arch=(i686 x86_64)
url="https://gitlab.gnome.org/GNOME/geary"
license=('GPL3')
depends=(folks pango gdk-pixbuf2 libhandy icu dconf libsecret webkit2gtk-4.1
         libgoa gsound hicolor-icon-theme libstemmer at-spi2-core libsoup3 gtk3
         json-glib libgee libxml2 cairo enchant gcr gspell glibc libunwind
         glib2 libpeas libytnef gmime3 sqlite)
makedepends=(git gobject-introspection itstool meson vala)
conflicts=(geary)
source=('git+https://gitlab.gnome.org/GNOME/geary.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/geary"
    git describe --long | sed 's/^gnome-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/geary"
    rm -rf build
    #patch -Np1 -i ../../libsoup2.patch
}

build() {
    cd "$srcdir/geary"
    meson --prefix=/usr --buildtype=release -Dprofile=release build
    ninja -v -C build
}

package() {
    cd "$srcdir/geary"
    DESTDIR="$pkgdir" ninja -v -C build install
}
