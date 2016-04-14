# Maintainer: Score_Under <seejay 11@gmail com>
options=(!strip docs)  # Don't strip libs because there aren't any, don't strip docs because they're packaged separately
DOC_DIRS=(opt/hydrus/help)

pkgbase=hydrus
pkgname=(hydrus hydrus-docs hydrus-sources)
pkgver=201
pkgrel=1
pkgdesc="Danbooru-like image tagging and searching system for the desktop"
arch=(any)
license=(WTFPL)
url=http://hydrusnetwork.github.io/hydrus/
depends=(python2 wxpython opencv python2-beautifulsoup4 python2-yaml
         hsaudiotag python2-pypdf2 python2-pafy python2-lz4 python2-numpy
         python2-twisted python2-pillow python2-potr python2-flvlib python2-socks
         python2-psutil python2-send2trash python2-lxml python2-requests)
makedepends=(git)
optdepends=('ffmpeg: show duration and other information on video thumbnails'
            'miniupnpc: automatic port forwarding'
            'desktop-file-utils: to add Hydrus to your desktop environment menus')
source=("${pkgbase}::git+https://github.com/hydrusnetwork/${pkgbase}.git#commit=505db9306e339ecb4ebccedefe79f9c6a55ee8fb"
        paths-in-opt.patch
        hydrus-client
        hydrus-server
        hydrus.desktop)
sha256sums=('SKIP'
            'ecf6e3614fbd6c687c79672fdebd3ee1f536dbb3210e7202c5629f28d52ce10e'
            'b2bf66b1068969e9598742d5c128cb04fd609512b0cff0ad5e25ecb6cdd35678'
            '5fd3eb69bb5f9a0b88d7c1b25abdee42aa2b2fc5e1690635f60ed1f47848c46b'
            '9ba3942ac1a37f6b39c98ae6592573402bf08d8376f64554d0696c0fed6fd0e2')

prepare() {
  cd "$pkgbase"
  patch -Np1 -i ../paths-in-opt.patch

  # Fix permissions
  chmod a-x include/*.py

  # Remove strange file
  rm -f "include/pyconfig.h"

  # Remove unit tests
  rm -f "include/Test"*.py
  rm -rf "static/testing"
}

build() {
  cd "$pkgbase"

  msg 'Compiling .py files...'
  python2 -OO -m compileall -fq .
}

package_hydrus() {
  install=hydrus.install

  cd "$pkgbase"

  # Create /opt/hydrus and copy hydrus files to there
  install -m755 -d "${pkgdir}/opt/hydrus"
  cp -r include static client.pyw server.py "${pkgdir}/opt/hydrus/"

  # Remove .py files
  find "${pkgdir}/opt/hydrus/include" -name '*.py' -delete

  # Create and populate /opt/hydrus/bin
  install -d -m755 "${pkgdir}/opt/hydrus/bin"
  ln -s /usr/bin/upnpc "${pkgdir}/opt/hydrus/bin/upnpc_linux"
  ln -s /usr/bin/ffmpeg "${pkgdir}/opt/hydrus/bin/ffmpeg"

  # Install hydrus-client and hydrus-server executables
  install -d -m755 "${pkgdir}/usr/bin"
  install -m755 ../hydrus-{client,server} "${pkgdir}/usr/bin/"

  # Install .desktop shortcut
  install -d -m755 "${pkgdir}/usr/share/applications"
  install -m644 ../hydrus.desktop "${pkgdir}/usr/share/applications/${pkgbase}.desktop"
}

package_hydrus-docs() {
  depends=()
  optdepends=()
  pkgdesc="Danbooru-like image tagging and searching system for the desktop (documentation)"

  cd "$pkgbase"

  # Create /opt/hydrus and copy hydrus help to there
  install -m755 -d "${pkgdir}/opt/hydrus"
  cp -r help "${pkgdir}/opt/hydrus/"

  # Install license files
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgbase}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/"
  install -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgbase}/"
}

package_hydrus-sources() {
  depends=()
  optdepends=('hydrus: The sources are not usable without extra files from the hydrus package')
  pkgdesc="Danbooru-like image tagging and searching system for the desktop (sources only)"

  cd "$pkgbase"

  # Create /opt/hydrus and copy hydrus sources to there
  install -m755 -d "${pkgdir}/opt/hydrus"
  cp -r include "${pkgdir}/opt/hydrus/"

  # Remove .pyo files
  find "${pkgdir}/opt/hydrus/include" -name '*.pyo' -delete
}
