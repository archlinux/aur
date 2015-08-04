# Maintainer: Sandy Carter <bwrsandman@gmail.com>
# Contributor: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com

pkgname=polygnome
pkgver=0.1.3
pkgrel=2
pkgdesc="A polyrhythmic metronome"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/polygnome/"
license=('GPL3')
depends=('stk' 'jack')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "mtaudio.patch"
        "MTAudio-RtError-was-replaced-with-RtAudioError.patch")
md5sums=('2367b483d1b8f351482e03eebf8b4c3d'
         'b2d1be46214d51f2e56e909338247a71'
         'ba1a05457c96c79ff1fee358f9ecb4ea')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
  msg "Fix RtError"
  patch -Np1 -i ${srcdir}/MTAudio-RtError-was-replaced-with-RtAudioError.patch
  msg "Add Missing Header"
	patch -Np1 -i  ${srcdir}/mtaudio.patch
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
  # Configure doesn't add '-ljack' properly
	JACK_LIBS="$(pkg-config jack --libs)" ./configure  --prefix=/usr
	make 
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
