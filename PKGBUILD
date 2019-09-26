# Author: Prism019 <derektutaj at gmail dot com>
# Original Maintainer: WoefulDerelict <WoefulDerelict at GMail dot com>

pkgname=ladish-no-gui
srcname=ladish
pkgver=1
pkgrel=2
pkgdesc="Session management system for JACK. (No gladish)"
arch=('x86_64')
url="https://github.com/LADI/ladish"
license=('GPL2')
depends=('dbus-glib' 'jack' 'python2')
optdepends=('a2jmidid: a2jmidid proxy')
makedepends=('intltool')
provides=('lash' 'ladish')
conflicts=('lash' 'ladish')
source=("https://github.com/LADI/ladish/archive/ladish-1.tar.gz"
        "ladish_conf.diff"
        "ladish_no_gui.diff")
sha512sums=('b01e24cd79c2711139c9d46c9bff4687049c3a735562a7f48a387103eec25c0222e935b90fb4eb2d3fc24629e417dab0c5aac215cbbca659ac49a2e802d1fd10'
            '8a5a937614a35ecfd1855e9fbe6325b86871a662cd771993eaae89f9b95b229469d939675284ef530cfc38acbfa2b674d094400b0aa793cbbf1fdce119fa4fae'
            'bec88ee9334a5a5ffd697bc52b81b12135d553c3b1130be856168a4142a902a8b690d5e30db3ee87a9aaae079a88c15f06314c4a3e72118fca2bfdf3eaf27dc6')

prepare() {
  cd "${srcname}-${srcname}-${pkgver}"
  sed -i "s|env python|&2|" ladish_control

  # Add missing include.
  sed -i "36i#include <sys/resource.h>" daemon/loader.c

  # Fix defualt JACK conf tool.
  patch -Np1 -i ${srcdir}/ladish_conf.diff

  # Disable GUI building and packaging
  patch -Np1 -i ${srcdir}/ladish_no_gui.diff
}

build() {
  cd "${srcname}-${srcname}-${pkgver}"
  export PYTHON=/usr/bin/python2
  export CXX='g++ -std=c++11'
  python2 waf configure --prefix=/usr \
                        --enable-liblash \
                        --enable-pylash
  python2 waf
}

package() {
  cd "${srcname}-${srcname}-${pkgver}"
  python2 waf install --destdir="${pkgdir}/"
}
