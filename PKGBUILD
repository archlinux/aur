# $Id$
# Maintainer: Bram Swenson <bram@craniumisajar.com>
# https://github.com/scottdraves/electricsheep

_pkgname=electricsheep
pkgname=${_pkgname}-git
pkgref=92b063720552e862e3912539b8243a707e0fac9c
pkgzip=${pkgref}.zip
pkgurl="https://github.com/scottdraves/electricsheep/archive/${pkgzip}"
pkgver=3.0.2.git.20221208.37ba0fd
pkgrel=1
pkgdesc="Electric Sheep is a collaborative abstract artwork founded by Scott Draves. (gold sheep supported!)"
arch=('x86_64')
url="http://gold.electricsheep.org/about"
license=('GPL')
depends=('curl' 'flam3' 'ffmpeg' 'lua51' 'libgtop' 'boost-libs' 'freeglut' 'glee' 'wxgtk3')
makedepends=('boost' 'mesa' 'glu' 'tinyxml' 'git')
optdepends=('xscreensaver: to use electricsheep with xscreensaver')
provides=('electricsheep')
conflicts=('electricsheep' 'electricsheep-svn')
#source=("$_pkgname::git+https://github.com/scottdraves/electricsheep.git") # Temporarily disable.
source=("$_pkgname::git+https://github.com/Rogach/electricsheep.git#branch=fix-ffmpeg5") # Temporarily use patch-fork branch, until pulled into upstream
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}"/"${_pkgname}"/
     COMMIT="$(cat .git/refs/heads/master | cut -c1-7)"
     DATE="$(date +%Y%m%d)"
     echo "3.0.2.git.$DATE.$COMMIT" # Will updated this further to reflect current major.minor.rev. but it hasnt updated in so long now, there is not much of a point. | note2: source doesnt properly tag and makepkg creates duplicates
}

prepare() {
  pushd "${srcdir}/${_pkgname}/client_generic"
    sed -i -e 's/av_close_input_file( m_pFormatContext )/avformat_close_input( \&m_pFormatContext )/' ContentDecoder/ContentDecoder.cpp
    sed -i -e 's/AM_PROG_CC_STDC/AC_PROG_CC/' configure.ac
    sed -i '12 i\
#include <cstdio>' Common/Singleton.h
    if [ ! -e m4 ]; then
      mkdir m4
    else
      rm -r m4
      mkdir m4
    fi
        
    sed -e 's|\[lua5.1\]|\[lua51\]|g' -i configure.ac
  popd
}

build() {
  pushd "${srcdir}/${_pkgname}/client_generic"
    ./autogen.sh
    CPPFLAGS+=" -DGL_GLEXT_PROTOTYPES -I/usr/include/lua5.1" CFLAGS+=" -DGL_GLEXT_PROTOTYPES" ./configure --prefix=/usr
    sed -i 's|-I /usr/include/libavutil||' MSVC/SettingsGUI/Makefile
    make CXXFLAGS+="-DUSE_NEW_FFMPEG_API=1 -lpthread" GLEE_LIBS="-lGLee"
  popd
}

package() {
  pushd "${srcdir}/${_pkgname}/client_generic"
    make DESTDIR="${pkgdir}" install
    install -D -m644 menu-entries/ElectricSheep.desktop.kde "${pkgdir}/usr/share/kde4/services/ScreenSavers/electricsheep.desktop"
    install -D -m644 Runtime/logo.png "${pkgdir}/usr/share/icons/electricsheep.png"
  popd
}
