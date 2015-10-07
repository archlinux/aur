# Maintainer: Score_Under <seejay 11@gmail com>
# Configuration:
#####

build_pyc=false
build_pyo=true
remove_py=false
remove_help=false

#####
options=(!strip)  # Don't strip libs because there aren't any; this wastes time
DOC_DIRS=(opt/hydrus/help)

pkgname=hydrus
pkgver=176
pkgrel=1
pkgdesc="Danbooru-like image tagging and searching system for the desktop"
arch=(any)
license=(WTFPL)
url=http://hydrusnetwork.github.io/hydrus/
depends=(python2 wxpython opencv python2-beautifulsoup4 python2-yaml
         hsaudiotag python2-pypdf2 python2-pafy python2-lz4 python2-numpy
         python2-twisted python2-pillow python2-potr python2-flvlib python2-socks
         python2-psutil python2-send2trash)
makedepends=(git)
optdepends=('ffmpeg: show duration and other information on video thumbnails'
            'miniupnpc: automatic port forwarding'
            'desktop-file-utils: to add Hydrus to your desktop environment menus')
source=("${pkgname}::git+https://github.com/hydrusnetwork/${pkgname}.git#commit=5ffe0f73ca6eae5fcbd53828b3fb401250423690"
        paths-in-opt.patch
        running-the-server.patch
        hydrus-client
        hydrus-server
        hydrus.desktop)
sha256sums=('SKIP'
            'd316105494d07fa0a46483089e707ccd24f157d7b72b6925ae6e1b47085940a5'
            '8b47161065328dab0c9de293a8a2b4343e5c5fab464eb301f028758fb2666c6d'
            'b2bf66b1068969e9598742d5c128cb04fd609512b0cff0ad5e25ecb6cdd35678'
            '5fd3eb69bb5f9a0b88d7c1b25abdee42aa2b2fc5e1690635f60ed1f47848c46b'
            '9ba3942ac1a37f6b39c98ae6592573402bf08d8376f64554d0696c0fed6fd0e2')
install=hydrus.install

prepare() {
  cd "$pkgname"
  patch -Np1 -i ../paths-in-opt.patch
  patch -Np1 -i ../running-the-server.patch

  # Fix permissions
  chmod a-x include/*.py

  # Remove strange file
  rm -f "include/pyconfig.h"

  # Remove unit tests
  rm -f "include/Test"*.py
  rm -rf "static/testing"
}

build() {
  cd "$pkgname"

  # Compile .py files
  $build_pyc && python2 -m compileall .
  $build_pyo && python2 -OO -m compileall .
}

package() {
  cd "$pkgname"

  # Create /opt/hydrus and copy hydrus sources to there
  install -m755 -d "${pkgdir}/opt/hydrus"
  cp -r help include static client.pyw server.py "${pkgdir}/opt/hydrus/"

  # Remove .py files
  $remove_py && find "${pkgdir}/opt/hydrus" -name '*.py' -delete

  # Remove help
  $remove_help && rm -rf "${pkgdir}/opt/hydrus/help"

  # Fix permissions
  chown -R root:root "${pkgdir}/opt/hydrus"

  # Create and populate /opt/hydrus/bin
  install -d -m755 "${pkgdir}/opt/hydrus/bin"
  ln -s /usr/bin/upnpc "${pkgdir}/opt/hydrus/bin/upnpc_linux"
  ln -s /usr/bin/ffmpeg "${pkgdir}/opt/hydrus/bin/ffmpeg"

  # Install hydrus-client and hydrus-server executables
  install -d -m755 "${pkgdir}/usr/bin"
  install -m755 ../hydrus-{client,server} "${pkgdir}/usr/bin/"

  # Install license files
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  # Install .desktop shortcut
  install -d -m755 "${pkgdir}/usr/share/applications"
  install -m644 ../hydrus.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
