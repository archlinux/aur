# Maintainer: WoefulDerelict <WoefulDerelict at GMail dot com>

pkgname=ladish
pkgver=1
pkgrel=2
pkgdesc="Session management system for JACK."
arch=('i686' 'x86_64')
url="https://github.com/LADI/ladish"
license=('GPL2')
depends=('a2jmidid' 'boost' 'dbus-glib' 'flowcanvas<=0.7.1' 'jack' 'laditools' 'python2')
makedepends=('git' 'intltool')
provides=('lash')
conflicts=('lash')
source=("https://github.com/LADI/ladish/archive/ladish-1.tar.gz"
        "ladish_conf.diff")
sha512sums=('b01e24cd79c2711139c9d46c9bff4687049c3a735562a7f48a387103eec25c0222e935b90fb4eb2d3fc24629e417dab0c5aac215cbbca659ac49a2e802d1fd10'
            '8a5a937614a35ecfd1855e9fbe6325b86871a662cd771993eaae89f9b95b229469d939675284ef530cfc38acbfa2b674d094400b0aa793cbbf1fdce119fa4fae')

prepare() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  sed -i "s|env python|&2|" ladish_control

  # Add missing include.
  sed -i "36i#include <sys/resource.h>" daemon/loader.c

  # Fix default JACK conf tool.
  patch -Np1 -i ${srcdir}/ladish_conf.diff
}

build() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  export PYTHON=/usr/bin/python2
  export CXX='g++ -std=c++11'
  python2 waf configure --prefix=/usr \
              --enable-liblash \
              --enable-pylash
  python2 waf
}

package() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  python2 waf install --destdir="${pkgdir}/"
}
