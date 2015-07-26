# Maintainer: Adria Arrufat <swiftscythe@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_pkgname=rhythmbox
pkgname=$_pkgname-git
pkgver=3.2.1.12.g1a06a4e
pkgrel=1
pkgdesc="An iTunes-like music player/libary"
arch=(i686 x86_64)
license=(GPL2)
url=http://www.rhythmbox.org
depends=(dconf desktop-file-utils gst-plugins-base gst-plugins-good libsoup json-glib libnotify libpeas media-player-info totem-plparser tdb webkitgtk3 libgudev)
makedepends=(itstool intltool brasero gobject-introspection vala grilo libdmapsharing lirc libgpod libmtp)
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
source=($pkgname::git://git.gnome.org/$_pkgname)
sha256sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/^v//;s/-/./g'
}

prepare() {
	cd $pkgname/
	sed "{:q;N;s/(\[rhythmbox\],\n\t\[\([0-9]\).\([0-9]\)\],/(\[rhythmbox\],\n\t[$pkgver],/g;t q}" -i configure.ac
}

build() {
    cd $pkgname/
    # export CFLAGS+=" -g -O1"
    # export CXXFLAGS+=" -g -O1"
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc \
        --libexecdir=/usr/lib/rhythmbox \
        --localstatedir=/var --disable-static \
        --enable-daap --enable-python --enable-vala
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/lib/rhythmbox/sample-plugins"
    rm -r "$pkgdir/usr/lib/rhythmbox/plugins/rbzeitgeist"
}
