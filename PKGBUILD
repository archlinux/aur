# Maintainer: Alain Kalker <a.c.kalker@gmail.com>
_pkgbase=chromiumos-ui-tts
pkgname=$_pkgbase-git
pkgver=491.d01fbdc
pkgrel=2
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

# Voices
_voices=(de-DE_2
         en-GB_2
         en-IN_2
         en-US_2
         es-ES_2
         es-US_2
         fr-FR_2
         it-IT_2
         ko-KR_2
         nl-NL_2
         pt-BR_2)

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$_gitname"

  install -d "$pkgdir/usr/share/$_gitname"/speech_synthesis/patts

  # Speech synthesis component extension code
  install -D speech_synthesis/patts/manifest.json \
          "$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
  install -D speech_synthesis/patts/manifest_guest.json \
          "$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
  install -D speech_synthesis/patts/tts_main.js \
          "$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
  install -D speech_synthesis/patts/tts_controller.js \
          "$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
  install -D speech_synthesis/patts/tts_service.nmf \
          "$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/

  # Speech synthesis voice data
  for _voice in ${_voices[@]}; do
    install -D speech_synthesis/patts/voice_data_hmm_$_voice.js \
            "$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
    unzip speech_synthesis/patts/voice_data_hmm_$_voice.zip \
          -d "$pkgdir/usr/share/$_gitname"/speech_synthesis/patts/
  done

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
