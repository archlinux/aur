# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sean Bolton musound at jps dot net
# Contributor:  Thomas Karmann <thomas@karmann-paf.de>
pkgname=xsynth-dssi
pkgver=0.9.4
pkgrel=6
pkgdesc="An analog-style (VCOs-VCF-VCA) synth plugin for DSSI"
arch=('i686' 'x86_64')
url="https://dssi.sourceforge.net/download.html#Xsynth-DSSI"
license=('GPL-2.0-or-later')
depends=('gtk2' 'liblo' 'glib2' 'cairo' 'bash' 'glibc' 'dssi')
makedepends=('ladspa')
options=('!libtool')
source=(http://downloads.sourceforge.net/project/dssi/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz
        xsynth-dssi)
md5sums=('3432ecdac06407a992f80eb1c1ecf7cd'
         'c346e6a944f202fccb2278b77a5e184b')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install || return 1
  install -D -m755 ${srcdir}/xsynth-dssi ${pkgdir}/usr/bin/xsynth-dssi
}

