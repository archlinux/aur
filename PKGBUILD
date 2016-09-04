# Maintainer: Chris Cromer <chris@cromer.cl>
# Maintainer: artoo <artoo@manjaro.org>

_udevver=220
_gentoo_uri="http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86"
_pkgname=eudev

pkgname=lib32-eudev
pkgdesc="The userspace dev tools (udev) forked by Gentoo (32-bit)"
pkgver=3.2
pkgrel=1
arch=('x86_64')
url="http://dev.gentoo.org/~blueness/eudev"
license=('GPL')
depends=('lib32-glib2' 'lib32-glibc' 'eudev-systemdcompat')
makedepends=('gcc-multilib' 'lib32-util-linux' 'gobject-introspection' 'gperf' 'python2' 'gtk-doc' 'lib32-kmod')
provides=("lib32-udev=${_udevver}" "lib32-systemd=${_udevver}")
conflicts=('lib32-systemd' 'libudev.so')
options=(!makeflags !libtool)
source=("${url}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d84a5f7942393a009afc6af0bf31e98841147a0521b91ffbed161dccac303c25')

build() {

    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
	--prefix=/usr \
        --with-rootprefix=/usr \
        --sysconfdir=/etc \
        --libdir=/usr/lib32 \
        --sbindir=/usr/bin \
        --with-modprobe=/usr/bin/modprobe \
        --enable-introspection \
	--disable-manpages
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    #make DESTDIR="${pkgdir}" install
    make DESTDIR="${pkgdir}" -C src/shared uninstall
    make DESTDIR="${pkgdir}" -C src/libudev install
    #make DESTDIR="${pkgdir}" -C src/gudev install
    make DESTDIR="${pkgdir}" -C src/shared uninstall

    #rm -rf "${pkgdir}"/etc
    #rm -rf "${pkgdir}"/usr/{bin,include,lib,share}
}
