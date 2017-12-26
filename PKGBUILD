# $Id$
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=electricsheep
pkgver=2.7b33
pkgrel=33
pkgdesc="A screensaver that realize the collective dream of sleeping computers from all over the internet"
arch=('x86_64')
url="http://community.electricsheep.org/"
license=('GPL')
depends=('curl' 'flam3' 'ffmpeg' 'lua51' 'libgtop' 'boost-libs' 'freeglut' 'glee')
makedepends=('boost' 'mesa' 'glu' 'tinyxml')
optdepends=('xscreensaver: to use electricsheep with xscreensaver')
options=('!emptydirs')
source=(https://sources.archlinux.org/other/community/${pkgname}/${pkgname}-${pkgver}.tar.xz{,.sig}
        electricsheep-no-wxgtk.patch
        electricsheep-ffmpeg30.patch)
sha1sums=('d86607d97accad8519df2a21d67253abe45f5fdd'
          'SKIP'
          'b186318902dd0abac6e72a81fa374434d7244ac3'
          'c28e8a1ad5738c56615bdb431d80eff7f9e2a554')
validpgpkeys=('5357F3B111688D88C1D88119FCF2CB179205AC90')

# source PKGBUILD && mksource
mksource() {
  [[ -x /usr/bin/svn ]] || (echo "svn not found. Install subversion." && return 1)
  _svnver=r125
  _svntrunk="http://electricsheep.googlecode.com/svn/trunk/client_generic"
  _svnmod="${pkgname}-${pkgver}"
  mkdir ${pkgname}-${pkgver}
  pushd ${pkgname}-${pkgver}
  svn co ${_svntrunk} --config-dir ./ -r ${_svnver} ${_svnmod}
  find . -depth -type d -name .svn -exec rm -rf {} \;
  (cd ${pkgname}-${pkgver} ; rm -r boost Build_guides curlTest ffmpeg InstallerMSVC \
    Launcher libpng libxml lua5.1 MacBuild RuntimeMSVC wxConfig)
  tar -cJf ../${pkgname}-${pkgver}.tar.xz ${pkgname}-${pkgver}/*
  popd
  rm -r ${pkgname}-${pkgver}
  gpg --detach-sign --use-agent -u ${GPGKEY} ${pkgname}-${pkgver}.tar.xz
}

prepare() {
  cd ${pkgname}-${pkgver}
# Do not build broken electricsheep-preferences
  patch -p0 -i "${srcdir}/electricsheep-no-wxgtk.patch"
  patch -p1 -i "${srcdir}/electricsheep-ffmpeg30.patch"

  sed -i -e 's/av_close_input_file( m_pFormatContext )/avformat_close_input( \&m_pFormatContext )/' ContentDecoder/ContentDecoder.cpp
  sed -i -e 's/AM_PROG_CC_STDC/AC_PROG_CC/' configure.ac
  sed -i '12 i\
#include <cstdio>' Common/Singleton.h
  mkdir m4

  sed -e 's|\[lua5.1\]|\[lua51\]|g' -i configure.ac
}

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
  CPPFLAGS+=" -I/usr/include/lua5.1" ./configure --prefix=/usr
  sed -i 's|-I /usr/include/libavutil||' MSVC/SettingsGUI/Makefile
  make CXXFLAGS+="-DUSE_NEW_FFMPEG_API=1" GLEE_LIBS="-lGLee"
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 menu-entries/ElectricSheep.desktop.kde "${pkgdir}/usr/share/kde4/services/ScreenSavers/electricsheep.desktop"
  install -D -m644 Runtime/logo.png "${pkgdir}/usr/share/icons/electricsheep.png"
}
