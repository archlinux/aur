# Maintainer: Michael Taboada <michael@2mb.solutions>
# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Contributor: alex19EP <aarnaarn2@gmail.com>
# Contributor: Kyle <kyle@free2.ml>
# Contributor: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: Alexander Jenisch <nt@divzero.at>
# Contributor: Chris Brannon <cmbrannon@cox.net>
# Contributor: Andreas Messer <andi@bupfen.de>

pkgbase=speech-dispatcher-git
pkgname=(speech-dispatcher-git libspeechd-git)
pkgver=0.9.0.rc2.r7.gd25ed10d
pkgrel=1
arch=('x86_64')
pkgdesc="High-level device independent layer for speech synthesis interface (development version)"
license=('GPL2' 'FDL')
url="http://www.freebsoft.org/speechd"
makedepends=('intltool' 'espeak' 'libltdl' 'python-xdg' 'dotconf' 'libpulse' 'libao' 'git')
source=(${pkgname}::'git+https://github.com/brailcom/speechd.git')
sha512sums=('SKIP')

prepare() {
	cd "$pkgname"
	autoreconf -i
}

build() {
	cd "$pkgname"
	./configure --prefix=/usr \
		--enable-shared \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--localedir=/usr/share/speech-dispatcher/locale \
		--with-systemdsystemunitdir=/usr/lib/systemd/system \
		--with-espeak        
	make
}

package_speech-dispatcher-git() {
	depends=("libspeechd-git=$pkgver-$pkgrel" 'libltdl' 'python-xdg' 'dotconf' 'libpulse' 'libao')
	optdepends=('festival: Speech output using Festival'
		'espeak: Speech output using ESpeak'
  'espeak-ng-git: Speech output using espeak-ng compatible with espeak (may require rebuild)'
		'pulseaudio: PulseAudio support')  
	provides=("speech-dispatcher")
	conflicts=("speech-dispatcher")
	backup=(etc/speech-dispatcher/clients/emacs.conf
		etc/speech-dispatcher/modules/ibmtts.conf
		etc/speech-dispatcher/modules/espeak-generic.conf
		etc/speech-dispatcher/modules/espeak.conf
		etc/speech-dispatcher/modules/espeak-ng.conf
		etc/speech-dispatcher/modules/swift-generic.conf
		etc/speech-dispatcher/modules/festival.conf
		etc/speech-dispatcher/modules/cicero.conf
		etc/speech-dispatcher/modules/espeak-mbrola-generic.conf
		etc/speech-dispatcher/modules/espeak-ng-mbrola-generic.conf
		etc/speech-dispatcher/modules/dtk-generic.conf
		etc/speech-dispatcher/modules/llia_phon-generic.conf
		etc/speech-dispatcher/modules/ivona.conf
		etc/speech-dispatcher/modules/epos-generic.conf
		etc/speech-dispatcher/modules/flite.conf
		etc/speech-dispatcher/modules/pico-generic.conf
		etc/speech-dispatcher/speechd.conf)

	cd "$pkgname"
	make DESTDIR="${pkgdir}" install

	install -d "${pkgdir}/var/log/speech-dispatcher"

	sed -i 's|includedir=.*|includedir=${prefix}/include/speech-dispatcher|g' "${pkgdir}/usr/lib/pkgconfig/speech-dispatcher.pc"

	mkdir -p ${srcdir}/libspeechd/usr/lib
	mv "${pkgdir}"/usr/include ${srcdir}/libspeechd/usr
	mv "${pkgdir}"/usr/lib/libspeechd*so* ${srcdir}/libspeechd/usr/lib
}

package_libspeechd-git() {
	provides=("libspeechd")
	conflicts=("libspeechd")
	mkdir -p "${pkgdir}"/usr/lib

	mv ${srcdir}/libspeechd/usr/include "${pkgdir}"/usr
	mv ${srcdir}/libspeechd/usr/lib/* "${pkgdir}"/usr/lib
}
