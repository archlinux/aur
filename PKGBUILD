# Maintainer: Dimitrios Vogiatzis <me@dimtree.net>
# Contributor: ksj <podhorsky.ksj@gmail.com>
# Contributor: kasa <biuta.jr@gmail.com>
# Contributor: L42y <423300@gmail.com>

_pkgname=network-manager-applet
pkgname=networkmanager-applet-git
pkgver=1.1.0.r3820.ga5f3e6e
pkgrel=1
pkgdesc="Applet for managing network connections"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('networkmanager-git' 'gtk3' 'iso-codes' 'libsecret'
         'notification-daemon' 'libnotify' 'adwaita-icon-theme'
         'mobile-broadband-provider-info' )

makedepends=('intltool' 'gobject-introspection')
provides=('network-manager-applet' 'nm-connection-editor' 'libnm-gtk')
conflicts=('nm-connection-editor' 'network-manager-applet')
options=('!libtool')
install=${pkgname}.install
source=(git://git.gnome.org/network-manager-applet)
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    local ver=$({ echo 'changequote([,])dnl';
    sed -rn 's/^m4_(define.*nm_.*_version.*)/\1dnl/p' configure.ac;
    echo '1.1.0';
    echo 'define(AC_INIT,$2)dnl'
    grep '^AC_INIT(.*)' configure.ac; } | m4)
    local rev=$(git rev-list --count HEAD)
    local git=$(git rev-parse --short HEAD)
    echo "$ver.r$rev.g$git"
}

build() {
    cd $_pkgname

    ./autogen.sh --prefix=/usr --sysconfdir=/etc \
        --localstatedir=/var \
        --libexecdir=/usr/lib/networkmanager \
        --disable-static \
        --disable-maintainer-mode \
        --disable-migration \
        --without-modem-manager-1

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd $_pkgname
    make DESTDIR="$pkgdir" install
}


