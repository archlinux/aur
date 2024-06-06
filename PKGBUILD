# Maintainer: yustin <#archlinux-proaudio@libera.chat>
# Contributor: Milk Brewster < milk on freenode >
# Contributer: Lukas Sabota <lukas _at_ lwsabota _dot_ com>

pkgname=sid-git
_gitbase=SID
pkgver=r124.fe0647d
pkgrel=2
pkgdesc="Emulates MOS Technology SID audio chip (used in Commodore 64) as a VST, VST3, lv2, Standalone"
arch=( 'i686' 'x86_64' )
url="http://socalabs.com/"
license=( 'GPL-3.0-only' )
groups=( 'socalabs-vst-suite' )
depends=( 'curl' 'gcc-libs' 'freetype2' 'alsa-lib' 'glibc' )
makedepends=( 'git' 'cmake' 'ninja' )
source=( 'git+https://github.com/FigBug/SID.git'
         'git+https://github.com/FigBug/drowaudio.git'
         'git+https://github.com/WeAreROLI/JUCE.git'
         'git+https://github.com/FigBug/Gin.git'
         'git+https://github.com/TurnipHat/plugin_sdk.git'
       )
md5sums=( 'SKIP' 
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
        )

pkgver() {
  cd "$srcdir/$_gitbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitbase"
  IFS=$'\n'
  path=( $( grep path .gitmodules ))
  url=( $( grep url .gitmodules ))
  npath=( $( for x in ${!path[@]}; do echo ${path[$x]##*/}; done ))
  nurl=( $( for x in ${!url[@]}; do x=$( echo ${url[$x]%%.git} ); echo ${x##*/}; done ))

  git submodule init
  for x in ${!npath[@]}
  do
    git config submodule.modules/${npath[$x]}.url "$srcdir/${nurl[$x]}"
  done
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/$_gitbase"
  cmake --preset ninja-gcc
  cmake --build --preset ninja-gcc --config Release
}

package() {
  cd $srcdir/$_gitbase/Builds/ninja-gcc/SID_artefacts/Release/VST3
  find . -type f -exec install -Dm 644 {} $pkgdir/usr/lib/vst3/{} \;

  install -Dm644 $srcdir/$_gitbase/Builds/ninja-gcc/SID_artefacts/Release/VST/libSID.so $pkgdir/usr/lib/vst/libSID.so

  cd $srcdir/$_gitbase/Builds/ninja-gcc/SID_artefacts/Release/LV2
  find . -type f -exec install -Dm 644 {} $pkgdir/usr/lib/lv2/{} \;

  install -Dm644 $srcdir/$_gitbase/Builds/ninja-gcc/SID_artefacts/Release/Standalone/SID $pkgdir/usr/bin/SID
}
