# Maintainer: Karakurt karakurtspider.s0net@gmail.com

# to create a package for another locale, check the available locales from
# https://huggingface.co/rhasspy/piper-voices/tree/main
# then copy this PKGBUILD and adjust $_lang and $_region accordingly

_lang="uk"
_region="UA"
LANG_LINE='GenericLanguage   "uk" "uk_UA" "utf-8"'
VOICE_LINE='AddVoice "uk" "female1"    "uk/uk_UA/ukrainian_tts/medium/uk_UA-ukrainian_tts-medium"'

_regionSmall=${_region,,}
_locale="${_lang}_${_region}"
pkgname="piper-voices-${_lang}-${_regionSmall}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Voices for Piper text to speech system ($_locale)"
url="https://huggingface.co/rhasspy/piper-voices"
license=("MIT")
arch=("any")
groups=("piper-voices")
provides=("piper-voices")
depends=("piper-voices-common")
makedepends=("git-lfs")

prepare(){
 # needed to avoid smudge error
 rm -rf "piper-voices"
 
 # download the full repo (~220MB) but keep the lfs pointers
 GIT_LFS_SKIP_SMUDGE=1 git clone "https://huggingface.co/rhasspy/piper-voices"
 
 # define specific models to be downloaded
 cd "piper-voices"
 mapfile -t _models < <(find . -type f -name "*$_locale*.onnx" -printf "/%P\n")
 echo 'Downloading the following models:'
 printf '%s\n' ${_models[*]}
 
 # convert specific lfs pointers into actual models
 git lfs install
 git lfs pull --include $(IFS=,; echo "${_models[*]}")
}

package(){
 # copy only the specific locale
 cd "piper-voices"
 install -d "$pkgdir/usr/share/piper-voices/$_lang"
 cp -r "$_lang/$_locale" "$pkgdir/usr/share/piper-voices/$_lang"
 
 # remove mp3 samples
 find "$pkgdir/usr/share/piper-voices" -type d -name 'samples' -exec rm -rf {} +
}


post_install() {
  # Check if the piper-generic.conf file exists
  if [ -f /etc/speech-dispatcher/modules/piper-tts-generic.conf ]; then
    # Add the lines only if they do not already exist
    if ! grep -Fxq "$LANG_LINE" /etc/speech-dispatcher/modules/piper-tts-generic.conf; then
      echo "$LANG_LINE" >> /etc/speech-dispatcher/modules/piper-tts-generic.conf
    fi
    if ! grep -Fxq "$VOICE_LINE" /etc/speech-dispatcher/modules/piper-tts-generic.conf; then
      echo "$VOICE_LINE" >> /etc/speech-dispatcher/modules/piper-tts-generic.conf
    fi
  else
    ready -p "The file /etc/speech-dispatcher/modules/piper-tts-generic.conf does not exist. Do you want to create it? (y/N) " answer
    if [[ $answer == [Yy] ]]; then
      # Create the file and add the lines
      echo "$LANG_LINE" > /etc/speech-dispatcher/modules/piper-tts-generic.conf
      echo "$VOICE_LINE" >> /etc/speech-dispatcher/modules/piper-tts-generic.conf
    else
      echo "Skipping the creation of /etc/speech-dispatcher/modules/piper-tts-generic.conf."
    fi
  fi
}

post_remove() {
  # Check if the piper-generic.conf file exists
  if [ -f /etc/speech-dispatcher/modules/piper-tts-generic.conf ]; then
    # Remove the lines if they exist
    sed -i "/^$LANG_LINE$/d" /etc/speech-dispatcher/modules/piper-tts-generic.conf
    sed -i "/^$VOICE_LINE$/d" /etc/speech-dispatcher/modules/piper-tts-generic.conf
  fi
}
