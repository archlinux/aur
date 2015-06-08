# Maintainer: Jon Wilson <bugs@pandorica.net>
# Contributor: Spyros Stathopoulos <foucault.online[at]gmail[dot]com>
# Contributor: Andrwe Lord Weber <lord-weber-andrwe [at] andrwe [dot] org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-lua-nv
_pkgname=conky
pkgver=1.9.0
pkgrel=7
pkgdesc="An advanced system monitor for X based on torsmo with lua and nvidia enabled"
arch=('i686' 'x86_64')
url="http://conky.sourceforge.net/"
license=('custom')
replaces=('torsmo' 'conky')
conflicts=('conky')
provides=('conky' 'conky-lua')
depends=('alsa-lib' 'libxml2' 'curl' 'cairo' 'wireless_tools' 'libxft' 'glib2' 'libxdamage' 'imlib2' 'lua51' )
makedepends=('docbook2x' 'libxnvctrl' 'tolua++' 'perl-xml-libxml')
optdepends=('nvidia: for GT4xx and newer GPUs',
  'nvidia-340xx: for G8x, G9x, GT2xx GPUS',
  'nvidia-304xx: for GeForce 6/7 GPUs')
backup=(etc/conky/conky.conf etc/conky/conky_no_x11.conf)
source=(http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.bz2)
      md5sums=('d3de615f43aadc98d555e05ad9e902c2')
install="conky-lua-nv.install"

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  LUA51_LIBS='-llua5.1 -lm' LUA51_CFLAGS='-I/usr/include/lua5.1' \
  LUA_LIBS='-llua5.1 -lm' LUA_CFLAGS="-I/usr/include/lua5.1" \
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-wlan \
              --enable-curl \
              --enable-rss \
              --enable-ibm \
              --enable-imlib2 \
              --enable-lua \
              --enable-lua-cairo \
              --enable-lua-imlib2 \
              --enable-ibm \
              --enable-weather-xoap \
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
