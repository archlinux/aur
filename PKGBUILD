# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jkkyll Wu <adaptee at gmail [dot] com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

_branch1=$(git ls-remote -t --refs https://github.com/qbittorrent/qBittorrent.git | awk '{print $2}' | LC_ALL=C sort -bfV | tail -n1 | sed 's/[^0-9,.]*//g')
_stable_branch=$(_branch2=${_branch1//./_}; _branch3="${_branch2%*_*}"; printf "v%s_x" "$_branch3")
#_stable_branch="v4_0_x"
pkgname=qbittorrent-stable-git
pkgver=4.2.1.r0.g118af0353
pkgrel=1
pkgdesc="An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar. Built from source."
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org"
license=('custom' 'GPL')
depends=('libtorrent-rasterbar' 'qt5-base' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'openssl' 'zlib')
makedepends=('boost' 'git' 'qt5-tools')
optdepends=('python: needed for torrent search tab')
provides=('qbittorrent')
conflicts=('qbittorrent')
install=${pkgname%-*-*}.install
source=("${pkgname%-*-*}"::"git+https://github.com/qbittorrent/qBittorrent.git#branch=${_stable_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-*-*}"
  git describe --long --tags | sed 's/^release-//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/${pkgname%-*-*}"
  ./configure --prefix=/usr
  make -j"$(nproc)"
}

package() {
  cd "$srcdir/${pkgname%-*-*}"
  make -j"$(nproc)" INSTALL_ROOT="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
