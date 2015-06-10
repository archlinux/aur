pkgname=fusedav-git
_gitname=fusedav
pkgver=fd90308
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A webdav filesystem based on FUSE"
url="https://github.com/pantheon-systems/fusedav/"
license=('GPL')
depends=('fuse' 'neon' 'leveldb' 'systemd' 'jemalloc' 'uriparser')
makedepends=('git' 'autoconf')

source=('git://github.com/pantheon-systems/fusedav.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}


build() {
  cd $_gitname

  autoreconf --force --install --symlink
  LEVELDB_LIBS='-L/usr/lib -lleveldb' LEVELDB_CFLAGS='-I/usr/include' ./configure --prefix=/usr
  make
}


package() {
  cd $_gitname

  make DESTDIR="$pkgdir/" install

  # seems that 'make install' doesn't install docs and man pages
  # so copy them manually

  mkdir -p "$pkgdir/usr/share/doc/$pkgname-$pkgver"
  cp doc/README doc/README.html doc/style.css "$pkgdir/usr/share/doc/$pkgname-$pkgver/"

  mkdir -p "$pkgdir/usr/share/man/man1"
  cp doc/fusedav.1 "$pkgdir/usr/share/man/man1/"
  gzip "$pkgdir/usr/share/man/man1/fusedav.1"
}

# vim:set ts=2 sw=2 et:
