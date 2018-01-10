# Maintainer:
# Contributor: Michał Szymański <smiszym at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>

pkgname=rezerwar
pkgver=0.4.2
pkgrel=4
pkgdesc="Puzzle game like the known tetromino and average pipe game"
arch=('i686' 'x86_64')
url="https://tamentis.com/projects/rezerwar"
license=('BSD')
depends=('sdl_mixer')
makedepends=('gendesk' 'imagemagick')
source=("https://tamentis.com/projects/rezerwar/files/rezerwar-$pkgver.tar.gz"
        "rezerwar.ico::https://github.com/tamentis/rezerwar/raw/master/data/gfx/icons/icon_32x32.ico")
sha256sums=('a93ca501803c2fdac0fb695d9a1eeed45807307316d28d3eb8abac8849fcaf02'
            'ea9f71b5f0c2c60491ad1ea3e4f253162c1d02dd4781806546b82f514d9dd09d')

prepare() {
  gendesk -f -n --pkgname=$pkgname --pkgdesc="$pkgdesc"
  convert rezerwar.ico rezerwar.png
  sed '/^$/q' $pkgname-$pkgver/src/rezerwar.h > LICENSE
}

build() {
  cd $pkgname-$pkgver
  TARGET_BIN=/usr/bin \
  TARGET_DATA=/usr/share/rezerwar \
  TARGET_DOC=/usr/share/rezerwar/doc \
  ./configure
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 ../rezerwar.desktop "$pkgdir"/usr/share/applications/rezerwar.desktop
  install -Dm644 ../rezerwar.png "$pkgdir"/usr/share/pixmaps/rezerwar.png
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
