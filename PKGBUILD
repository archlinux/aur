# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Maintainer: Michael Taboada <michael@2mb.solutions>
# Contributor: Kyle <kyle@free2.ml>
# Contributor: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: Alexander Jenisch <nt@divzero.at>
# Contributor: Chris Brannon <cmbrannon@cox.net>
# Contributor: Andreas Messer <andi@bupfen.de>

pkgbase=speech-dispatcher-git
pkgname=(speech-dispatcher-git libspeechd-git)
pkgver=0.11.0.r0.g56c07622
pkgrel=1
pkgdesc="High-level device independent layer for speech synthesis interface (development version)"
arch=('x86_64')
url='http://www.freebsoft.org/speechd'
license=('GPL2' 'FDL')
makedepends=('glib2' 'intltool' 'espeak-ng' 'libtool' 'python-pyxdg' 'dotconf'
             'libpulse' 'libao' 'git' 'svox-pico-bin')
source=(${pkgname%-git}::'git+https://github.com/brailcom/speechd.git')
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	autoreconf -i
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr --sysconfdir=/etc \
	            --disable-static \
	            --libexecdir=/usr/lib/speech-dispatcher/ \
	            --with-pico \
	            --with-ibmtts=no --with-kali=no --with-baratinoo=no \
	            --with-voxin=no --without-flite
	make
}

package_speech-dispatcher-git() {
	depends=("libspeechd-git=$pkgver-$pkgrel" 'python-pyxdg' 'dotconf' 'libpulse' 'libao')
	optdepends=('festival: Speech output using Festival'
	            'espeak-ng: Speech output using ESpeak-ng'
	            'svox-pico-bin: Speech output using pico'
	            'pulseaudio: PulseAudio support')
	conflicts=("speech-dispatcher")
	provides=("speech-dispatcher")
	backup=('etc/speech-dispatcher/clients/emacs.conf'
	        'etc/speech-dispatcher/modules/dtk-generic.conf'
	        'etc/speech-dispatcher/modules/epos-generic.conf'
	        'etc/speech-dispatcher/modules/espeak-ng.conf'
	        'etc/speech-dispatcher/modules/espeak-ng-mbrola.conf'
	        'etc/speech-dispatcher/modules/espeak-ng-mbrola-generic.conf'
	        'etc/speech-dispatcher/modules/festival.conf'
	        'etc/speech-dispatcher/modules/llia_phon-generic.conf'
	        'etc/speech-dispatcher/modules/mary-generic.conf'
	        'etc/speech-dispatcher/modules/pico.conf'
	        'etc/speech-dispatcher/modules/swift-generic.conf'
	        'etc/speech-dispatcher/speechd.conf'
	)

	cd "${pkgname%-git}"
	make DESTDIR="${pkgdir}" install

	rm "${pkgdir}/etc/speech-dispatcher/modules/cicero.conf"
	rm "${pkgdir}/etc/speech-dispatcher/modules/espeak.conf"
	rm "${pkgdir}/etc/speech-dispatcher/modules/espeak-mbrola-generic.conf"
	rm "${pkgdir}/etc/speech-dispatcher/modules/flite.conf"
	rm "${pkgdir}/usr/lib/speech-dispatcher/speech-dispatcher-modules/sd_cicero"

	sed -i 's|includedir=.*|includedir=${prefix}/include/speech-dispatcher|g' "${pkgdir}/usr/lib/pkgconfig/speech-dispatcher.pc"

	mkdir -p "${srcdir}"/libspeechd/usr/lib
	mv "${pkgdir}"/usr/include "${srcdir}"/libspeechd/usr
	mv "${pkgdir}"/usr/lib/libspeechd*so* "${srcdir}"/libspeechd/usr/lib
}

package_libspeechd-git() {
	depends=('glib2' 'libtool')
	conflicts=("libspeechd")
	provides=("libspeechd")
	mkdir -p "${pkgdir}"/usr/lib

	mv "${srcdir}"/libspeechd/usr/include "${pkgdir}"/usr
	mv "${srcdir}"/libspeechd/usr/lib/* "${pkgdir}"/usr/lib
}
