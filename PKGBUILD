# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Ner0, Sevenseven

pkgname=qbittorrent-git
pkgver=3.2.0.r17.2c1d76c
pkgrel=1
pkgdesc="A bittorrent client written in C++ / Qt4 using the good libtorrent library (development version)"
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org/"
license=('custom' 'GPL')
depends=('qt4' 'libtorrent-rasterbar' 'qjson')
makedepends=('boost' 'git')
optdepends=('python: needed for torrent search tab')
conflicts=('qbittorrent' 'qbittorrent-qt5')
provides=('qbittorrent' 'qbittorrent-qt4')
install=qbittorrent.install
source=(${pkgname%-*}::"git+https://github.com/qbittorrent/qBittorrent.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  _tag=$(git tag -l | sort -r | head -n1 | tr -cd 0-9.)
  _rev=$(git rev-list --count release-${_tag}..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.%s" "$_tag" "$_rev" "$_hash"
}

build() {
  cd ${pkgname%-*}

  ./configure --prefix=/usr --with-qjson=system
  make
}

package() {
  cd ${pkgname%-*}

  make INSTALL_ROOT="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
