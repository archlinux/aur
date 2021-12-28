# Maintainer Adria Arrufat <swiftscythe@gmail.com>
# Contributor Limao Luo <luolimao+AUR@gmail.com>
# Contributor Thomas Dziedzic <gostrc@gmail.com>
# Contributor Jan de Groot <jgc@archlinux.org>
# Contributor Giovanni Scafora <giovanni@archlinux.org>

_pkgname=rhythmbox
pkgname=$_pkgname-git
pkgver=3.4.4+320+gba4a134a4
pkgrel=1
pkgdesc="Music playback and management application"
arch=(i686 x86_64)
license=(GPL)
url="https://wiki.gnome.org/Apps/Rhythmbox"
depends=(dconf gst-plugins-base gst-plugins-good libsoup json-glib libnotify libpeas
         media-player-info totem-plparser tdb python-gobject libgudev grilo)
makedepends=(itstool intltool brasero gobject-introspection vala grilo libdmapsharing lirc libgpod
             libmtp gtk-doc yelp-tools git)
checkdepends=(check xorg-server-xvfb)
optdepends=('gst-plugins-ugly: Extra media codecs'
            'gst-plugins-bad: Extra media codecs'
            'gst-libav: Extra media codecs'
            'brasero: Audio CD Recorder plugin'
            'libdmapsharing: DAAP Music Sharing plugin'
            'grilo-plugins: Grilo media browser plugin'
            'lirc: LIRC plugin'
            'libgpod: Portable Players - iPod plugin'
            'libmtp: Portable Players - MTP plugin'
            'gvfs-mtp: Portable Players - Android plugin')
options=('!emptydirs')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
source=($pkgname::git+https://gitlab.gnome.org/GNOME/$_pkgname)
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git config libgd.url "${srcdir}/libgd"
  git config libglnx.url "${srcdir}/lbglnx"
  git submodule update
}

build() {
    arch-meson $pkgname build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
