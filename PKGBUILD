# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=electricsheep
pkgver=3.0.2
pkgrel=2
_gitcommit=1c4af20b384d19c6844083845004e8f467c9ce39
pkgdesc='Screensaver that realize the collective dream of sleeping computers from all over the internet'
url='http://community.electricsheep.org/'
arch=('x86_64')
license=('GPL')
depends=('curl' 'flam3' 'ffmpeg' 'lua51' 'libgtop' 'boost-libs' 'freeglut' 'glee' 'wxgtk2')
makedepends=('boost' 'mesa' 'glu' 'tinyxml')
optdepends=('xscreensaver: to use electricsheep with xscreensaver')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/scottdraves/electricsheep/archive/${_gitcommit}.tar.gz)
sha256sums=('1b33414d05f1b611224192c6956bb1ef6d9f2cef530e3fd0b8b48aa812a58a0b')

prepare() {
  cd ${pkgname}-${_gitcommit}/client_generic
  sed -i -e 's/av_close_input_file( m_pFormatContext )/avformat_close_input( \&m_pFormatContext )/' ContentDecoder/ContentDecoder.cpp
  sed -i -e 's/AM_PROG_CC_STDC/AC_PROG_CC/' configure.ac
  sed -i '12 i\
#include <cstdio>' Common/Singleton.h
  install -d m4
  sed -e 's|\[lua5.1\]|\[lua51\]|g' -i configure.ac
  ./autogen.sh
}

build() {
  cd ${pkgname}-${_gitcommit}/client_generic
  CPPFLAGS+=" -I/usr/include/lua5.1" ./configure --prefix=/usr
  sed -i 's|-I /usr/include/libavutil||' MSVC/SettingsGUI/Makefile
  make CXXFLAGS+="-DUSE_NEW_FFMPEG_API=1" GLEE_LIBS="-lGLee" LDFLAGS+="-lpthread"
}

package() {
  cd ${pkgname}-${_gitcommit}/client_generic
  make DESTDIR="${pkgdir}" install
  install -Dm 644 menu-entries/ElectricSheep.desktop.kde "${pkgdir}/usr/share/kde4/services/ScreenSavers/electricsheep.desktop"
  install -Dm 644 Runtime/logo.png "${pkgdir}/usr/share/icons/electricsheep.png"
}

# vim: ts=2 sw=2 et:
