# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.16
_pkgbase=caja
pkgname=${_pkgbase}-gtk2
pkgver=${_ver}.2
pkgrel=1
pkgdesc="File manager for the MATE desktop (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('exempi' 'gvfs' 'libexif' 'libsm' 'libunique' 'mate-desktop-gtk2')
makedepends=('gobject-introspection' 'intltool')
optdepends=('gstreamer: automatic media playback when mouseover')
groups=('mate-gtk2')
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
provides=('caja')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('7d4088e151435ccfea442f03b796a9e0f3f56a69')

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
