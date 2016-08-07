# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: jose riha, Christoph Zeiler, nut543 and Dany Martineau

pkgname=cdogs
pkgver=0.6.2
pkgrel=1
pkgdesc='Enhanced SDL port of DOS arcade game C-Dogs (aka "Cyberdogs 2")'
arch=('i686' 'x86_64')
url="http://cxong.github.io/cdogs-sdl/"
license=('GPL2')
depends=('sdl2_mixer' 'sdl2_image')
makedepends=('cmake')
source=(cdogs-$pkgver.tar.gz::"https://github.com/cxong/cdogs-sdl/archive/${pkgver}-2.tar.gz")
sha256sums=('16ea6f1042c6b5e6b9f7f80dbfc112fcb3554bfd5f267326d4bb09eaae500553')

prepare() {
  cd $pkgname-sdl-$pkgver-2

  # disable -Werror (aborts build on mere warnings)
  sed 's| -Werror||' -i CMakeLists.txt
}

build() {
  cd $pkgname-sdl-$pkgver-2

  cmake ./ -DCDOGS_DATA_DIR="/usr/share/cdogs/" -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd $pkgname-sdl-$pkgver-2
  # folders
  install -d "$pkgdir"/usr/{bin,share/{cdogs,doc}}
  # binaries
  install -m755 src/cdogs-sdl{,-editor} "$pkgdir"/usr/bin
  # data
  cp -rup data doc dogfights graphics missions music sounds cdogs_icon.bmp "$pkgdir"/usr/share/cdogs
  # doc
  ln -s /usr/share/cdogs/doc "$pkgdir"/usr/share/doc/cdogs
  install -m644 README.md "$pkgdir"/usr/share/cdogs/doc
  # .desktop entries
  install -Dm644 build/linux/cdogs-icon.48.png "$pkgdir"/usr/share/pixmaps/cdogs-sdl.png
  install -Dm644 build/linux/cdogs-sdl.desktop "$pkgdir"/usr/share/applications/cdogs-sdl.desktop
}
