# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=gibsonclient-git
pkgver=r29.2bd52b0
pkgrel=1
pkgdesc='Client for Gibson - a high efficiency, tree based memory cache server.'
arch=(i686 x86_64)
url='http://gibson-db.in/'
license=(BSD)
makedepends=(git cmake)
source=(git://github.com/evilsocket/libgibsonclient
        git://github.com/antirez/linenoise)
sha1sums=('SKIP'
          'SKIP')

pkgver() {
  cd libgibsonclient
  # repo does not have any git tags yet
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd libgibsonclient

  # libgison uses git submodule, handle this
  git submodule init
  git config -f .gitmodules 'submodule.src/linenoise.url' "$srcdir/linenoise"
  git submodule update

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd libgibsonclient
  make install DESTDIR="$pkgdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
