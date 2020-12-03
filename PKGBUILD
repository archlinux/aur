# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=rhvoice
pkgver=1.2.3
pkgrel=2
pkgdesc="Free and open source speech synthesizer for Russian and other languages"
arch=('x86_64')
url="https://github.com/Olga-Yakovleva/RHVoice"
license=('GPL3' 'custom' 'custom:by-nc-nd-4.0' 'custom:by-nc-sa-4.0'
         'custom:by-sa-4.0')
depends=('speech-dispatcher' 'libpulse')
makedepends=('scons' 'portaudio' 'libao')
optdepends=('portaudio: for portaudio backend'
	'libao: for ao backend')
backup=('etc/RHVoice/RHVoice.conf')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Olga-Yakovleva/RHVoice/archive/$pkgver.tar.gz)
sha512sums=('b79aea1d682a20bedff8e7d01d825204c09a4d5250f9178b96699a7123b3ec692b99fa2af05d4de22e802d799917d48df5f124d020c8541bc2a141c8f5af01a1')

build() {
	cd "$srcdir/RHVoice-$pkgver"
	scons prefix="/usr" sysconfdir="/etc" CPPFLAGS="$CPPFLAGS" CCFLAGS="$CFLAGS" \
	      LINKFLAGS="$LDFLAGS"
}

package() {
	cd "$srcdir/RHVoice-$pkgver"
	mkdir -pv "${pkgdir}/usr/lib/speech-dispatcher-modules"
scons install DESTDIR="${pkgdir}" prefix="/usr" sysconfdir="/etc" \
	      CPPFLAGS="$CPPFLAGS" CCFLAGS="$CFLAGS" LINKFLAGS="$LDFLAGS"
	ln -s "/usr/bin/sd_rhvoice" "${pkgdir}/usr/lib/speech-dispatcher-modules/sd_rhvoice"
	install -Dm0644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm0644 licenses/by-nc-nd-4.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/by-nc-nd-4.0"
	install -Dm0644 licenses/by-nc-sa-4.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/by-nc-sa-4.0"
	install -Dm0644 licenses/by-sa-4.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/by-sa-4.0"
}
