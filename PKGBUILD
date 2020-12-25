# Maintainer: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Beini <bane@iki.fi>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-git
pkgver=1.11.6.r6.g16be0e15
pkgrel=1
pkgdesc="Lightweight system monitor for X (from git)"
arch=('x86_64')
url="https://github.com/brndnmtthws/conky"
license=('BSD' 'GPL')
depends=('glib2' 'imlib2' 'libpulse' 'libxdamage' 'libxft' 'libxinerama'
         'libxml2' 'libxnvctrl' 'lua' 'wireless_tools')
makedepends=('cmake' 'docbook2x' 'docbook-xsl' 'git' 'man-db')
provides=('conky')
conflicts=('conky')
source=("git+$url.git")
sha256sums=('SKIP')
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
    -D BUILD_DOCS=ON \
    -D BUILD_WLAN=ON \
    -D BUILD_XDBE=ON \
    -D BUILD_XSHAPE=ON \
    -D BUILD_IMLIB2=ON \
    -D BUILD_CURL=ON \
    -D BUILD_RSS=ON \
    -D BUILD_NVIDIA=ON \
    -D BUILD_WEATHER_METAR=ON \
    -D BUILD_PULSEAUDIO=ON \
    -D BUILD_JOURNAL=ON \
    -D CMAKE_INSTALL_PREFIX=/usr \
    .

  make
}

package() {
  cd conky
  make DESTDIR="$pkgdir" install

  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 COPYING
  install -Dm644 extras/vim/syntax/conkyrc.vim \
    "$pkgdir"/usr/share/vim/vimfiles/syntax/conkyrc.vim
  install -Dm644 extras/vim/ftdetect/conkyrc.vim \
    "$pkgdir"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
}
