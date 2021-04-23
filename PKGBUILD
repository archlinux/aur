# Maintainer: Roboron <robertoms258 at gmail dot com>

pkgname=simutrans-svn
pkgver=r9741
pkgrel=1
pkgdesc="Transportation simulation game - Nightly build from SVN"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
depends=('gcc-libs' 'zstd' 'zlib' 'sdl2_mixer' 'hicolor-icon-theme' 'freetype2' 'miniupnpc' 'fluidsynth')
makedepends=('subversion' 'pkgconf' 'autoconf' 'make')
optdepends=('soundfont-fluid: Default MIDI soundfont for music'
			'soundfont-realfont: Alternative higher quality MIDI soundfont'
            'simutrans-pak32.comic: Lowest resolution graphics set for Simutrans'
            'simutrans-pak48.excentrique: Low resolution graphics set for Simutrans, with an eccentric theme'
            'simutrans-pak64: Low resolution graphics set for Simutrans'
            'simutrans-pak64.classic: Low resolution graphics set for Simutrans, resembling the original'
            'simutrans-pak64.contrast: Minimalistic, low resolution graphics set for Simutrans'
            'simutrans-pak64.german: Low resolution graphics set for Simutrans, with a german theme'
            'simutrans-pak64.ho-scale: Resolution graphics set for Simutrans for model train fans'
            'simutrans-pak64.japan: Low resolution graphics set for Simutrans, with a japan theme'
            'simutrans-pak64.nippon: An alternative japanese low resolution graphics set for Simutrans'
            'simutrans-pak64.scifi: Low resolution graphics set for Simutrans, with a SciFi theme'
            'simutrans-pak96.comic: Medium resolution graphics set for Simutrans, with a comic style'
            'simutrans-pakhd: Hand-drawn graphics set for Simutrans'
            'simutrans-pak128: High resolution graphics set for Simutrans'
            'simutrans-pak128.britain: High resolution graphics set for Simutrans, with a british theme'
            'simutrans-pak128.cs: High resolution graphics set for Simutrans, with a czech theme'
            'simutrans-pak128.german: High resolution graphics set for Simutrans, with a german theme'
            'simutrans-pak128.japan: High resolution graphics set for Simutrans, with a japan theme'
            'simutrans-pak192.comic: Highest resolution graphics set for Simutrans')

conflicts=('simutrans')
source=(svn+svn://servers.simutrans.org/simutrans/trunk
        settings-folder.patch
        path-for-game-data.patch
        simutrans.desktop
        "How to add files and paksets.md")
sha256sums=('SKIP'
            '671398550f46525ef0dae338d9e1984bfc0e1ec36153e1c4163c8c35de240c7e'
            'cb9fda1a99d0b54f316ba5ea5b90ec658641f9a9d3b77faf981525e12ff99188'
            '99545152f5e739b7eb028152383fa10d3e3d303c99167e1c6e5a6bd7dcd00fa3'
            '52a00091a71e250205adcb3ef8b86b560a5c27429ec700c5e5242f58184d90ab')
            
prepare() {
  cd trunk

  # Adjust paths
  patch -Np0 -i ../settings-folder.patch
  patch -Np0 -i ../path-for-game-data.patch
}

build() {
  cd trunk
  autoconf
  ./configure
  make
}

package() {
  #binary
  install -Dm755 trunk/sim "$pkgdir/usr/bin/simutrans"
  
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans"
  cp -r trunk/simutrans/* "$pkgdir/usr/share/games/simutrans"
  cp -r "How to add files and paksets.md" "$pkgdir/usr/share/games/simutrans"

  #desktop file and icon
  install -Dm644 trunk/simutrans.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/simutrans.svg"
  install -Dm644 simutrans.desktop "$pkgdir/usr/share/applications/simutrans.desktop"

  #license
  install -Dm644 trunk/simutrans/license.txt "$pkgdir/usr/share/licenses/simutrans/license.txt"
  
}

pkgver() {
  cd trunk
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}
