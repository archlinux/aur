# Maintainer: Beini <bane@iki.fi>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-git
pkgver=1.10.1.r18.g2fab2d3
pkgrel=3
pkgdesc='Lightweight system monitor for X'
url='http://conky.sourceforge.net/'
license=('BSD' 'GPL')
arch=('i686' 'x86_64')
makedepends=('cmake' 'docbook2x' 'docbook-xml' 'man-db' 'git')
depends=('glib2' 'curl' 'lua' 'wireless_tools' 'libxml2' 'libxft' 'libxdamage' 'imlib2')
provides=("conky")
conflicts=('conky')
source=('conky::git+https://github.com/brndnmtthws/conky.git')
sha1sums=('SKIP')

options=('!strip' 'debug')

pkgver() {
  cd conky
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd conky

  cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D MAINTAINER_MODE=ON \
    -D BUILD_CURL=ON \
    -D BUILD_XDBE=ON \
    -D BUILD_IMLIB2=ON \
    -D BUILD_RSS=ON \
    -D BUILD_WEATHER_METAR=ON \
    -D BUILD_WEATHER_XOAP=ON \
    -D BUILD_WLAN=ON \
    -D CMAKE_INSTALL_PREFIX=/usr \
    .

  make
}

package() {
  cd conky
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/conkyrc.vim
  install -Dm644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
}
