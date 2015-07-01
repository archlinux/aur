# Maintainer: Alain Kalker <a.c.kalker@gmail.com>
_pkgbase=chromiumos-ui-tts
pkgname=$_pkgbase-git
pkgver=440.2714077
pkgrel=1
pkgdesc="Chromium OS UI ChromeVox text-to-speech, with accessibility support"
arch=('arm' 'i686' 'x86_64')
url="http://www.chromium.org/chromium-os"
license=('custom')
depends=('chromiumos-ui')
makedepends=('unzip')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
options=('!strip')
_gitname=chromeos-assets
source=($_gitname::git+https://chromium.googlesource.com/chromiumos/platform/assets)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
	cd "$srcdir/$_gitname"

	# Speech synthesis accessibility support
	unzip accessibility/extensions/access_chromevox.zip
	install -d "$pkgdir/usr/share/$_gitname"/accessibility/extensions/access_chromevox
    cp -dr chromevox_deploy/* "$pkgdir/usr/share/$_gitname"/accessibility/extensions/access_chromevox/

	#
	# Speech synthesis
	#

	install -d "$pkgdir/usr/share/$_gitname"/speech_synthesis/patts

	# Speech synthesis component extension code
	install -D speech_synthesis/patts/manifest.json \
		"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
	install -D speech_synthesis/patts/tts_main.js \
		"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
	install -D speech_synthesis/patts/tts_controller.js \
		"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
	install -D speech_synthesis/patts/tts_service.nmf \
		"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/

	# Speech synthesis voice data
	install -D speech_synthesis/patts/voice_data_hmm_de-DE.js \
		"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
	unzip speech_synthesis/patts/voice_data_hmm_de-DE.zip
	cp -dr voice_data_hmm_de-DE \
		"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
	install -D speech_synthesis/patts/voice_data_hmm_en-GB.js \
		"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
	unzip speech_synthesis/patts/voice_data_hmm_en-GB.zip
	cp -dr voice_data_hmm_en-GB \
		"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
	install -D speech_synthesis/patts/voice_data_hmm_en-US.js \
		"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
	unzip speech_synthesis/patts/voice_data_hmm_en-US.zip
	cp -dr voice_data_hmm_en-US \
		"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
	install -D speech_synthesis/patts/voice_data_hmm_es-ES.js \
		"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
	unzip speech_synthesis/patts/voice_data_hmm_es-ES.zip
	cp -dr voice_data_hmm_es-ES \
		"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
	install -D speech_synthesis/patts/voice_data_hmm_fr-FR.js \
		"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
	unzip speech_synthesis/patts/voice_data_hmm_fr-FR.zip
	cp -dr voice_data_hmm_fr-FR \
		"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
	install -D speech_synthesis/patts/voice_data_hmm_it-IT.js \
		"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
	unzip speech_synthesis/patts/voice_data_hmm_it-IT.zip
	cp -dr voice_data_hmm_it-IT \
		"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/

	# Speech synthesis engine (platform-specific native client module)
	if [ "$CARCH" = "arm" ] ; then
		unzip speech_synthesis/patts/tts_service_pexe_arm.nexe.zip
		install -D tts_service_pexe_arm.nexe \
			"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
	elif [ "$CARCH" = "i686" ] ; then
		unzip speech_synthesis/patts/tts_service_x86-32.nexe.zip
		install -D tts_service_x86-32.nexe \
			"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
	elif [ "$CARCH" = "x86_64" ] ; then
		unzip speech_synthesis/patts/tts_service_x86-64.nexe.zip
		install -D tts_service_x86-64.nexe \
			"$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
	fi
}
