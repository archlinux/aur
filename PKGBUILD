# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Contributor: shamrok <szamrok@gmail.com>

pkgname=smplayer-qt4x
pkgver=23.6.0
pkgrel=1
pkgdesc='Media player with built-in codecs that can play virtually all video and audio formats'
url='https://www.smplayer.info/'
arch=('x86_64')
license=('GPL')
depends=('glibc' 'qt4' 'mpv' 'libx11' 'zlib' 'gcc-libs' 'hicolor-icon-theme')
# makedepends=('qt4-tools')
optdepends=('smplayer-themes: icon themes collection'
            'smplayer-skins: skin themes collection'
#           'smtube: browse and play youtube videos'
            'youtube-dl: youtube videos and streaming'
            'yt-dlp: youtube videos and streaming'
            'mplayer: alternative multimedia engine')
source=(https://github.com/smplayer-dev/smplayer/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('407cecc3ec94536b739d21286d1e4c45adc5a151c935f8ee4ca999c89c121887')

prepare() {
    cd smplayer-${pkgver}
  # make build reproducible, we compress ourselves
  sed '/gzip -9/d' -i Makefile
}

build() {
    cd smplayer-${pkgver}
  export CXXFLAGS="${CXXFLAGS} ${CPPFLAGS}"
  make QMAKE=qmake-qt4 LRELEASE=lrelease-qt4 V=1 \
    PREFIX=/usr \
    DOC_PATH="\\\"/usr/share/doc/smplayer-qt4\\\"" \
    TRANSLATION_PATH="\\\"/usr/share/smplayer-qt4/translations\\\"" \
    THEMES_PATH="\\\"/usr/share/smplayer-qt4/themes\\\"" \
    SHORTCUTS_PATH="\\\"/usr/share/smplayer-qt4/shortcuts\\\"" \
    QMAKE_OPTS=DEFINES+=NO_DEBUG_ON_CONSOLE \
    CFLAGS_EXTRA="${CFLAGS} ${CPPFLAGS} ${LDFLAGS}" \
    all
}

package() {
    cd smplayer-${pkgver}
  make \
    PREFIX=/usr \
    DOC_PATH=/usr/share/doc/smplayer-qt4 \
    TRANSLATION_PATH=/usr/share/smplayer-qt4/translations \
    THEMES_PATH=/usr/share/smplayer-qt4/themes \
    SHORTCUTS_PATH=/usr/share/smplayer-qt4/shortcuts \
    DESTDIR="${pkgdir}" \
    install

  mv -v ${pkgdir}/usr/bin/smplayer{,-qt4}
}

# vim: ts=2 sw=2 et:
