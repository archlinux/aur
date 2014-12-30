# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Absolosba <absolosba at gmail dot com>
# Contributor: Ben Reedy <thebenj88 *AT* gmail *DOT* com>

pkgname=nxengine
pkgver=1.0.0.6
pkgrel=1
pkgdesc="A clone/engine-rewrite of the classic jump-and-run platformer Cave Story/Doukutsu Monogatari"
arch=('i686' 'x86_64')
url="http://nxengine.sourceforge.net/"
license=('GPL3')
depends=('sdl_ttf')
source=("http://nxengine.sourceforge.net/dl/nx-src-${pkgver//./}.tar.bz2"
        "http://www.cavestory.org/downloads/cavestoryen.zip"
        "nxengine.desktop"
        "nxengine.sh"
        "nxengine.png")
sha256sums=('cf9cbf15dfdfdc9936720a714876bb1524afbd2931e3eaa4c89984a40b21ad68'
            'aa87fa30bee9b4980640c7e104791354e0f1f6411ee0d45a70af70046aa0685f'
            'e9fa26e7e893d557f7805965e8d60ae7d4478d3b4ebb0d1e50bcfa232046cf0b'
            'a77974864a17e69881e14567a899318b32c8b26cf54e9df3bf47803750afe91f'
            'd6d8866939c10342bd3feebef311648586bed38f0390acbe16fd42f5240ff4e7')
install=nxengine.install

prepare() {
  # small patch to not include a useless makedep on libdrm
  sed 's|platform/Linux/vbesync.o ||g' -i nx/Makefile
}

build() {
  make -C nx
}

package() {
  # launcher
  install -Dm755 nxengine.sh "$pkgdir"/usr/bin/nxengine

  # .desktop entry
  install -Dm644 nxengine.desktop "$pkgdir"/usr/share/applications/nxengine.desktop
  install -Dm644 nxengine.png "$pkgdir"/usr/share/pixmaps/nxengine.png

  # executable + data
  cd nx
  install -Dm755 nx "$pkgdir"/usr/share/nxengine/nx
  install -m644 font.ttf smalfont.bmp sprites.sif tilekey.dat "$pkgdir"/usr/share/nxengine
  cd ../CaveStory
  cp -r Doukutsu.exe data "$pkgdir"/usr/share/nxengine
}
