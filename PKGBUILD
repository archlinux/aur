# Maintainer: Lieven Moors <lievenmoors at gmail dot com>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=softwerk
pkgver=3.0
pkgrel=6
pkgdesc="A software analogue MIDI sequencer, modelled on hardware
analogue sequencers like Doepfer's Schaltwerk"
arch=(i686 x86_64)
url="http://softwerk.linuxaudiosystems.com/softwerk/softwerk/trunk/softwerk/"
license=('GPL2')
depends=('libxslt' 'alsa-lib' 'gtkmm')
makedepends=('scons' 'boost')
source=(http://ardour.org/files/${pkgname}-${pkgver}.tar.bz2
rev_21_to_25.diff)
md5sums=('a58a0854927ca46eff10ce6af123f35c'
         '86849b739c057d680e955e3192326ffc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p3 < ${srcdir}/rev_21_to_25.diff
  sed -i 's/lib64/lib/' SConstruct
  sed -i '/#include <cerrno>/a#include <unistd.h>' libs/pbd/path.cc
  sed -i 's|#include <glib/gfileutils.h>|#include <glib.h>|' src/configuration.cc
  scons PREFIX=/usr
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  scons PREFIX=/usr DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
