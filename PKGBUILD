# Maintainer: Sandy Carter <bwrsandman@gmail.com>
# Contributor: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com

pkgname=polygnome
pkgver=0.1.3
pkgrel=3
pkgdesc="A polyrhythmic metronome"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/polygnome/"
license=('GPL3')
depends=('stk' 'jack')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "mtaudio.patch"
        "MTAudio-RtError-was-replaced-with-RtAudioError.patch"
        "warnings.patch")
sha512sums=('6691465600b2d07dbf56d43f3f133fc4ea535d51aadacf2afd4826731b30a0802cd8d6070be9343c42caf70b3cabefb2c20ff169705faceb9a24813565555ec7'
            'c017019fd64e4dc6930e0103e1fc8ff3049c412f38f7d8899584303c02a930f6135d378d03d216a0d6de3f3a6d5db6e780826bee4d189f224c815e009445b7b3'
            'bf82f06d0c09a3723b646256160b999921075e8ab7883a280f77f5efa543eaf5902542578fa335d46f02d965d013c7065f0b48ec3cda94166de4210e72961747'
            'd51f8d3fd3b8b7a995b29690d6cfd303b614f65192fcda94995e9f4f9979e840d5703c388e72cfd769a54c462a51162e8a6882a4bdb0dcfe974627a52556c04c')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
  msg "Fix RtError"
  patch -Np1 -i ${srcdir}/MTAudio-RtError-was-replaced-with-RtAudioError.patch
  msg "Add Missing Header"
	patch -Np1 -i  ${srcdir}/mtaudio.patch
  msg "Ignore warnings in gtk"
	patch -Np1 -i  ${srcdir}/warnings.patch
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
