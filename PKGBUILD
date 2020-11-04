# Maintainer: kmille <arch@androidloves.me>
# Contributor: gborzi <gborzi@ieee.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=libfprint-0
_pkgname=libfprint
pkgver=0.7
pkgrel=1
pkgdesc="Library for fingerprint readers - version 0.7 for fprint_demo"
arch=(x86_64)
url="https://fprint.freedesktop.org/"
license=(LGPL)
depends=(libusb pixman nss glib2)
makedepends=(git)
provides=('libfprint-0.so')
groups=(fprint)
_commit=d82847a6b4bbd2864388f2bf8e6a2b9d1aed05c4  # tags/V_0_7_0
source=("git+https://gitlab.freedesktop.org/libfprint/libfprint.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
    cd "$_pkgname"
    # fix package config template
    sed -i 's|-lfprint|-lfprint-0|g' libfprint.pc.in
    sed -i 's|libfprint|libfprint-0|g' libfprint.pc.in

    # build libfprint-0.so.0.0.0 instead of libfprint.so.0.0.0
    sed -i 's|libfprint\.la|libfprint-0\.la|g' libfprint/Makefile.am
    sed -i 's|libfprint_la|libfprint_0_la|g' libfprint/Makefile.am

    # put fprint.h into /usr/include/libfprint-0 instead of /usr/include/libfprint
    sed -i 's|libfprint]|libfprint-0]|' configure.ac
}

build() {
    cd "$_pkgname"
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr     \
                --sysconfdir=/etc \
                --with-udev-rules-dir=/usr/lib/udev/rules.d
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="${pkgdir}" install
    cd "${pkgdir}"
    # moving libfprint.pc is easier then multiple sed statements in prepare()
    mv usr/lib/pkgconfig/libfprint.pc usr/lib/pkgconfig/libfprint-0.pc

    # don't collide with the other libfprint packages
    mv usr/lib/udev/rules.d/60-fprint-autosuspend.rules usr/lib/udev/rules.d/60-libfprint-0-autosuspend.rules
}

