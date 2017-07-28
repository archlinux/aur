# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.16
_pkgbase=pluma
pkgname=${_pkgbase}-gtk2
pkgver=${_ver}.2
pkgrel=1
pkgdesc="A powerful text editor for MATE (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('iso-codes' 'mate-desktop-schemas' 'pygtksourceview2' 'zenity')
makedepends=('intltool' 'itstool')
groups=('mate-extra-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('b648d1beebbbf5d82a1670762b1fe1d780658499')

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    sed -i 's/python/python2/' plugins/externaltools/data/switch-c.tool.in
}

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    PYTHON=/usr/bin/python2 ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --with-gtk=2.0 \
        --enable-gtk-doc=no \
        --enable-python

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
