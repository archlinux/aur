# Maintainer: Milk Brewster < milk on freenode >
# Maintainer: Lukas Sabota <lukas _at_ lwsabota _dot_ com>
# Contributer: Lukas Sabota <lukas _at_ lwsabota _dot_ com>
pkgname=sid-vst-git
_gitbase=SID
pkgver=r42.5a457bf
pkgrel=1
pkgdesc="Emulates MOS Technology SID audio chip (used in Commodore 64) as a VST"
arch=('i686' 'x86_64')
url="http://socalabs.com/"
license=('LGPL')
groups=('socalabs-vst-suite')
depends=('mesa' 'ttf-ms-fonts')
makedepends=('git')
source=('SID::git+https://github.com/FigBug/SID.git'
  'dRowAudio::git+https://github.com/FigBug/drowaudio.git#commit=3a1e6eb75681b166c055c501a2ed4a8df8a44df0'
  'slCommon::git+https://github.com/FigBug/slCommon.git#commit=b49d31c4f2f131506fe5ac53f2ac6e47b3ee109b'
  'gin::git+https://github.com/FigBug/Gin.git'
  'JUCE::git+https://github.com/WeAreROLI/JUCE.git#tag=5.3.2'
  'plugin_sdk::git+https://github.com/TurnipHat/plugin_sdk.git#commit=bcbef199f4dd78b883aebd6477cc104dad850e1b')
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$_gitbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitbase"
  # Workaround for SSH-only configured submodule remotes
  cd modules
  rm -rf dRowAudio slCommon
  ln -s ../../slCommon ./

  cd "$srcdir/$_gitbase"
  mv ../JUCE/modules/* plugin/JuceLibraryCode/.
  ln -s ../dRowAudio/module/dRowAudio plugin/JuceLibraryCode/dRowAudio
  ln -s ../gin/modules/gin plugin/JuceLibraryCode/gin
  pwd
  mv ../plugin_sdk/vstsdk2.4 modules/plugin_sdk
}

build() {
  cd "$srcdir/$_gitbase/plugin/Builds/LinuxMakefile"
  make
}

package() {
  install -D -m644 "$srcdir/$_gitbase/plugin/Builds/LinuxMakefile/build/$_gitbase.so" "$pkgdir/usr/lib/vst/$_gitbase.so"
}
