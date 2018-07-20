# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xplayer
pkgver=1.8.1
pkgrel=2
pkgdesc="Simple media player. X-Apps Project."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('clutter-gtk' 'clutter-gst' 'xplayer-plparser'
    'desktop-file-utils' 'iso-codes' 'yelp-xsl'
    'libpeas' 'gsettings-desktop-schemas' 'dbus-glib'
    'python2-gobject' 'gst-plugins-base' 'gst-plugins-good'
    'xapps')
makedepends=('gnome-common' 'gtk-doc' 'gobject-introspection' 'vala' 'python-xdg')
optdepends=(
    'gst-libav: Extra media codec support'
    'python2-xdg: Subtitle downloader plugin'
)
provides=($pkgname)
conflicts=('xplayer-git')
url='https://github.com/linuxmint/xplayer'

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('e03a0220cad789376285af777b18e48d')


build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    # https://github.com/linuxmint/xplayer/issues/22
    # No switch to disable grilo, so just bump the required
    # version to something that obviously won't be satisfied.
    sed -i 's/GRILO_REQS=0.2.0/GRILO_REQS=0.9.0/g' configure.ac

    ./autogen.sh ax_is_release="yes" \
        --prefix="/usr" \
        --localstatedir="/var" \
        --libexecdir="/usr/lib/${pkgname}"
    make
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}

