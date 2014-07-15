# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=openbor-git
pkgver=r473.afa9362
pkgrel=1
pkgdesc="An open source, moddable fighting game engine (aka Beats of Rage), rofl0r's optimized fork"
arch=('i686' 'x86_64')
url="https://github.com/rofl0r/openbor"
license=('BSD')
depends=('bash' 'sdl_gfx' 'libvorbis' 'libpng')
makedepends=('git' 'yasm' 'imagemagick' 'glu')
optdepends=('libgl: OpenGL video mode')
conflicts=('openbor-svn')
install=openbor.install
source=(openbor::'git+https://github.com/rofl0r/openbor.git'
        'openbor.desktop'
        'openbor.sh')
sha256sums=('SKIP'
            '92c2c8fa5727ddf76421bdb54589d898679b12f4201931f2861b7fa1b613097b'
            'fc584ea761ba1307e4568c2ffb78731b848d27ed231bdc2149ece96304a55d81')

pkgver() {
  cd openbor
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # convert icon
  convert -resize 48x48 openbor/resources/OpenBOR_Icon_128x128.png openbor.png
}

build() {
  cd openbor
  make

  # build tools
  cd tools/borpak
  ./build-linux.sh
}

package() {
  cd openbor

  # launcher + binaries
  install -Dm755 ../openbor.sh "$pkgdir"/usr/bin/openbor
  install -Dm755 OpenBOR "$pkgdir"/usr/bin/OpenBOR.real
  install -Dm755 tools/borpak/borpak "$pkgdir"/usr/bin/borpak
  # doc
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
  # .desktop entry
  install -Dm644 ../openbor.desktop "$pkgdir"/usr/share/applications/openbor.desktop
  install -Dm644 ../openbor.png "$pkgdir"/usr/share/pixmaps/openbor.png
  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
