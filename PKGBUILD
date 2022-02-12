# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on community/qbittorrent by Antonio Rojas <arojas@archlinux.org>

# pkgbase=qbittorrent-git
# pkgname=(qbittorrent-git qbittorrent-nox-git)
pkgbase=qbittorrent-git
pkgname=$pkgbase
pkgver=4.4.0rc1.r164.g78eaa49cd
pkgrel=1
arch=(x86_64)
url='https://www.qbittorrent.org'
license=(custom GPL)
depends=(libtorrent-rasterbar qt6-base)
makedepends=(git cmake boost qt6-tools qt6-svg)
optdepends=('python: needed for torrent search tab')
source=("$pkgbase::git+https://github.com/qbittorrent/qBittorrent.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgbase

  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $pkgbase \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT6=ON
  cmake --build build

  # cmake -B build-nox -S $pkgbase \
  #   -DCMAKE_INSTALL_PREFIX=/usr \
  #   -DQT6=ON \
  #   -DGUI=OFF \
  #   -DSYSTEMD=ON
  # cmake --build build-nox
}

package_qbittorrent-git() {
  pkgdesc='An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar (development version)'
  depends+=(qt6-svg hicolor-icon-theme)
  conflicts=('qbittorrent')
  provides=('qbittorrent')

  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgbase/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}

# package_qbittorrent-nox-git() {
#   pkgdesc='An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar, w/o gui (development version)'
#   conflicts=('qbittorrent-nox')
#   provides=('qbittorrent-nox')

#   DESTDIR="$pkgdir" cmake --install build-nox
#   install -Dm644 $pkgbase/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
# }
