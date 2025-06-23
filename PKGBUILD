# Maintainer: Jonathan Neidel <aur@jneidel.com>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: gnomeye <gnomeye at gmail dot com>
# Contributor: Antoine Lubineau <antoine@lubignon.info>

_srcname=ts
pkgname=task-spooler
pkgver=1.0.3
pkgrel=5
pkgdesc="Queue up tasks from the shell for batch execution"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://viric.name/soft/ts/"
license=('GPL-2.0-or-later')
source=(https://viric.name/soft/$_srcname/$_srcname-$pkgver.tar.gz)
sha256sums=('fa833311543dc535b60cb7ab83c64ab5ee31128dbaaaa13dde341984e542b428')

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
  make CFLAGS="-ansi" -C $_srcname-$pkgver
}

package() {
  install -Dm644 $_srcname-$pkgver/TRICKS -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 $_srcname-$pkgver/Changelog -t "$pkgdir/usr/share/doc/$pkgname"
  make -C $_srcname-$pkgver PREFIX="$pkgdir/usr" install

  mv "$pkgdir"/usr/bin/{ts,tsp}
  mv "$pkgdir"/usr/share/man/man1/{ts,tsp}.1
}
