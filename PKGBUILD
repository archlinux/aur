# Maintainer : catskillmarina <catskillmarina @ gmail.com>

pkgname=wanderer
pkgver=3.2
pkgrel=1.1
pkgdesc='Wanderer is a game like Boulderdash, Repton, XOR. (wanderer)'
arch=('any')
url="http://e271.net/~marina/wanderer"
license=('GPL')
depends=('ncurses' 'gzip')
source=("http://e271.net/~marina/$pkgname-$pkgver.tar.gz"
        'patch-edit_c'
        'patch-m_c'
        'patch-wanderer_6'
       )
md5sums=('83ca326c57a43c4d6cb3f7c7ef4008a1'
         '8825bce23b746231cdfc5d05d1b331bc'
         'e80004f41532fefc039aed0f76bcd176'
         '239aa9ce75296e8de220664b8f1d9cbb'
)

prepare() {
  cd "$pkgname-$pkgver"
  pwd
  sed -e "s|/usr/local/share/wanderer/screens|/usr/share/wanderer/screens|" \
      -e "s|/* #define NO_ENCRYPTION |#define NO_ENCRYPTION |" -i $srcdir/$pkgname-$pkgver/wand_head.h
  sed -e 's|char \*malloc();|\/\* char \*malloc(); \*\/|' -i $srcdir/$pkgname-$pkgver/monsters.c
  sed -e 's|char \*malloc();|\/\* char \*malloc(); \*\/|' -i $srcdir/$pkgname-$pkgver/convert.c
  patch -p0 < $srcdir/patch-edit_c
  patch -p0 < $srcdir/patch-m_c
  patch -p0 < $srcdir/patch-wanderer_6
  # remove spurious binary #
  rm wanderer
}

build(){
  cd "$pkgname-$pkgver"
  make
  pwd
}
  
package() {
  cd "$pkgname-$pkgver"
  pwd
  install -m 0755 -d -o root -g games "$pkgdir/usr/share/wanderer"
  install -m 0755 -d -o root -g games "$pkgdir/usr/share/wanderer/screens"
  install -m 0644 -o root -g games screens/* "$pkgdir/usr/share/wanderer/screens/"

  install -dm775 $pkgdir/var/games/
  # FS#43414: /var/games should be owned by root:games.
  # copied from nethack
  chown -R root:games $pkgdir/var/games/

  install -Dm2755 wanderer "$pkgdir/usr/bin/wanderer"
  # install -Dm655 wandererscores "$pkgdir/var/games/wandererscores
  chown root:games "$pkgdir/usr/bin/wanderer"
  chmod g+s "$pkgdir/usr/bin/wanderer"
  install -Dm644 wanderer.6 "$pkgdir/usr/share/man/man6/wanderer.6"
}

