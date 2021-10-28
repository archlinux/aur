# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=qbittorrent-nox-git
pkgver=4.4.0beta3.r102.g559a97953
pkgrel=1
pkgdesc="A bittorrent client programmed in C++ / Qt that uses libtorrent-rasterbar (w/o GUI)"
arch=('i686' 'x86_64')
url="https://www.qbittorrent.org/"
license=('GPL' 'custom')
depends=('glibc' 'libtorrent-rasterbar' 'qt5-base')
makedepends=('git' 'boost' 'cmake' 'qt5-tools')
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

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DGUI=OFF \
    -DSYSTEMD=ON \
    ./
  make -C "_build"
}

package() {
  cd "qBittorrent"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/qbittorrent-nox"
}
