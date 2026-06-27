# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Pieter Goetschalckx <3.14.e.ter at gmail dot com>
# Contributors: Det, goetzc, Ner0, Lari Tikkanen, oke3, Flamelab, WAntilles

pkgname=smplayer-git
pkgver=25.6.0.r49.gf626556
pkgrel=1
pkgdesc='Media player with built-in codecs that can play virtually all video and audio formats'
arch=(x86_64)
url=https://www.smplayer.info
license=(GPL-2.0-or-later)
depends=(glibc qt5-base qt5-declarative mpv libx11 zlib gcc-libs hicolor-icon-theme)
makedepends=(git qt5-tools)
optdepends=(
  'smplayer-themes: icon themes collection'
  'smplayer-skins: skin themes collection'
  #'smtube: browse and play youtube videos'
  'youtube-dl: youtube videos and streaming'
  'yt-dlp: youtube videos and streaming'
  'mplayer: alternative multimedia engine')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/smplayer-dev/smplayer.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags --abbrev=7 --match 'v*.*.*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # Make build reproducible, we compress ourselves
  sed '/gzip -9/d' -i $pkgname/Makefile
}

build() {
  # Patch for newer compiler
  #export CFLAGS+=' -w -Wno-error'
  #export CXXFLAGS+=' -w -Wno-error'
  export CFLAGS+=' -Wno-error=unused-but-set-variable'
  export CXXFLAGS+=' -Wno-overloaded-virtual -Wno-deprecated-enum-enum-conversion'

  export CXXFLAGS="${CXXFLAGS} ${CPPFLAGS}"
  make -C $pkgname \
    PREFIX=/usr \
    DOC_PATH="\\\"/usr/share/doc/smplayer\\\"" \
    QMAKE_OPTS=DEFINES+=NO_DEBUG_ON_CONSOLE \
    CFLAGS_EXTRA="${CFLAGS} ${CPPFLAGS} ${LDFLAGS}" \
    all
}

package() {
  make -C $pkgname \
    PREFIX=/usr \
    DOC_PATH=/usr/share/doc/smplayer \
    DESTDIR="${pkgdir}" \
    install
}
