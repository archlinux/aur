# Maintainer: Jon Wilson <bugs@pandorica.net>
# Contributor: Spyros Stathopoulos <foucault.online[at]gmail[dot]com>
# Contributor: Andrwe Lord Weber <lord-weber-andrwe [at] andrwe [dot] org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-lua-nv
_pkgname=conky
pkgver=1.10.0
pkgrel=4
pkgdesc="An advanced system monitor for X based on torsmo with lua and nvidia enabled"
arch=('i686' 'x86_64')
url="https://github.com/brndnmtthws/conky"
license=('custom')
replaces=('torsmo' 'conky')
conflicts=('conky')
provides=('conky' 'conky-lua')
depends=('alsa-lib' 'libxml2' 'curl' 'cairo' 'wireless_tools' 'libxft' 'glib2' 'libxdamage' 'imlib2' 'lua51' )
makedepends=('docbook2x' 'libxnvctrl' 'tolua++' 'perl-xml-libxml' 'docbook-xml' 'docbook-xsl')
optdepends=('nvidia: for GT4xx and newer GPUs',
  'nvidia-340xx: for G8x, G9x, GT2xx GPUS',
  'nvidia-304xx: for GeForce 6/7 GPUs')
source=(https://github.com/brndnmtthws/${_pkgname}/archive/v${pkgver}.tar.gz
        ascii.patch
        ipv6.patch
        curl.patch)
sha1sums=('d5863420150150002947180d0ee96c9ef56c43b1'
          '96cdbc38e8706c8a3120601983df5c7265716128'
          'a0899973483d0ad664b60e58b3ba899ba88712af'
          '1c066b439a1e7166d733fb710faa9bf08b81ce4c')
options=('!strip' 'debug')
install=('conky-lua-nv.install')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ../ascii.patch
  patch -p1 -i ../ipv6.patch
  patch -p1 -i ../curl.patch

  cd cmake
  # -lXext must come *after* -lXNVCtrl
  sed -i -e \
    's/set(conky_libs ${conky_libs} ${XNVCtrl_LIB})/set(conky_libs ${XNVCtrl_LIB} ${conky_libs})/' \
    ConkyPlatformChecks.cmake
  sed -i -e \
    's/pkg_search_module(LUA REQUIRED lua5.2 lua-5.2 lua>=5.1 lua5.1 lua-5.1)/pkg_search_module(LUA REQUIRED lua=5.1 lua5.1 lua-5.1)/' \
    ConkyPlatformChecks.cmake
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D MAINTAINER_MODE=ON \
    -D BUILD_CURL=ON \
    -D BUILD_LUA_RSVG=ON \
    -D BUILD_LUA_CAIRO=ON \
    -D BUILD_LUA_IMLIB2=ON \
    -D BUILD_IMLIB2=ON \
    -D BUILD_RSS=ON \
    -D BUILD_WEATHER_METAR=ON \
    -D BUILD_WEATHER_XOAP=ON \
    -D BUILD_WLAN=ON \
    -D BUILD_NVIDIA=ON \
    -D BUILD_XDBE=ON \
    -D CMAKE_INSTALL_PREFIX=/usr \
    .

  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
  install -D -m644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/conkyrc.vim
  install -D -m644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
}

# vim:ts=2:et:sw=2
