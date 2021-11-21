# Maintainer: Perceptified <perceptified@gmail.com>
maintaner="Perceptified <perceptified@gmail.com>" 
pkgname=chowmatrix.lv2-git
pkgdesc="Delay effect, made up of an infinitely growable tree of delay lines, each with individual controls for feedback, panning, distortion, and more."
pkgver=r184.eff6a40
pkgrel=1
arch=(x86_64)
url="https://github.com/Chowdhury-DSP/ChowMatrix"
license=(BSD)
groups=(lv2plugins)
conflicts=('chowmatrix.lv2-git' 'chowmatrix.lv2-git')
provides=('chowmatrix.lv2-git' 'chowmatrix.lv2-git')
depends=('git' 'alsa-lib' 'libxcursor' 'libxinerama' 'libxrandr' 'freeglut' 'jack' 'xsimd')
makedepends=()
source=("$pkgname::git+https://github.com/Chowdhury-DSP/ChowMatrix"
        "git+https://github.com/lv2-porting-project/JUCE.git"
        "git+https://github.com/Chowdhury-DSP/chowdsp_utils.git"
        "git+https://github.com/ffAudio/foleys_gui_magic.git"
        )
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         )

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
  git config submodule.Plugin/foleys_gui_magic.url "${srcdir}"/chowdsp_utils
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
  cp -r build/ChowMatrix_artefacts/LV2/ChowMatrix.lv2 "$pkgdir"/usr/lib/lv2/
}
