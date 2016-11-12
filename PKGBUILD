# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xplayer
pkgver=1.2.1
pkgrel=1
pkgdesc="Simple media player. X-Apps Project."
arch=('i686' 'x86_64')
license=('GPL')
depends=('clutter-gtk' 'clutter-gst' 'xplayer-plparser'
    'desktop-file-utils' 'iso-codes' 'yelp-xsl'
    'libpeas' 'gsettings-desktop-schemas' 'dbus-glib'
    'python2-gobject' 'gst-plugins-base' 'gst-plugins-good'
    'xapps')
makedepends=('gnome-common' 'gtk-doc' 'gobject-introspection' 'vala')
optdepends=('gst-libav: Extra media codec support')
provides=($_pkgname)
conflicts=('xplayer-git')
url='https://github.com/linuxmint/xplayer'
install=xplayer.install

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('b50294ff7cff885b342db8f47c52767f')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    # https://github.com/linuxmint/xplayer/issues/22
    # No switch to disable grilo, so just bump the required
    # version to something that obviously won't be satisfied.
    sed -i 's/GRILO_REQS=0.2.0/GRILO_REQS=0.9.0/g' configure.ac

    ./autogen.sh --prefix="/usr" \
        --localstatedir="/var" \
        --libexecdir="/usr/lib/${pkgname}"
    make
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}

