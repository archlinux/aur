# $Id: PKGBUILD 77409 2012-10-09 17:09:48Z bluewind $
# Maintainer : Ionut Biru <ibiru@archlinux.org>

pkgname=libx32-dbus-core
_pkgbasename=dbus-core
pkgver=1.6.8
pkgrel=1.1
pkgdesc="Freedesktop.org message bus system (x32 ABI)"
arch=('x86_64')
url="http://www.freedesktop.org/Software/dbus"
license=('GPL' 'custom')
depends=('libx32-glibc' 'libx32-expat' 'dbus-core')
makedepends=('gcc-multilib-x32' libx32-libx11)
options=(!libtool)
source=(http://dbus.freedesktop.org/releases/dbus/dbus-${pkgver}.tar.gz)
md5sums=('3bf059c7dd5eda5f539a1b7cfe7a14a2')

build() {
    export CC="gcc -mx32"
    export CXX="g++ -mx32"
    export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

    cd "${srcdir}/dbus-${pkgver}"

    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libdir=/usr/libx32 \
        --libexecdir=/usr/lib/dbus-1.0 --with-dbus-user=81 \
        --with-system-pid-file=/var/run/dbus.pid \
        --enable-inotify --disable-dnotify \
        --disable-verbose-mode --disable-static \
        --disable-tests --disable-asserts --disable-systemd \
		--with-console-auth-dir=/run/console/

    make
}

package() {
    cd "${srcdir}/dbus-${pkgver}"
    make DESTDIR=${pkgdir} install

    rm -rf "${pkgdir}"/usr/{bin,include,lib,share}
    rm -rf "${pkgdir}"/{etc,var}

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s ${_pkgbasename} "${pkgdir}/usr/share/licenses/${pkgname}"
}
