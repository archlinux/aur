# $Id$
# Maintainer: Daniel Isenmann <daniel@archlinux.org>

_pkgbase=Mono.Zeroconf
pkgname=mono-zeroconf-git
pkgver=Mono.Zeroconf.0.9.0.r9.g6132666
pkgrel=3
pkgdesc="A cross platform Zero Configuration Networking library for Mono and .NET."
url="http://www.mono-project.com/Mono.Zeroconf"
license=('GPL')
arch=('any')
depends=('mono' 'avahi' 'dbus-sharp')
options=('!makeflags')
source=("git+https://github.com/arfbtwn/Mono.Zeroconf#branch=feature/dbus-sharp")
md5sums=('SKIP')
replaces=(mono-zeroconf)
conflicts=(mono-zeroconf)

pkgver() {
  cd ${srcdir}/${_pkgbase}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export MONO_SHARED_DIR=${srcdir}/.wabi
    mkdir -p "${MONO_SHARED_DIR}"

    cd ${srcdir}/${_pkgbase}
    NOCONFIGURE=1 ./autogen.sh

    ./configure --prefix=/usr --disable-docs --disable-mdnsresponder
    make hicolordir=/usr/share/icons/hicolor
}

package() {
    cd ${srcdir}/${_pkgbase}
    make hicolordir=/usr/share/icons/hicolor \
    GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 \
        DESTDIR=${pkgdir} install
    rm -rf "${MONO_SHARED_DIR}"
}
