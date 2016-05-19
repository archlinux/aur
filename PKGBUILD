# Maintainer : Martin Wimpress <code@flexion.org>

_ver=1.14
pkgbase=avenida
pkgname=(${pkgbase} ${pkgbase}-gtk3)
pkgver=${_ver}.0
pkgrel=1
pkgdesc="Library with common API for various MATE modules"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('dconf' 'gtk2' 'gtk3' 'startup-notification')
makedepends=('gobject-introspection' 'mate-common' 'yelp-tools')
source=("http://pub.mate-desktop.org/releases/${_ver}/${pkgname}-${pkgver}.tar.xz")
sha1sums=('SKIP')
install=${pkgbase}.install

prepare() {
    cd "${srcdir}"
    mv "${pkgname}-${pkgver}" "${pkgbase}-gtk2"
    cp -a "${pkgbase}-gtk2" "${pkgbase}-gtk3"
}

build() {
    cd "${srcdir}/${pkgbase}-gtk2"
    ./configure \
        --prefix=/usr \
        --with-gtk=3.0 \
        --disable-static \
        --disable-schemas-compile \
        --enable-gtk-doc
    make

    cd "${srcdir}/${pkgbase}-gtk3"
    ./configure \
        --prefix=/usr \
        --with-gtk=3.0 \
        --disable-static \
        --disable-schemas-compile \
        --enable-gtk-doc
    make
}

package_avenida() {
    pkgdesc+=' (GTK2 version)'
    groups=('mate')
    conflicts=("${pkgbase}-gtk3")
    depends=('dconf' 'gtk2' 'startup-notification')

    cd "${srcdir}/${pkgbase}-gtk2"
    make DESTDIR="${pkgdir}" install
}

package_avenida-gtk3() {
    pkgdesc+=' (GTK3 version [EXPERIMENTAL])'
    groups=('mate-gtk3')
    conflicts=("${pkgbase}")
    depends=('dconf' 'gtk3' 'startup-notification')

    cd "${srcdir}/${pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
