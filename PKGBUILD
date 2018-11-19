# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>

pkgname=brogue
pkgver=1.7.5
pkgrel=1
pkgdesc="A 26-level dungeon crawl to the Amulet of Yendor."
arch=('i686' 'x86_64')
url="http://sites.google.com/site/broguegame/"
license=('AGPL3')
depends=('libtcod-151')
install=brogue.install
source=("https://sites.google.com/site/broguegame/brogue-$pkgver-linux-amd64.tbz2"
        'brogue.sh')
md5sums=('6bbd27b1a8a21caf40900130b806dedc'
         '9de3fa32ba7fe562b0224417eaea5c26')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i '/^CFLAGS=*/a CFLAGS+=-I/usr/include/libtcod-1.5.1' Makefile
  sed -i 's/-ltcod/-l:libtcod.so.1.5.1 -lSDL -lm/g' Makefile

  # todo, fix sources to use /usr/share directly and remove brogue.sh

  make clean
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  _dest_dir="$pkgdir/usr/share/$pkgname"
  mkdir -p "$_dest_dir/fonts"
  chown -R :games "$_dest_dir"
  chmod -R g+rw "$_dest_dir"

  install -Dm755 bin/brogue "$_dest_dir"
  install -Dm755 bin/keymap "$_dest_dir"
  install -Dm644 bin/fonts/*.png "$_dest_dir"/fonts/ 
  #install -Dm644 brogue.desktop "$pkgdir/usr/share/applications/brogue.desktop"
  install -T -D -m 755 "$srcdir/brogue.sh" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
