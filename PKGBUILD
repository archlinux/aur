# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=torrential-git
pkgver=1.1.0.r15.gd950ce8
pkgrel=1
pkgdesc="Download torrents in style with this speedy, minimalist torrent client designed for Pantheon Shell"
arch=(i686 x86_64)
url="https://github.com/davidmhewitt/torrential"
license=(GPL2)
depends=(libgranite.so libunity libevent libnatpmp libb64 dht miniupnpc libutp)
makedepends=(git cmake vala-0.42)
provides=(torrential)
conflicts=(torrential)
source=("git+https://github.com/davidmhewitt/torrential.git"
        "torrential-transmission::git+https://github.com/davidmhewitt/transmission.git#branch=2.9x-torrential")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  git submodule init
  git config 'submodule.transmission.url' "${srcdir}/torrential-transmission"
  git submodule update

  install -d build
}

build() {
  cd "${pkgname%-git}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname%-git}/build"
  make DESTDIR="${pkgdir}" install
  ln -s /usr/bin/com.github.davidmhewitt.torrential "$pkgdir/usr/bin/torrential"
}

