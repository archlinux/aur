# Contributor : Martin Wimpress <code@flexion.org>
# Maintainer: 

pkgname=mate-power-manager-upower
_pkgname=mate-power-manager
pkgver=1.8.1
_major=$(echo ${pkgver} | cut -d= -f2 | cut -d. -f1-2)
pkgrel=4.1
pkgdesc="Power management tool for the MATE desktop, with upower 0.9.23"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dbus-glib' 'dconf' 'libcanberra' 'libgnome-keyring' 'libnotify'
         'libunique' 'upower=0.9.23')
makedepends=('docbook2x' 'docbook-xml' 'mate-common' 'mate-panel' 'xmlto' 'yelp-tools')
optdepends=('mate-panel: Set brightness and inhibit power management from the panel'
            'yelp: for reading MATE help documents')
conflicts=('mate-power-manager')
provides=('mate-power-manager')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/${_major}/${_pkgname}-${pkgver}.tar.xz")
sha1sums=('0f2d509b8af30e79013de564ea9a0a3d7ccd7c93')
install=${_pkgname}.install

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    #Work around a problem where the .sgml fail to parse.
    sed -e 's:@HAVE_DOCBOOK2MAN_TRUE@.*::' -i man/Makefile.in
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgname} \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --sbindir=/usr/bin \
        --enable-applets \
        --enable-unique
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
