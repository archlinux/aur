# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>
# Maintainer: vantu5z <vantu5z@mail.ru>
# Contributor: der_fenix <derfenix@gmail.com>

pkgname=rhvoice-git
pkgver=1.2.3.r37.2dc35bc
pkgrel=1
pkgdesc="Free and open source speech synthesizer for Russian and other languages. (development version)"
arch=('x86_64')
url="https://github.com/Olga-Yakovleva/RHVoice"
license=('GPL3')
depends=('libpulse')
makedepends=('git' 'scons')
optdepends=('rhvoice-dictionary-git: extended russian dictionary'
	'speech-dispatcher: for speech-dispatcher module support'
	'portaudio: for portaudio backend'
	'libao: for ao backend')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/RHVoice/RHVoice.conf')
source=(${pkgname%-git}::'git+https://github.com/Olga-Yakovleva/RHVoice.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	scons prefix="/usr" sysconfdir="/etc" CPPFLAGS="$CPPFLAGS" CCFLAGS="$CFLAGS" \
	      LINKFLAGS="$LDFLAGS"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "${pkgdir}/usr/lib/speech-dispatcher-modules"
	scons install DESTDIR="${pkgdir}" prefix="/usr" sysconfdir="/etc" \
	      CPPFLAGS="$CPPFLAGS" CCFLAGS="$CFLAGS" LINKFLAGS="$LDFLAGS"
	ln -s "/usr/bin/sd_rhvoice" "${pkgdir}/usr/lib/speech-dispatcher-modules/sd_rhvoice"
}
