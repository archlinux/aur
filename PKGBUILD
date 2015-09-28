# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>

## NOTE: This doens't support kill_line feature of uim.

## Mozc compile option
_bldtype=Release
#_bldtype=Debug

_uimmozcrev=318.0562676
_mozcrev=e398317a086a78c0cf0004505eb8f56586e925b2

pkgname=uim-mozc
_pkgname=mozc
pkgver=2.17.2123.102
pkgrel=1
pkgdesc="uim plugin module for Mozc"
arch=('i686' 'x86_64')
url="http://code.google.com/p/macuim/"
license=('BSD')
groups=('mozc-im')
depends=('mozc' 'uim')
install=${pkgname}.install
makedepends=('pkg-config' 'python2' 'git' 'ninja' 'clang')
source=(
  mozc::git+https://github.com/google/mozc.git#commit=${_mozcrev}
  http://downloads.sourceforge.net/project/pnsft-aur/mozc/uim-mozc-${_uimmozcrev}.tar.xz
)
sha1sums=('SKIP'
          '5cd298aaac5afd7ff8882453e3e8fa698c2c5aa1')


pkgver() {
  . "${srcdir}/${_pkgname}/src/mozc_version_template.txt"
  printf "%s.%s.%s.%s" $MAJOR $MINOR $BUILD $REVISION
}


prepare() {
  cd "$srcdir"
  ln -sf `which python2` ./python
  PATH="${srcdir}:${PATH}"

  cd "${srcdir}/${_pkgname}/"

  git submodule update --init --recursive

  cd "${srcdir}/${_pkgname}/src"

  # uim-mozc
  cp -rf "${srcdir}/uim-mozc-${_uimmozcrev}/uim" unix/
  # Extract license part of uim-mozc
  head -n 32 unix/uim/mozc.cc > unix/uim/LICENSE

}


build() {
  # Use Qt4
  _rcc_loc=`pkg-config QtCore --variable=rcc_location`
  _qt4dir=${_rcc_loc%%/bin/rcc}
  _qt4i=`pkg-config --cflags-only-I QtGui`
  CFLAGS+=" $_qt4i"
  CXXFLAGS+=" $_qt4i"

  cd "${srcdir}/${_pkgname}/src"

  msg "Starting make..."
  # Get make -j option from $MAKEFLAGS
  _jobs=`sed -n -e "s/.*--jobs=\([0-9]\+\).*/\1/p" -e "s/.*-j *\([0-9]\+\).*/\1/p" <<< "$MAKEFLAGS"`
  _jobs=${_jobs:-1}

  unset CC CC_host CC_target CXX CXX_host CXX_target LINK AR AR_host AR_target \
        NM NM_host NM_target READELF READELF_host READELF_target
  QTDIR=$_qt4dir python2 build_mozc.py gyp
  python2 build_mozc.py build -c $_bldtype -j $_jobs unix/uim/uim.gyp:uim-mozc
}

package() {
  cd "${srcdir}/${_pkgname}/src"
  install -D -m 755 out_linux/${_bldtype}/libuim-mozc.so "${pkgdir}/usr/lib/uim/plugin/libuim-mozc.so"
  install -d "${pkgdir}/usr/share/uim"
  install    -m 644 ${srcdir}/uim-mozc-${_uimmozcrev}/scm/*.scm "${pkgdir}/usr/share/uim/"
  install -D -m 644 data/images/unix/ime_product_icon_opensource-32.png "${pkgdir}/usr/share/uim/pixmaps/mozc.png"
  install    -m 644 data/images/unix/ui-tool.png "${pkgdir}/usr/share/uim/pixmaps/mozc_tool_selector.png"
  install    -m 644 data/images/unix/ui-properties.png "${pkgdir}/usr/share/uim/pixmaps/mozc_tool_config_dialog.png"
  install    -m 644 data/images/unix/ui-dictionary.png "${pkgdir}/usr/share/uim/pixmaps/mozc_tool_dictionary_tool.png"

  install -D -m 644 unix/uim/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/uim-mozc/LICENSE"
}
