# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=rhvoice
pkgver=1.2.4
pkgrel=1
pkgdesc="Free and open source speech synthesizer for Russian and other languages"
arch=('x86_64')
url="https://github.com/RHVoice/RHVoice"
license=('GPL3' 'custom' 'custom:by-nc-nd-4.0' 'custom:by-sa-4.0'
         'custom:by-sa-4.0')
depends=('speech-dispatcher' 'libpulse')
makedepends=('scons' 'portaudio' 'libao')
optdepends=('portaudio: for portaudio backend'
	'libao: for ao backend')
backup=('etc/RHVoice/RHVoice.conf')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/RHVoice/RHVoice/archive/$pkgver.tar.gz
        voice-victoria.tar.gz::https://github.com/RHVoice/victoria-rus/archive/refs/tags/4.0.tar.gz
        voice-evgeniy-rus.tar.gz::https://github.com/RHVoice/evgeniy-rus//archive/refs/tags/4.0.tar.gz
        voice-evgeniy-eng.tar.gz::https://github.com/RHVoice/evgeniy-eng//archive/refs/tags/4.0.tar.gz
)
sha512sums=('747985a8a0fe27fd1dc15e434dc41bbdca169747ae5cb3695df89ceced9131fc9d196916af08f3caacd21c34cfc022989e3753e21dbc2c0095ba7e991dc58bb8'
            '03b95f76bbd0b213fac867705acd3229f2d62448cdb863968b6ff02cc06f162d07a6154418e3ceee63d8d5352a00c1fed57b635d59424234b6cae3b1914da1cb'
            '4053185fd5cff60a8cf3355fad69ab63348fc5047a7e5d2328a639a5c65cecfaadc92d63599b0b8bc7ca804753593c78c837621cdd153c6ce247100141b96500'
            '1096b2d898292739f86333414a32b97b99112a57cf2c98c5ea31d1b92974f3adc4119e0ee031e6961810365432b77eb96229f7a45c55d8b9337a22aa3848dcc8')

prepare() {
	cd "$srcdir/"
	mv -v victoria-rus-4.0/* "$srcdir/RHVoice-$pkgver/data/voices/victoria"
	mv -v evgeniy-rus-4.0/* "$srcdir/RHVoice-$pkgver/data/voices/evgeniy-rus"
	mv -v evgeniy-eng-4.0/* "$srcdir/RHVoice-$pkgver/data/voices/evgeniy-eng"
}

build() {
	cd "$srcdir/RHVoice-$pkgver"
	scons prefix="/usr" sysconfdir="/etc" CPPFLAGS="$CPPFLAGS" CCFLAGS="$CFLAGS" \
	      LINKFLAGS="$LDFLAGS"
}

package() {
	cd "$srcdir/RHVoice-$pkgver"
	install -vd "${pkgdir}$(pkgconf speech-dispatcher --variable=modulebindir)"
	scons install DESTDIR="${pkgdir}" prefix="/usr" sysconfdir="/etc" \
	      CPPFLAGS="$CPPFLAGS" CCFLAGS="$CFLAGS" LINKFLAGS="$LDFLAGS"
	ln -s "/usr/bin/sd_rhvoice" "${pkgdir}$(pkgconf speech-dispatcher --variable=modulebindir)/sd_rhvoice"
	install -vDm0644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -vDm0644 licenses/by-nc-nd-4.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/by-nc-nd-4.0"
	install -vDm0644 licenses/by-nc-sa-4.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/by-nc-sa-4.0"
	install -vDm0644 licenses/by-sa-4.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/by-sa-4.0"
}
