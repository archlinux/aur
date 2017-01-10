# Maintainer: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_pkgname=rhythmbox
pkgname=$_pkgname-git
pkgver=3.4.1+57+g8beff628
pkgrel=1
pkgdesc="Music playback and management application"
arch=(i686 x86_64)
license=(GPL2)
url=http://www.rhythmbox.org
depends=(dconf desktop-file-utils gst-plugins-base gst-plugins-good libsoup json-glib libnotify libpeas media-player-info totem-plparser tdb webkit2gtk libgudev)
makedepends=(itstool intltool brasero gobject-introspection vala grilo libdmapsharing lirc libgpod libmtp gtk-doc yelp-tools)
optdepends=('gst-plugins-ugly: Extra media codecs'
            'gst-plugins-bad: Extra media codecs'
            'gst-libav: Extra media codecs'
            'brasero: Audio CD Recorder plugin'
            'libdmapsharing: DAAP Music Sharing plugin'
            'grilo-plugins: Grilo media browser plugin'
            'lirc: LIRC plugin'
            'libgpod: Portable Players - iPod plugin'
            'libmtp: Portable Players - MTP plugin'
            'python-mako: Context pane plugin')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
options=(!emptydirs)
install=$_pkgname.install
source=($pkgname::git+https://git.gnome.org/browse/$_pkgname)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --always | sed 's|-|+|g;s|v||'
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git config libgd.url "${srcdir}/libgd"
  git config libglnx.url "${srcdir}/lbglnx"
  git submodule update

  NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "$srcdir/$pkgname"
    ./configure --prefix=/usr --sysconfdir=/etc \
        --libexecdir=/usr/lib/rhythmbox \
        --localstatedir=/var --disable-static \
        --enable-daap --enable-python --enable-vala \
	--disable-Werror
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/lib/rhythmbox/sample-plugins"
    rm -r "$pkgdir/usr/lib/rhythmbox/plugins/rbzeitgeist"
}
