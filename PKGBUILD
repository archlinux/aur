# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.23
_pkgbase=mate-user-share
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.0
pkgrel=5
pkgdesc="User level public file sharing via WebDAV for MATE."
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('dbus-glib' 'desktop-file-utils' 'dconf' 'glib2' 'gtk-update-icon-cache'
         'libunique3' 'mod_dnssd')
makedepends=('caja-dev' 'libcanberra' 'libnotify' 'mate-common-dev' 'yelp-tools' 'libunique3')
optdepends=('yelp: for reading MATE help documents')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('1e50a3679691e8a64458e4ac35f2e0df37cc79c3')

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    PYTHON=/usr/bin/python2 ./configure \
        --prefix=/usr \
        --libexec=/usr/lib/${_pkgbase} \
        --sysconfdir=/etc \
        --with-gtk=3.0 \
        --disable-static \
        --disable-bluetooth
    make
}

package() {
    pkgdesc+=' (GTK3 version)'
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
    rm -f "${pkgdir}/usr/share/mate-user-share/dav_user_2.0.conf"
}
