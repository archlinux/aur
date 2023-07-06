# Maintainer: Jonathan Neidel <aur@jneidel.com>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: gnomeye <gnomeye at gmail dot com>

_srcname=ts
pkgname=task-spooler
pkgver=1.0.2
pkgrel=4
pkgdesc="Queue up tasks from the shell for batch execution"
arch=('x86_64')
url="https://viric.name/soft/ts/"
license=('GPL2')
source=(https://viric.name/soft/$_srcname/$_srcname-$pkgver.tar.gz)
sha256sums=('f73452aed80e2f9a7764883e9353aa7f40e65d3c199ad1f3be60fd58b58eafec')

prepare() {
  # Rename program from ts to tsp.
  # File /usr/bin/ts is owned by package community/moreutils.
  cd $_srcname-$pkgver
  sed -i 's/\bTS\b/TSP/g;s/\bts\b/tsp/g;s/tsp\([.-].\)/ts\1/g' ts.1
  sed -i 's/\bts\b/tsp/g;s/ts2/tsp2/g;s/alias ts/alias tsp/' TRICKS
  sed -i 's/"ts /"tsp /g' execute.c list.c
  sed -i 's/(ts)/(tsp)/g' list.c
  sed -i 's/ ts / tsp /g' main.c
}

build() {
  make -C $_srcname-$pkgver
}

package() {
  install -Dm644 $_srcname-$pkgver/TRICKS -t "$pkgdir/usr/share/doc/$pkgname"
  make -C $_srcname-$pkgver PREFIX="$pkgdir/usr" install

  mv "$pkgdir"/usr/bin/{ts,tsp}
  mv "$pkgdir"/usr/share/man/man1/{ts,tsp}.1
}
