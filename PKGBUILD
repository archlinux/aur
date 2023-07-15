# Maintainer: Czcibor Bohusz-Dobosz <czbd@o2.pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.16
_pkgbase=pluma
pkgname=${_pkgbase}-gtk2
pkgver=${_ver}.2
pkgrel=3
pkgdesc="A powerful text editor for MATE (older GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('iso-codes' 'mate-desktop-schemas-gtk2' 'pygtksourceview2' 'zenity')
makedepends=('intltool' 'itstool' 'enchant1.6')
optdepends=('enchant1.6: spellcheck plugin')
groups=('mate-extra-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz"
        "samewindow.patch")
sha1sums=('b648d1beebbbf5d82a1670762b1fe1d780658499'
          'e13c4a81d89d586c230f8fbb2c931ea83b296bd6')

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    sed -i 's/python/python2/' plugins/externaltools/data/switch-c.tool.in
    patch -Np1 -i "${srcdir}/samewindow.patch"
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
