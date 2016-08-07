# Contributor: Martin Wimpress <code@flexion.org>

pkgname=gnome-main-menu
pkgver=1.8.0
pkgrel=4
pkgdesc="A mate-panel applet similar to the traditional main-menu, but with a few additions."
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('caja' 'libunique' 'mate-control-center' 'mate-desktop' 'mate-panel' 'mate-system-monitor')
makedepends=('mate-common' 'yelp-tools')
optdepends=('yelp: for reading help documents')
source=("http://pub.mate-desktop.org/releases/1.8/${pkgname}-${pkgver}.tar.xz")
sha1sums=('287e904506ae2796e84b556f76e3b12274c1c89f')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Replace libslab with libmate-slab
    sed -i 's|libslab|mate-slab|' configure.ac
    sed -i 's|libslab/slab.h|libmate-slab/slab.h|' */src/*

    # Update disable-log-out key location
    sed -i 's|org.mate.panel|org.mate.lockdown|' main-menu/src/main-menu-ui.c

    autoreconf -fi
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${pkgname} \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-caja-extension
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
