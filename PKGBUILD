# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="piper-voices"
pkgver=1.0.0
pkgrel=1
pkgdesc="Voices for Piper text to speech system"
url="https://huggingface.co/rhasspy/piper-voices"
license=("MIT")
arch=("any")
optdepends=("piper-tts: tts program")
makedepends=("git-lfs")
# error is thrown if the repo is being cloned here (and it tries to convert all models), so it is downloaded in prepare()
#source=("git+https://huggingface.co/rhasspy/piper-voices.git")
#b2sums=("SKIP")
options=("!strip")
install="$pkgname.install"

prepare(){
 # replace .onnx git lfs pointers (few bytes) with actual trained models (dozens of MB)
 # https://github.com/git-lfs/git-lfs/issues/1351#issuecomment-230495709
 # https://github.com/git-lfs/git-lfs/issues/3508#issuecomment-460492294
 # https://stackoverflow.com/a/58316954
 # https://stackoverflow.com/a/74931406
 # https://manpages.debian.org/testing/git-lfs/git-lfs-pull.1.en.html

 # needed to avoid smudge error
 rm -rf "piper-voices"
 
 # download the repo by keeping the lfs pointers
 GIT_LFS_SKIP_SMUDGE=1 git clone "https://huggingface.co/rhasspy/piper-voices"
 cd "piper-voices"

 # uncomment to download all lfs objects (~6GB total, 107 models)
 #git lfs pull 
 
 # else uncomment to download only specific lfs objects (~60MB medium/low, ~120MB high)
 _models=(
  "/en/en_US/ryan/high/en_US-ryan-high.onnx"
  "/de/de_DE/thorsten/high/de_DE-thorsten-high.onnx"
 )
 echo "Downloading the following models: ${_models[*]}"
 git lfs pull --include "$(IFS=,; echo "${_models[*]}")"

 # if not all models have been downloaded, delete folders that do not contain valid onnx files
 find . -type d -name "samples" -exec rm -r {} +
 find . -type d | while read _dir; do
  if [[ -d "$_dir" && "$(du -bs "$_dir" | awk '{print $1}')" -lt 1000000 ]]; then
   echo "Removing unused dir $_dir"
   rm -r "$_dir"
  fi
 done

}

package(){
 cd "piper-voices"
 install -d "$pkgdir/usr/share/$pkgname"
 cp -r * "$pkgdir/usr/share/$pkgname"
}
