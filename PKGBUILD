# Maintainer: WoefulDerelict <WoefulDerelict at GMail dot com>

pkgname=ladish
pkgver=0.3
pkgrel=3
pkgdesc="Session management system for JACK."
arch=('i686' 'x86_64')
url="https://launchpad.net/ladish"
license=('GPL2')
depends=('jack' 'dbus-glib' 'laditools' 'flowcanvas<=0.7.1' 'a2jmidid')
makedepends=('git' 'python2')
provides=('ladish' 'lash')
conflicts=('ladish' 'lash')
install=${pkgname}.install
source=("http://repo.or.cz/w/ladish.git/snapshot/dec0b7d9b8cc904fe1c8c6642f48f427e0a818e8.tar.gz")
sha512sums=('bc0854e2b72837e42f2c4f6d6038b24c1918bebefda6a3dd2cfe2b0b09a7ebd87162be04c20b1bfa5ea7540593f2529a0fd29cccdb556dfce1d27311c2e46fc5')

prepare() {
  cd "${srcdir}/${pkgname}-dec0b7d"
  sed -i "1s/python/&2/" ladish_control
  sed -i "s|\(RELEASE = \).*|\1True|" wscript

  # Add missing include.
  sed -i "36i#include <sys/resource.h>" daemon/loader.c
}

build() {
  cd "${srcdir}/${pkgname}-dec0b7d"
  export PYTHON=/usr/bin/python2
  python2 waf configure --prefix=/usr \
                        --enable-liblash \
                        --enable-pylash
  python2 waf
}

package() {
  cd "${srcdir}/${pkgname}-dec0b7d"
  python2 waf install --destdir="${pkgdir}/"
}
