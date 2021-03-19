# Maintainer: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Beini <bane@iki.fi>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-git
pkgver=1.12.1.r14.g33aa5060
pkgrel=1
pkgdesc="Lightweight system monitor for X (from git)"
arch=('x86_64')
url="https://github.com/brndnmtthws/conky"
license=('BSD' 'GPL')
depends=('alsa-lib' 'imlib2' 'libxdamage' 'libxft' 'libxinerama'
         'libxml2' 'librsvg' 'lua53' 'tolua++' 'wireless_tools')
makedepends=('cmake' 'docbook2x' 'docbook-xsl' 'git' 'man-db')
provides=('conky')
conflicts=('conky')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd conky
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd conky

  cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D MAINTAINER_MODE=ON \
    -D RELEASE=ON \
    -D BUILD_X11=ON \
    -D BUILD_CURL=ON \
    -D BUILD_XDBE=ON \
    -D BUILD_RSS=ON \
    -D BUILD_WEATHER_METAR=ON \
    -D BUILD_IMLIB2=ON \
    -D BUILD_WLAN=ON \
    -D BUILD_LUA_CAIRO=ON \
    -D BUILD_LUA_IMLIB2=ON \
    -D BUILD_LUA_RSVG=ON \
    -D BUILD_XSHAPE=ON \
    -D BUILD_DOCS=ON \
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
