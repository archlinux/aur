# Mantainer: 3ED_0 <krzysztofas at protonmail dot com>
# Contributor: Martin Wimpress <code@flexion.org>

# for plugins package, until closed: https://github.com/yselkowitz/pluma-plugins/issues/6

_ver=1.16
_pkgbase=pluma
pkgname=${_pkgbase}-${_ver}
pkgver=${_ver}.1
pkgrel=1
pkgdesc="A powerful text editor for MATE"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtksourceview3' 'zenity')
makedepends=('intltool' 'itstool')
groups=('mate-extra')
conflicts=("${_pkgbase}" "${_pkgbase}-gtk2")
provides=("${_pkgbase}" "${_pkgbase}-gtk2")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha256sums=('97d50aa517f3e4470209e4658ccafdee917db2f5be7987413708c364a415a1b1')

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    sed -i 's/python/python2/' plugins/externaltools/data/switch-c.tool.in
}

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    PYTHON=/usr/bin/python2 ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --with-gtk=3.0 \
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
