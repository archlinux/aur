# $Id$
# Maintainer: Bram Swenson <bram@craniumisajar.com>
# https://github.com/scottdraves/electricsheep

_pkgname=electricsheep
pkgname=${_pkgname}-git
pkgref=92b063720552e862e3912539b8243a707e0fac9c
pkgzip=${pkgref}.zip
pkgurl="https://github.com/scottdraves/electricsheep/archive/${pkgzip}"
pkgver=3.0.2.git.${pkgref}
pkgrel=1
pkgdesc="Electric Sheep is a collaborative abstract artwork founded by Scott Draves. (gold sheep supported!)"
arch=('x86_64')
url="http://gold.electricsheep.org/about"
license=('GPL')
depends=('curl' 'flam3' 'ffmpeg' 'lua51' 'libgtop' 'boost-libs' 'freeglut' 'glee' 'wxgtk2')
makedepends=('boost' 'mesa' 'glu' 'tinyxml' 'git')
optdepends=('xscreensaver: to use electricsheep with xscreensaver')
provides=('electricsheep')
conflicts=('electricsheep' 'electricsheep-svn')
source=(${pkgurl})
sha512sums=('28200b152689b9fbdfd1b3b12891a5fabad89b2b282387fe961212a0e8f2623cd61fc664366b914584063b2eec1e208ea7ea1994f398647fdd2e28a5cf3c7611')

prepare() {
  pushd "${srcdir}/${_pkgname}-${pkgref}/client_generic"
    sed -i -e 's/av_close_input_file( m_pFormatContext )/avformat_close_input( \&m_pFormatContext )/' ContentDecoder/ContentDecoder.cpp
    sed -i -e 's/AM_PROG_CC_STDC/AC_PROG_CC/' configure.ac
    sed -i '12 i\
#include <cstdio>' Common/Singleton.h
    mkdir m4

    sed -e 's|\[lua5.1\]|\[lua51\]|g' -i configure.ac
  popd
}

build() {
  pushd "${srcdir}/${_pkgname}-${pkgref}/client_generic"
    ./autogen.sh
    CPPFLAGS+=" -I/usr/include/lua5.1" ./configure --prefix=/usr
    sed -i 's|-I /usr/include/libavutil||' MSVC/SettingsGUI/Makefile
    make CXXFLAGS+="-DUSE_NEW_FFMPEG_API=1 -lpthread" GLEE_LIBS="-lGLee"
  popd
}

package() {
  pushd "${srcdir}/${_pkgname}-${pkgref}/client_generic"
    make DESTDIR="${pkgdir}" install
    install -D -m644 menu-entries/ElectricSheep.desktop.kde "${pkgdir}/usr/share/kde4/services/ScreenSavers/electricsheep.desktop"
    install -D -m644 Runtime/logo.png "${pkgdir}/usr/share/icons/electricsheep.png"
  popd
}
