# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: jose riha, Christoph Zeiler, nut543 and Dany Martineau

pkgname=cdogs
pkgver=0.6.1
pkgrel=1
pkgdesc='Enhanced SDL port of DOS arcade game C-Dogs (aka "Cyberdogs 2")'
arch=('i686' 'x86_64')
url="http://cxong.github.io/cdogs-sdl/"
license=('GPL2')
depends=('sdl2_mixer' 'sdl2_image')
makedepends=('cmake')
source=(cdogs-$pkgver.tar.gz::"https://github.com/cxong/cdogs-sdl/archive/$pkgver.tar.gz")
sha256sums=('36035451286e3dd8af036ebfd84eb8ae4b9fa84bfc07a0bf2600cf7a78cbc167')

prepare() {
  cd $pkgname-sdl-$pkgver

  # disable -Werror (aborts build) and change data directory
  sed 's| -Werror||;s|CDOGS_DATA_DIR "../"|CDOGS_DATA_DIR "/usr/share/cdogs/"|' \
    -i CMakeLists.txt

  # change name in .desktop file
  sed 's|cdogs-sdl|cdogs|g' -i build/linux/cdogs-sdl.desktop
}

build() {
  cd $pkgname-sdl-$pkgver

  cmake ./
  make
}

package() {
  cd $pkgname-sdl-$pkgver
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
  install -Dm644 build/linux/cdogs-icon.48.png "$pkgdir"/usr/share/pixmaps/cdogs.png
  install -Dm644 build/linux/cdogs-sdl.desktop "$pkgdir"/usr/share/applications/cdogs.desktop
}
