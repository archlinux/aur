# Author: Hedge Berg <hedgeberg at gmail dot com>
# Contributor: Prism019 <derektutaj at gmail dot com>
# Original Maintainer: WoefulDerelict <WoefulDerelict at GMail dot com>

pkgname=ladish-py3-no-gui-git
srcname=ladish
pkgver=1
pkgrel=2
pkgdesc="Session management system for JACK, now built with Python 3 (No gladish)"
arch=('x86_64')
url="https://github.com/LADI/ladish"
license=('GPL2')
depends=('dbus-glib' 'jack' 'python')
optdepends=('a2jmidid: a2jmidid proxy')
makedepends=('intltool')
provides=('lash' 'ladish')
conflicts=('lash' 'ladish')
source=("git+https://github.com/LADI/ladish.git"
        "ladish_conf.diff"
        "ladish_no_gui.diff")
sha512sums=( SKIP
'8a5a937614a35ecfd1855e9fbe6325b86871a662cd771993eaae89f9b95b229469d939675284ef530cfc38acbfa2b674d094400b0aa793cbbf1fdce119fa4fae'
'c56404f44b8927b9b5b1b70d4fc375fde52fe145a40813efaf8f6a1eac853a5343de3767e55438eb167bda29d1166d1cbbf7f16a4cbd1fd7949a8b99648983e0'
)


prepare() {
  cd "${srcname}"

  # Add missing include.
  sed -i "36i#include <sys/resource.h>" daemon/loader.c

  # Fix defualt JACK conf tool.
  #patch -Np1 -i ${srcdir}/ladish_conf.diff

  # Disable GUI building and packaging
  patch -Np1 -i ${srcdir}/ladish_no_gui.diff
}

build() {
  cd "${srcname}"
  export PYTHON=/usr/bin/python
  export CXX='g++ -std=c++11'
  python waf configure --prefix=/usr \
                        --enable-liblash \
                        --enable-pylash
  python waf
}

package() {
  cd "${srcname}" 
  python waf install --destdir="${pkgdir}/"
}
