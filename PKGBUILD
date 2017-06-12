pkgname=fusedav-git
_gitname=fusedav
pkgver=v2.0.26+618
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A webdav filesystem based on FUSE"
url="https://github.com/pantheon-systems/fusedav/"
license=('GPL')
depends=('libsystemd' 'expat' 'fuse' 'curl' 'glib2' 'leveldb' 'jemalloc' 'uriparser')
makedepends=('git' 'autoconf')

source=('git://github.com/pantheon-systems/fusedav.git' 'libsystemd.patch')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}


build() {
  cd $_gitname
  patch -p1 < ${srcdir}/libsystemd.patch

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
  cp README.md "$pkgdir/usr/share/doc/$pkgname-$pkgver/"
}

# vim:set ts=2 sw=2 et:
md5sums=('SKIP'
         'fe087994e80a346d773b0a721f5fd771')
