# Maintainer: AlphaJack <alphajack at tuta dot io>

_pkgbase="piper-voices"
pkgname="$_pkgbase-minimal"
pkgver=1.0.0
pkgrel=2
pkgdesc="Voices for Piper text to speech system (single voice for english)"
url="https://huggingface.co/rhasspy/$_pkgbase"
license=("MIT")
arch=("any")
groups=("$_pkgbase")
provides=("$_pkgbase")
conflicts=("$_pkgbase-en-us")
depends=("$_pkgbase-common")
makedepends=("git-lfs")
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
 rm -rf "$_pkgbase"
 
 # download the repo by keeping the lfs pointers
 GIT_LFS_SKIP_SMUDGE=1 git clone "https://huggingface.co/rhasspy/$_pkgbase"
 cd "$_pkgbase"

 # uncomment to download all lfs objects (~6GB total, 107 models)
 #git lfs pull 
 
 # else uncomment to download only specific lfs objects (~60MB medium/low, ~120MB high)
 _models=(
  "/en/en_US/ryan/high/en_US-ryan-high.onnx"
 )
 echo "Downloading the following models: ${_models[*]}"
 git lfs pull --include "$(IFS=,; echo "${_models[*]}")"
 
 # remove mp3 samples
 find . -type d -name "samples" -exec rm -r {} +
 
 # remove other common files
 find . -type f -name "README.md" -o -name "voices.json" -exec rm {} +
 
 # remove lfs pointers from other dialects (folders that weight less than 1 MB)
 find . -type d | while read _dir; do
  if [[ -d "$_dir" && "$(du -bs "$_dir" | awk '{print $1}')" -lt 1000000 ]]; then
   #echo "Removing unused dir $_dir"
   rm -r "$_dir"
  fi
 done
}

package(){
 cd "$_pkgbase"
 install -d "$pkgdir/usr/share/$_pkgbase"
 cp -r * "$pkgdir/usr/share/$_pkgbase"
}
