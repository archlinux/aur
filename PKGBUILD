# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jkkyll Wu <adaptee at gmail [dot] com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

_stable_branch="v3_3_x"
pkgname=qbittorrent-stable-git
pkgver=3.3.7.r2.g4da05e5
pkgrel=1
pkgdesc="An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar. Built from source."
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org"
license=('custom' 'GPL')
depends=('libtorrent-rasterbar' 'qt5-base' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('boost' 'git' 'qt5-tools')
optdepends=('python: needed for torrent search tab')
provides=('qbittorrent')
conflicts=('qbittorrent')
install=${pkgname%-*-*}.install
source=("${pkgname%-*-*}"::"git+https://github.com/qbittorrent/qBittorrent.git#branch=${_stable_branch}"
'https://github.com/evsh/qBittorrent/commit/b5775b467ba4ebda1366b8ae0ccf664cb4292272.patch')
sha256sums=('SKIP'
            '30084803e4609c004252f8fb346d1406ae0ad394d5efda68c74db0af2efbe437')

pkgver() {
  cd $srcdir/${pkgname%-*-*}
  git describe --long --tags | sed 's/^release-//;s/-/.r/;s/-/./'
}

prepare() {
 cd "$srcdir/${pkgname%-*-*}"
 ## Fix bug in which log is flooded with "Network configuration has changed" messages
 patch -Np1 -i "${srcdir}/b5775b467ba4ebda1366b8ae0ccf664cb4292272.patch"
}

build() {
  cd $srcdir/${pkgname%-*-*}
  ./configure --prefix=/usr
  make -j$(nproc)
}

package() {
  cd $srcdir/${pkgname%-*-*}
  make INSTALL_ROOT="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
