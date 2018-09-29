# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.21
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
makedepends=('caja>=1.21' 'libcanberra' 'libnotify' 'mate-common>=1.21' 'yelp-tools' 'libunique3')
optdepends=('yelp: for reading MATE help documents')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('a2cecf171aad8b421dbc8df5f5c0481fef1b6d32')

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
