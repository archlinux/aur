# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=qbittorrent-nox-git
pkgver=4.0.3.r372.g55b9b8fc9
pkgrel=1
pkgdesc="A bittorrent client programmed in C++ / Qt that uses libtorrent-rasterbar (w/o GUI)"
arch=('i686' 'x86_64')
url="https://www.qbittorrent.org/"
license=('GPL' 'custom')
depends=('glibc' 'libtorrent-rasterbar' 'qt5-base')
makedepends=('git' 'boost' 'qt5-tools')
provides=('qbittorrent-nox')
conflicts=('qbittorrent-nox')
source=("git+https://github.com/qbittorrent/qBittorrent.git")
sha256sums=('SKIP')


pkgver() {
  cd "qBittorrent"

  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/release-//p}')
  _rev=$(git rev-list --count release-$_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}

build() {
  cd "qBittorrent"

  ./bootstrap.sh

  mkdir -p "_build" && cd "_build"
  ../configure --prefix="/usr" --disable-gui --enable-systemd
  make
}

package() {
  cd "qBittorrent"

  make -C "_build" INSTALL_ROOT="$pkgdir" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/qbittorrent-nox/COPYING"
}
