# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: robertfoster

pkgname=torrential
pkgver=1.1.0
pkgrel=2
arch=(i686 x86_64)
pkgdesc="A simple torrent client for elementary OS"
url="https://github.com/davidmhewitt/torrential"
license=(GPL2)
depends=(libgranite.so libunity libevent libnatpmp libb64 dht miniupnpc libutp)
makedepends=(git cmake vala-0.42)
source=("git+https://github.com/davidmhewitt/torrential.git#tag=${pkgver}"
        "torrential-transmission::git+https://github.com/davidmhewitt/transmission.git#branch=2.9x-torrential")
md5sums=('SKIP'
         'SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git config 'submodule.transmission.url' "${srcdir}/torrential-transmission"
  git submodule update

  install -d build
}

build() {
  cd "$pkgname/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$pkgname/build"
  make DESTDIR=$pkgdir install
  ln -s /usr/bin/com.github.davidmhewitt.torrential "$pkgdir/usr/bin/torrential"
}

