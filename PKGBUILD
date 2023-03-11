# Maintainer: Spyros Stathopoulos <foucault.online[at]gmail[dot]com>
# Contributor: Jon Wilson <bugs@pandorica.net>
# Contributor: Andrwe Lord Weber <lord-weber-andrwe [at] andrwe [dot] org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-lua-nv
_pkgname=conky
pkgver=1.18.3
pkgrel=2
pkgdesc="An advanced system monitor for X based on torsmo with lua and nvidia enabled"
arch=('i686' 'x86_64')
url="https://github.com/brndnmtthws/conky"
license=('GPL' 'BSD')
replaces=('torsmo' 'conky')
conflicts=('conky')
provides=('conky' 'conky-lua')
depends=(
  'glibc' 'glib2' 'lua' 'wireless_tools' 'libxdamage' 'libxinerama' 'libxft' 'imlib2'
  'libxml2' 'libpulse' 'libxnvctrl' 'systemd-libs' 'ncurses' 'curl'
  libncursesw.so libXNVCtrl.so libsystemd.so libpulse.so libcurl.so
)
makedepends=('cmake' 'docbook2x' 'docbook-xsl' 'man-db' 'git' 'catch2'
             'pandoc' 'python-yaml' 'python-jinja')
optdepends=('nvidia: for GT4xx and newer GPUs',
  'nvidia-340xx: for G8x, G9x, GT2xx GPUS',
  'nvidia-304xx: for GeForce 6/7 GPUs')
source=("https://github.com/brndnmtthws/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha1sums=('5a0970f019a483f56fcc21809bba726d2ec26d8d')
options=('!strip' 'debug')
install='conky-lua-nv.install'

prepare() {
  # disable HSV gradients for now
  cd ${srcdir}/${_pkgname}-${pkgver}
  rm -r tests/catch2
  ln -s /usr/include/catch2 tests
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects" \
    -D MAINTAINER_MODE=OFF \
    -D BUILD_DOCS=ON \
    -D BUILD_IMLIB2=ON \
    -D BUILD_EXTRAS=ON \
    -D BUILD_LUA_RSVG=ON \
    -D BUILD_LUA_CAIRO=ON \
    -D BUILD_LUA_IMLIB2=ON \
    -D BUILD_WLAN=ON \
    -D BUILD_XDBE=ON \
    -D BUILD_XSHAPE=ON \
    -D BUILD_HSV_GRADIENT=ON \
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
  cd ${srcdir}/${_pkgname}-${pkgver}
  make -C build DESTDIR=${pkgdir} install
  install -D -m644 COPYING -t ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m644 build/extras/vim/syntax/conkyrc.vim -t "${pkgdir}"/usr/share/vim/vimfiles/syntax/
  install -D -m644 extras/vim/ftdetect/conkyrc.vim -t "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/
}

# vim:ts=2:et:sw=2
