# Maintainer: Perceptified <perceptified@gmail.com>
maintaner="Perceptified <perceptified@gmail.com>" 
pkgname=chowkick.lv2-git
pkgdesc="Drum synthesizer plugin based on modelling of old-school drum machine circuits."
pkgver=r78.632c6ee
pkgrel=1
arch=(x86_64)
url="https://github.com/Chowdhury-DSP/ChowKick"
license=(BSD)
groups=(lv2plugins)
conflicts=('chowkick.lv2' 'chowkick.lv2')
provides=('chowkick.lv2' 'chowkick.lv2')
depends=('git' 'alsa-lib' 'libxcursor' 'libxinerama' 'libxrandr' 'freeglut' 'jack' 'xsimd')
makedepends=()
source=("$pkgname::git+https://github.com/Chowdhury-DSP/ChowKick"
        "git+https://github.com/lv2-porting-project/JUCE.git"
        "git+https://github.com/jatinchowdhury18/RTNeural.git"
        "git+https://github.com/Chowdhury-DSP/chowdsp_utils.git"
        "git+https://github.com/jatinchowdhury18/foleys_gui_magic.git")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$pkgname"

  # rm -rf Plugin/Juce
  # rm -rf Plugin/foleys_gui_magic
  git submodule init
  git submodule update --init --recursive
  git config submodule.Plugin/Juce.url "${srcdir}"/JUCE
  git config submodule.Plugin/foleys_gui_magic.url "${srcdir}"/foleys_gui_magic
  git submodule sync --recursive
  git submodule update

  rm -rf Juce/VST2_SDK
}

build() {
	cd "$pkgname"
  cmake -Bbuild
  cmake --build build/ --config Release
}

package() {
	cd "$pkgname"
  mkdir -p "$pkgdir"/usr/lib/lv2/
  cp -r build/ChowKick_artefacts/LV2/ChowKick.lv2 "$pkgdir"/usr/lib/lv2/
}
