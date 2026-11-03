# Maintainer: Ondřej Svoboda <ondrej@svobodasoft.cz>

pkgname=osdlyrics-git
_pkgname=osdlyrics
pkgver=0.6.0.r0.g6c3bbf8
pkgrel=1
pkgdesc="Standalone lyrics fetcher/displayer (windowed and OSD mode). Supports MPRIS1/2 players, and MPD."
arch=(x86_64 aarch64)
url="https://github.com/osdlyrics/osdlyrics"
license=(GPL-3.0-or-later)
depends=(dbus-glib glib2 gtk3 hicolor-icon-theme libayatana-appindicator libnotify libx11
         python python-{chardet,dbus,gobject,pycurl})
makedepends=(git intltool)
optdepends=('python-mpd2: to interface with MPD')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    AUTOPOINT=intltoolize autoreconf -fi
}

build() {
    cd "$_pkgname"
    ./configure \
        --prefix=/usr \
        --enable-appindicator=yes \
        PYTHON=/usr/bin/python3
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" install
}
