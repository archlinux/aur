# $Id$
# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Pieter Lenaerts <pieter dot aj dot lenaerts gmail>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=alsa-lib-x205ta
pkgver=1.2.2
pkgrel=2
pkgdesc="An alternative implementation of Linux sound support, with UCM files for the ASUS x205ta."
arch=('x86_64')
url="https://www.alsa-project.org"
license=('LGPL2.1')
depends=('glibc' 'alsa-topology-conf' 'alsa-ucm-conf')
provides=('libasound.so' 'libatopology.so' "${pkgname%-x205ta}=$pkgver")
conflicts=('alsa-lib')
source=(https://www.alsa-project.org/files/pub/lib/${pkgname%-x205ta}-$pkgver.tar.bz2
	https://raw.githubusercontent.com/plbossart/UCM/c8b344ca650a62aa809242b0c9ba908eac963125/chtrt5645/chtrt5645.conf
	https://raw.githubusercontent.com/plbossart/UCM/c7405e6f03eb2404edb38b495c27225364bf16f4/sof-chtrt5645/HiFi.conf
	)
sha256sums=('d8e853d8805574777bbe40937812ad1419c9ea7210e176f0def3e6ed255ab3ec'
            '8d0ede122c8b881978af8a3cbae194129675fed59eda584931489e95b3d27f0b'
            'f206ed6bdba1c0e0266953ef76b677fa825a3965ab4b0eb265fcd1a5c629f9d7')

prepare() {
  cd "$srcdir/${pkgname%-x205ta}-$pkgver"
  autoreconf -vfi
}

build() {
  cd "$srcdir/${pkgname%-x205ta}-$pkgver"
  ./configure --prefix=/usr \
              --without-debug
  make
}

package() {
  cd "$srcdir/${pkgname%-x205ta}-$pkgver"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install -C doc
  install -vDm 644 {MEMORY-LEAK,TODO,NOTES,ChangeLog,doc/asoundrc.txt} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp "$srcdir/HiFi.conf" "$pkgdir/usr/share/alsa/ucm/chtrt5645/HiFi.conf"
  cp "$srcdir/chtrt5645.conf" "$pkgdir/usr/share/alsa/ucm/chtrt5645/chtrt5645.conf"
}

