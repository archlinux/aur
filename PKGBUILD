# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mimic-voices"
pkgver=1.0.0
pkgrel=1
pkgdesc="Voice models for Mimic 3 text to speech system"
url="https://mycroft.ai/mimic-3/"
license=("CC-BY-SA-4.0")
arch=("any")
depends=("mimic")
makedepends=("git-lfs")
# error is thrown if the repo is being cloned here, so it is downloaded in prepare()
#source=("git+https://github.com/MycroftAI/mimic3-voices.git")
#sha256sums=("SKIP")
options=("!strip")

prepare(){
 # replace .onnx git lfs pointers (few bytes) with actual trained models (dozens of MB)
 # https://github.com/git-lfs/git-lfs/issues/1351#issuecomment-230495709
 # https://github.com/git-lfs/git-lfs/issues/3508#issuecomment-460492294
 # https://stackoverflow.com/a/58316954
 # https://stackoverflow.com/a/74931406
 # https://manpages.debian.org/testing/git-lfs/git-lfs-pull.1.en.html

 rm -rf "mimic3-voices"
 GIT_LFS_SKIP_SMUDGE=1 git clone "https://github.com/MycroftAI/mimic3-voices.git"
 cd "mimic3-voices"

 # uncomment to download only specific lfs objects (~73MB each)
 git lfs pull --include "voices/en_US/hifi-tts_low/generator.onnx,voices/it_IT/mls_low/generator.onnx"

 # uncomment to download all lfs objects (~3GB total, 40 models)
 #git lfs pull
 
 # delete folders smaller than 1MB, as they do not contain trained models
 for _lang in "voices"/*; do
  if [ "$(du -bs "$_lang" | awk '{print $1}')" -lt 1048576 ]; then
   rm -r "$_lang"
  else
   for _name in "$_lang"/*; do
    if [ "$(du -bs "$_name" | awk '{print $1}')" -lt 1048576 ]; then
     rm -r "$_name"
    fi
   done
  fi
 done
}

package(){
 cd "mimic3-voices"
 install -d "$pkgdir/usr/share/mycroft/mimic3"
 cp -r "voices" "$pkgdir/usr/share/mycroft/mimic3"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/mimic-voices/LICENSE"
}
