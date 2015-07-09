# Maintainer: Score_Under <seejay 11@gmail com>
# Configuration:
#####

build_pyc=false
build_pyo=true
build_cython=false
remove_py=false
remove_help=false

#####
$build_cython || options=(!strip)  # Don't strip libs because there aren't any; this wastes time
DOC_DIRS=(opt/hydrus/help)

pkgname=hydrus
pkgver=164
pkgrel=1
pkgdesc="Danbooru-like image tagging and searching system for the desktop"
arch=(any)
license=(WTFPL)
url=http://hydrusnetwork.github.io/hydrus/
depends=(python2 wxpython opencv python2-beautifulsoup4 python2-yaml
         hsaudiotag python2-pypdf2 python2-pafy python2-lz4 python2-numpy
         python2-twisted python2-pillow python2-potr python2-flvlib python2-socks)
makedepends=(git)
$build_cython && makedepends+=(cython2 parallel)
optdepends=('ffmpeg: show duration and other information on video thumbnails'
            'miniupnpc: automatic port forwarding')
source=("${pkgname}::git+https://github.com/hydrusnetwork/${pkgname}.git#commit=c985f70a4ff49d0da8c5d73dc91d57356f9380db"
        paths-in-opt.patch
        running-the-server.patch
        cython-workarounds.patch
        hydrus-client
        hydrus-server
        hydrus.desktop)
sha256sums=('SKIP'
            'faf1bcdab469bd7bfe6616897fd355642da55c3e2b269a20d477a23d5583f75b'
            'b4cd358402ac8f225fe77a60aeb89dde88ba8ad050c5b04f11c1ffd44242e9d8'
            'fa39e8dda692e1f098170e4869b23c78cb8adcd1bc3c2c2b82616faa985a0412'
            'b2bf66b1068969e9598742d5c128cb04fd609512b0cff0ad5e25ecb6cdd35678'
            'ac7254e3cdb359ebae302655b72b9f74b85d9e817c326fa28173791b3fb4f114'
            '9ba3942ac1a37f6b39c98ae6592573402bf08d8376f64554d0696c0fed6fd0e2')
install=hydrus.install

prepare() {
  cd "$pkgname"
  patch -Np1 -i ../paths-in-opt.patch
  patch -Np1 -i ../running-the-server.patch

  # Cython patches if applicable
  $build_cython && patch -Np1 -i ../cython-workarounds.patch

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

  if $build_cython; then
      cd include
      local -a files_to_compile
      files_to_compile=()
      for file in *.py; do
          # ClientGUICommon.py and ClientController.py have problems when built under Cython
          [ "$file" == ClientGUICommon.py -o "$file" == ClientController.py ] && continue
          files_to_compile+=("${file%.py}")
      done

      cython2 -2 --fast-fail -Werror "${files_to_compile[@]/%/.py}"
      parallel --bar '${CCLD:-gcc} -Os -s -fpic -shared -o {}.so {}.c $(python2-config --libs --includes) $LDFLAGS' ::: "${files_to_compile[@]}"
      rm -f -- "${files_to_compile/%/.c}"
  fi
}

package() {
  cd "$pkgname"

  # Create /opt/hydrus and copy hydrus sources to there
  install -m755 -d "${pkgdir}/opt/hydrus"
  cp -r help include static client.pyw server.pyw "${pkgdir}/opt/hydrus/"

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
