# Maintainer: anex
# Contributor: Sevenseven
# Contributor: Ner0

pkgname=qbittorrent-qt5-git
pkgver=.5529
pkgrel=1
pkgdesc="A bittorrent client written in C++ / Qt5 using the good libtorrent library"
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org/"
license=('GPL')
depends=('qt5-base' 'libtorrent-rasterbar')
makedepends=('boost' 'which' 'git' 'libtorrent-rasterbar')
optdepends=('python: needed for search')
conflicts=('qbittorrent' 'qbittorrent-git')
provides=('qbittorrent')
install=qbittorrent.install
source=('git://github.com/qbittorrent/qBittorrent.git')
md5sums=('SKIP')

pkgver() {
  cd qBittorrent
  echo $(cat version.pri | grep -o '[0-9]..*[0-9]').$(git rev-list --count master)
}

prepare() {
 # Spoof uTorrent [ change to 'yes' ]
  _utspoof='no'

  if [ $_utspoof = 'yes' ]; then
    sed -i 's/\"qBittorrent\ \"VERSION/\"uTorrent\/3300\(29677\)\"/' \
    qBittorrent/src/qtlibtorrent/qbtsession.cpp
  fi
}

build() {
  cd qBittorrent
  ./configure --prefix=/usr --with-qt5
  qmake-qt5
}

package() {
  cd qBittorrent
  make INSTALL_ROOT="$pkgdir/" install
}
