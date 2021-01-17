# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
pkgname=chowtapemodel.lv2-git
pkgdesc="Physical modelling signal processing for analog tape recording."
pkgver=r165.7aebad0
pkgrel=1
arch=(x86_64)
url="https://github.com/jatinchowdhury18/AnalogTapeModel"
license=(GPL)
groups=(lv2plugins)
conflicts=('chowtapemodel.lv2' 'chowtapemodel.lv2-bin')
provides=('chowtapemodel.lv2' 'chowtapemodel.lv2-bin')
depends=('git' 'alsa-lib' 'libxcursor' 'libxinerama' 'libxrandr' 'freeglut' 'jack')
makedepends=()
source=("$pkgname::git+https://github.com/jatinchowdhury18/AnalogTapeModel"
        "git+https://github.com/jatinchowdhury18/JUCE.git"
        "git+https://github.com/ffAudio/foleys_gui_magic.git")
md5sums=('SKIP'
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
  git config submodule.Plugin/Juce.url "${srcdir}"/JUCE
  git config submodule.Plugin/foleys_gui_magic.url "${srcdir}"/foleys_gui_magic
  git submodule sync --recursive
  git submodule update

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
  cp -r Plugin/Builds/LinuxMakefile/build/CHOWTapeModel.lv2 "$pkgdir"/usr/lib/lv2/
}
