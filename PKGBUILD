# Contributor: Pieter Goetschalckx <3.14.e.ter at gmail dot com>
# Contributors: Det, goetzc, Ner0, Lari Tikkanen, oke3, Flamelab, WAntilles

pkgname=smplayer-git
pkgver=24.5.0.10283.r3.gc817337
pkgrel=1
pkgdesc='Media player with built-in codecs that can play virtually all video and audio formats'
arch=('x86_64')
url='https://www.smplayer.info/'
license=('GPL')
depends=('glibc' 'qt5-base' 'qt5-declarative' 'mpv' 'libx11' 'zlib' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'git')
optdepends=('smplayer-themes-svn: icon themes collection'
            'smplayer-skins-svn: skin themes collection'
            'smtube-svn: browse and play YouTube videos'
            'youtube-dl: YouTube videos and streaming'
            'yt-dlp: YouTube videos and streaming, Alternative to youtube-dl'
            'mplayer: backend for video playback'
            'mpv: alternative modern backend')
provides=('smplayer')
conflicts=('smplayer')
source=($pkgname::git+https://github.com/smplayer-dev/smplayer.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed '/gzip -9/d' -i Makefile
}

build() {
  cd $pkgname
  export CXXFLAGS="${CXXFLAGS} ${CPPFLAGS} -Wno-error"
  make PREFIX=/usr \
    DOC_PATH="\\\"/usr/share/doc/smplayer\\\"" \
    QMAKE_OPTS=DEFINES+=NO_DEBUG_ON_CONSOLE \
    CFLAGS_EXTRA="${CFLAGS} ${CPPFLAGS} ${LDFLAGS} -Wno-error"
}

package() {
  cd $pkgname
  make DOC_PATH=/usr/share/doc/smplayer \
    DESTDIR="${pkgdir}" PREFIX=/usr -j1 install
}

