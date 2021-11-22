# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
pkgname=chowtapemodel.lv2-git
pkgdesc="Physical modelling signal processing for analog tape recording."
pkgver=r258.d5b3109
pkgrel=1
arch=(x86_64)
url="https://github.com/jatinchowdhury18/AnalogTapeModel"
license=(GPL)
groups=(lv2plugins)
conflicts=('chowtapemodel.lv2' 'chowtapemodel.lv2-bin')
provides=('chowtapemodel.lv2' 'chowtapemodel.lv2-bin')
depends=('git' 'alsa-lib' 'libxcursor' 'libxinerama' 'libxrandr' 'freeglut' 'jack' 'xsimd')
makedepends=()
source=("$pkgname::git+https://github.com/jatinchowdhury18/AnalogTapeModel")
md5sums=('SKIP')

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
  # git config submodule.Plugin/Juce.url "${srcdir}"/JUCE
  # git config submodule.Plugin/foleys_gui_magic.url "${srcdir}"/foleys_gui_magic
  git submodule update --init --recursive
  # git submodule sync --recursive
  # git submodule update

  rm -rf Juce/VST2_SDK
}

build() {
	cd "$pkgname"/Plugin
  cmake -Bbuild
  cmake --build build/ --config Release
}

package() {
	cd "$pkgname"
  mkdir -p "$pkgdir"/usr/lib/lv2/
  cp -r Plugin/build/CHOWTapeModel_artefacts/LV2/CHOWTapeModel.lv2 "$pkgdir"/usr/lib/lv2/
}
