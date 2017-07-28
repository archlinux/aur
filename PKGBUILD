# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.16
_pkgbase=caja
pkgname=${_pkgbase}-gtk2
pkgver=${_ver}.6
pkgrel=1
pkgdesc="File manager for the MATE desktop (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('exempi' 'gvfs' 'libexif' 'libsm' 'libunique' 'mate-desktop')
makedepends=('gobject-introspection' 'intltool')
optdepends=('gstreamer: automatic media playback when mouseover')
groups=('mate-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('97f6ea82393e808f3809152ac4ba0afbb96bf380')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --with-gtk=2.0 \
        --enable-introspection \
        --disable-update-mimedb

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install

    # Remove D-Bus activation file to avoid conflict with nautilus-desktop
    rm -r "$pkgdir/usr/share/dbus-1/"
}
