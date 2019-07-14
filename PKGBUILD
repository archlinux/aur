# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>
# Contributors: Det, goetzc, Ner0, Lari Tikkanen, oke3, Flamelab, WAntilles

pkgname=smplayer-svn
pkgver=19.5.0.r9225M
pkgrel=1
pkgdesc='Media player with built-in codecs that can play virtually all video and audio formats'
arch=('x86_64')
url='https://www.smplayer.info/'
license=('GPL')
depends=('qt5-script' 'hicolor-icon-theme' 'libx11' 'zlib' 'gcc-libs')
makedepends=('qt5-tools' 'subversion')
optdepends=('smplayer-themes-svn: icon themes collection'
            'smplayer-skins-svn: skin themes collection'
            'smtube-svn: browse and play YouTube videos'
            'youtube-dl: YouTube videos and streaming'
            'mplayer: backend for video playback'
            'mpv: alternative modern backend')
provides=('smplayer')
conflicts=('smplayer')
source=($pkgname::svn+https://subversion.assembla.com/svn/smplayer/smplayer/trunk/)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo $(grep -m1 'Version' smplayer.spec | cut -d " " -f9).r$(svnversion)
}

prepare() {
  cd $pkgname
  sed '/gzip -9/d' -i Makefile
}

build() {
  cd $pkgname
  export CXXFLAGS="${CXXFLAGS} ${CPPFLAGS}"
  make PREFIX=/usr \
    DOC_PATH="\\\"/usr/share/doc/smplayer\\\"" \
    QMAKE_OPTS=DEFINES+=NO_DEBUG_ON_CONSOLE \
    CFLAGS_EXTRA="${CFLAGS} ${CPPFLAGS} ${LDFLAGS}"
}

package() {
  cd $pkgname
  make DOC_PATH=/usr/share/doc/smplayer \
    DESTDIR="${pkgdir}" PREFIX=/usr -j1 install
}

