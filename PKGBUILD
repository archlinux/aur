# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.23
_pkgbase=mate-applets
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.0
pkgrel=5
pkgdesc="Applets for MATE panel"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
url="http://mate-desktop.org"
license=('GPL')
depends=('glib2' 'gtksourceview2' 'gtk-update-icon-cache' 'libgtop' 'libnotify'
         'mate-panel-dev' 'polkit' 'python2-dbus' 'python2-gobject' 'upower')
makedepends=('docbook2x' 'docbook-xsl' 'mate-common-dev' 'yelp-tools' 'gtksourceview3' 'mate-panel-dev')
optdepends=('fortune-mod: for displaying fortune cookies in the Wanda the Fish applet'
            'yelp: for reading MATE help documents')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('ff9b0a464c61aa5e5819a865f9a4b0c7f33ceda2')

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
    cd "${srcdir}/${_pkgbase}-gtk3"
    sed -i 's/env python/env python2/' invest-applet/invest/{chart.py,invest-applet.py,mate-invest-chart}
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    PYTHON=/usr/bin/python2 ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/${_pkgbase} \
        --enable-polkit \
        --enable-ipv6 \
        --with-gtk=3.0 \
        --disable-static
    make
}

package() {
    pkgdesc+=' (GTK3 version)'
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
