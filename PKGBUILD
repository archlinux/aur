# Maintainer: AlphaJack <alphajack at tuta dot io>

# https://gitlab.archlinux.org/archlinux/packaging/packages/tesseract-data/-/blob/main/PKGBUILD?ref_type=heads

#cd "piper-voices"
#mapfile -t _locales < <(find . -mindepth 2 -maxdepth 2 -type d -name "*_*" -printf '"%P"\n' | sort)
#for locale in "${_locales[@]}"; do locale="\"${locale/*\/}"; locale="${locale,,}"; locale="${locale/_/-}"; echo "$locale"; done

_locales=(
 "ar-jo"
 "ca-es"
 "cs-cz"
 "da-dk"
 "de-de"
 "el-gr"
 "en-gb"
 "en-us"
 "es-es"
 "es-mx"
 "fa-ir"
 "fi-fi"
 "fr-fr"
 "hu-hu"
 "is-is"
 "it-it"
 "ka-ge"
 "kk-kz"
 "lb-lu"
 "ne-np"
 "nl-be"
 "nl-nl"
 "no-no"
 "pl-pl"
 "pt-br"
 "pt-pt"
 "ro-ro"
 "ru-ru"
 "sk-sk"
 "sl-si"
 "sr-rs"
 "sv-se"
 "sw-cd"
 "tr-tr"
 "uk-ua"
 "vi-vn"
 "zh-cn"
)

pkgbase="piper-voices"
pkgname=("${_locales[@]/#/$pkgbase-}")
epoch=1
pkgver=1.0.0
pkgrel=2
pkgdesc="Voices for Piper text to speech system"
url="https://huggingface.co/rhasspy/piper-voices"
license=("MIT")
arch=("any")
groups=("$pkgbase")
provides=("$pkgbase")
depends=("$pkgbase-common")
conflicts=("$pkgbase-minimal")
makedepends=("git-lfs")
options=("!strip")

prepare(){
 # replace .onnx git lfs pointers (few bytes) with actual trained models (dozens of MB)
 # https://github.com/git-lfs/git-lfs/issues/1351#issuecomment-230495709
 # https://github.com/git-lfs/git-lfs/issues/3508#issuecomment-460492294
 # https://stackoverflow.com/a/58316954
 # https://stackoverflow.com/a/74931406
 # https://manpages.debian.org/testing/git-lfs/git-lfs-pull.1.en.html

 # needed to avoid smudge error
 rm -rf "$pkgbase"
 
 # download the repo by keeping the lfs pointers
 GIT_LFS_SKIP_SMUDGE=1 git clone "https://huggingface.co/rhasspy/$pkgbase"

 # uncomment to download all lfs objects (~6GB total, 107 models)
 #git lfs pull 
 
 #:
 
 # remove mp3 samples
 cd "$pkgbase"
 find . -type d -name 'samples' -exec rm -rf {} +
}

# declare the package() functions for all voices
# variables not yet defined when eval is run must be escaped (e.g. lang, unlike locale)
# god forgive this use of eval
for locale in "${_locales[@]}"; do
 eval "
  package_$pkgbase-$locale(){
   # set specific variables
   pkgdesc+=' ($locale)'
   lang=${locale:0:2}
   region=${locale: -2}
   region=\${region^^}
   #echo \$lang
   #echo \$region
   
   # download only the specific locale
   cd $pkgbase
   mapfile -t _models < <(find . -type f -name \"*\${lang}_\${region}*.onnx\" -printf \"/%P\n\")
   echo 'Downloading the following models:'
   printf '%s\n' \${_models[*]}
   git lfs pull --include \$(IFS=,; echo \"\${_models[*]}\")

   # copy only the specific locale
   install -d \$pkgdir/usr/share/$pkgbase/\$lang
   cp -r \$lang/\${lang}_\${region} \$pkgdir/usr/share/$pkgbase/\$lang
  }
 "
done
