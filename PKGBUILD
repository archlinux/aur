# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.21
_pkgbase=mate-power-manager
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.1
pkgrel=5
pkgdesc="Power management tool for the MATE desktop"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('dbus-glib' 'dconf' 'glib2' 'gtk3' 'gtk-update-icon-cache' 'libcanberra'
             'libgnome-keyring' 'libnotify' 'libunique3' 'mate-desktop>=1.21' 'upower')
makedepends=('docbook2x' 'docbook-xml' 'mate-common>=1.21' 'mate-panel>=1.21' 'xmlto' 'yelp-tools'
             'gtk3' 'libunique3' 'mate-desktop>=1.21')
optdepends=('mate-panel: Set brightness and inhibit power management from the panel'
            'yelp: for reading MATE help documents')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
groups=('mate-extra')
sha1sums=('54f196523980196d06316babbdf1993a1dec90d6')

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    #Work around a problem where the .sgml fails to parse.
    sed -e 's:@HAVE_DOCBOOK2MAN_TRUE@.*::' -i man/Makefile.in
}

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
    cd "${srcdir}/${_pkgbase}-gtk3"
    #Work around a problem where the .sgml fails to parse.
    sed -e 's:@HAVE_DOCBOOK2MAN_TRUE@.*::' -i man/Makefile.in
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --sbindir=/usr/bin \
        --enable-applets \
        --enable-unique \
        --with-gtk=3.0 \
        --disable-strict
    make
}

package() {
    pkgdesc+=' (GTK3 version)'
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
