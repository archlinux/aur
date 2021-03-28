# Maintainer: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Beini <bane@iki.fi>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-git
pkgver=1.12.1.r16.gbb3d66ad
pkgrel=1
pkgdesc="Lightweight system monitor for X (from git)"
url="https://github.com/brndnmtthws/conky"
license=('BSD' 'GPL')
arch=('x86_64')
makedepends=('cmake' 'docbook2x' 'docbook-xsl' 'man-db' 'git')
depends=(
  'glibc' 'glib2' 'lua' 'wireless_tools' 'libxdamage' 'libxinerama' 'libxft' 'imlib2'
  'libxml2' 'libpulse' 'libxnvctrl' 'systemd-libs' 'ncurses' 'curl'
  libncursesw.so libXNVCtrl.so libsystemd.so libpulse.so libcurl.so)
provides=('conky')
conflicts=('conky')
source=("git+https://github.com/brndnmtthws/conky.git")
sha256sums=('SKIP')

pkgver() {
  cd conky
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd conky
  cmake \
    -B build \
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
    -Wno-dev \
    -S .

  make -C build
}

package() {
  cd conky
  make -C build DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 extras/vim/syntax/conkyrc.vim -t "${pkgdir}"/usr/share/vim/vimfiles/syntax
  install -Dm 644 extras/vim/ftdetect/conkyrc.vim -t "${pkgdir}"/usr/share/vim/vimfiles/ftdetect
}
