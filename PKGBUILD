# Maintainer: Alexey Andreyev <aa13q@ya.ru>

pkgname=qt5-multimedia-plugin-ffmpeg
pkgver=0.1
pkgrel=1
pkgdesc="A Qt Multimedia Plugin to get ffmpeg video/audio playback in the Qt Multimedia framework."
arch=('i686' 'x86_64')
url="https://github.com/hdijkema/qtmultimedia-plugin-ffmpeg"
license=('LGPLv3')
depends=('qt5-multimedia' 'ffmpeg' 'sdl2')
makedepends=('sed')
source=(https://github.com/hdijkema/qtmultimedia-plugin-ffmpeg/archive/main.zip)
md5sums=('SKIP')

build() {
   cd $srcdir/qtmultimedia-plugin-ffmpeg-main
   lrelease-qt5 ffmpeg-plugin.pro
   sed -i 's/INCLUDEPATH += ffmpeg/INCLUDEPATH += ffmpeg\nCONFIG += link_pkgconfig\nPKGCONFIG += libavcodec libavformat libavutil libavdevice libswscale libswresample\nLIBS += -lavcodec -lavformat -lavutil -lswscale -lswresample/g' ffmpeg/ffmpeg.pri
   qmake-qt5 QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS" PREFIX=/usr
   make
}

package() {
   cd $srcdir/qtmultimedia-plugin-ffmpeg-main
   make INSTALL_ROOT=$pkgdir install
}
