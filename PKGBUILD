# Maintainer: Daniel Gustaw <gustaw.daniel@gmail.com>

# to create a package for another locale, check the available locales from
# https://huggingface.co/rhasspy/piper-voices/tree/main
# then copy this PKGBUILD and adjust $_lang and $_region accordingly

_lang="pl"
_region="PL"

_regionSmall=${_region,,}
_locale="${_lang}_${_region}"
pkgname="piper-voices-${_lang}-${_regionSmall}"
pkgver=1.0.0
pkgrel=2
pkgdesc="Voices for Piper text to speech system ($_locale)"
url="https://huggingface.co/rhasspy/piper-voices"
license=("MIT")
arch=("any")
groups=("piper-voices")
provides=("piper-voices")
# only en_US conflicts with minimal, other locales are compatible with it
conflicts=()
depends=("piper-voices-common")
makedepends=("git-lfs")
install="${pkgname}.install"

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

