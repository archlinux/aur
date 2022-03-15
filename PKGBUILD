pkgname=fusedav-git
_gitname=fusedav
pkgver=v2.0.51+1031
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A webdav filesystem based on FUSE"
url="https://github.com/pantheon-systems/fusedav/"
license=('GPL')
depends=('libsystemd' 'expat' 'fuse' 'curl' 'glib2' 'leveldb' 'jemalloc' 'uriparser')
makedepends=('git' 'autoconf')

source=('git+https://github.com/pantheon-systems/fusedav.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}


build() {
  cd $_gitname
  echo $pkgver > VERSION

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
