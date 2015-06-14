# Maintainer : Martin Wimpress <code@flexion.org>

_ver=1.10
_pkgbase=mate-power-manager
pkgname=(${_pkgbase}-upower)
pkgver=${_ver}.0
pkgrel=1
pkgdesc="Power management tool for the MATE desktop (GTK2 version), with upower 0.9.23"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dbus-glib' 'dconf' 'gtk2' 'libcanberra' 'libgnome-keyring'
         'libnotify' 'libunique' 'mate-desktop>=1.10' 'upower=0.9.23')
makedepends=('docbook2x' 'docbook-xml' 'mate-common' 'mate-panel' 'xmlto' 'yelp-tools')
optdepends=('mate-panel: Set brightness and inhibit power management from the panel'
            'yelp: for reading MATE help documents')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
groups=('mate-extra')
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
provides=("${_pkgbase}")
sha1sums=('7540735374e5892c26a9c06f9c973742ef873e74')
install=${_pkgbase}.install

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    #Work around a problem where the .sgml fails to parse.
    sed -e 's:@HAVE_DOCBOOK2MAN_TRUE@.*::' -i man/Makefile.in
}

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --sbindir=/usr/bin \
        --enable-applets \
        --enable-unique \
        --with-gtk=2.0 \
        --disable-strict
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
