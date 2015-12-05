# Maintainer: Jon Wilson <bugs@pandorica.net>
# Contributor: Spyros Stathopoulos <foucault.online[at]gmail[dot]com>
# Contributor: Andrwe Lord Weber <lord-weber-andrwe [at] andrwe [dot] org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky19-lua-nv
_pkgname=conky
pkgver=1.9.0
pkgrel=9
pkgdesc="An advanced system monitor for X based on torsmo with lua and nvidia enabled"
arch=('i686' 'x86_64')
url="http://conky.sourceforge.net/"
license=('custom')
replaces=('torsmo' 'conky')
conflicts=('conky')
provides=('conky' 'conky-lua')
depends=('alsa-lib' 'libxml2' 'curl' 'cairo' 'wireless_tools' 'libxft' 'glib2'
         'libxdamage' 'imlib2' 'lua51' 'tolua++')
makedepends=('pkgconfig' 'libxnvctrl' 'docbook2x' 'docbook-xml' 'docbook-xsl')
optdepends=('nvidia: for GT4xx and newer GPUs',
  'nvidia-340xx: for G8x, G9x, GT2xx GPUS',
  'nvidia-304xx: for GeForce 6/7 GPUs')
backup=(etc/conky/conky.conf etc/conky/conky_no_x11.conf)
source=("https://github.com/brndnmtthws/${_pkgname}/archive/${pkgver}.tar.gz"
        'fix_build.patch')
md5sums=('b13f2c7d52e18d94bfbfcd5157406db7'
         '1cdccf70c8e4acb691a0dab785d5f6fc')
install="conky-lua-nv.install"

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  sed -i '/#include <curl\/types.h>/d' ${srcdir}/${_pkgname}-${pkgver}/src/ccurl_thread.c
  patch -p1 -i ../fix_build.patch
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./autogen.sh
  LUA51_LIBS='-llua5.1 -lm' LUA51_CFLAGS='-I/usr/include/lua5.1' \
  LUA_LIBS='-llua5.1 -lm' LUA_CFLAGS="-I/usr/include/lua5.1" \
  CPPFLAGS="${CXXFLAGS}" LIBS="${LDFLAGS}" ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-wlan \
              --enable-rss \
              --enable-ibm \
              --enable-imlib2 \
              --enable-lua \
              --enable-lua-cairo \
              --enable-lua-imlib2 \
              --enable-ibm \
              --enable-nvidia
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
