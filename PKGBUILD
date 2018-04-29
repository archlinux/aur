# Maintainer:

pkgname=usokoban
pkgver=0.0.13
pkgrel=2
pkgdesc='GTK+ sokoban clone'
arch=('i686' 'x86_64')
url='http://sokoban.ws/usokoban/usokoban.php'
license=('GPL3')
depends=('gtk2' 'sqlite')
noextract=("usokoban-$pkgver-src.tar.gz"
           "usokoban-$pkgver-i386.b.tar.gz")
source=("http://sokoban.ws/usokoban/usokoban-$pkgver-src.tar.gz"
        "http://sokoban.ws/usokoban/usokoban-$pkgver-i386.b.tar.gz")
sha256sums=('91826be91c44fc0fbbedbc90e4bc1b9596d656d53876f092334c01f51603b53c'
            'c684f886d7627040dbd596743def9422861b50b1baca24c0a2534255e14fa96d')

prepare() {
  mkdir -p source
  bsdtar -xf usokoban-$pkgver-src.tar.gz -C source

  mkdir -p binary
  bsdtar -xf usokoban-$pkgver-i386.b.tar.gz -C binary

  sed -i 's|^Exec=.*$|Exec=/usr/bin/usokoban|' binary/usokoban.desktop
  sed -i 's|^Icon=.*$|Icon=/usr/share/pixmaps/usokoban.png|' binary/usokoban.desktop
}

build() {
  cd source

  gcc $CPPFLAGS $CFLAGS -o usokoban $LDFLAGS \
    base.c settings.c sokoban.c sokoban2.c solver.c savitch.c solution.c \
    $(pkg-config --cflags --libs gtk+-2.0 libpcre sqlite3) -lz -lgthread-2.0
}

package() {
  install -Dm755 source/usokoban "$pkgdir"/usr/bin/usokoban

  install -d "$pkgdir"/usr/share/games/usokoban
  install -m644 binary/{skin*.png,*.txt,README} "$pkgdir"/usr/share/games/usokoban/

  install -Dm644 binary/usokoban.desktop "$pkgdir"/usr/share/applications/usokoban.desktop
  install -Dm644 binary/usokoban.png "$pkgdir"/usr/share/pixmaps/usokoban.png
}
