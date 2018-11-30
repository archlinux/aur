# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>

## NOTE: This doens't support kill_line feature of uim.

## Mozc compile option
_bldtype=Release
#_bldtype=Debug

_uimmozcrev=c979f127acaeb7b35d3344e8b1e40848e1a68d54
_mozcrev=afb03ddfe72dde4cf2409863a3bfea160f7a66d8

pkgname=uim-mozc
_pkgname=mozc
pkgver=2.23.2815.102
pkgrel=2
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
  uim-mozc::git+https://github.com/e-kato/macuim.git#commit=${_uimmozcrev}
)
sha1sums=('SKIP'
          'SKIP')


pkgver() {
  . "${srcdir}/mozc/src/data/version/mozc_version_template.bzl"
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
  cp -rf "${srcdir}/uim-mozc/Mozc/uim" unix/
  # Extract license part of uim-mozc
  head -n 32 unix/uim/mozc.cc > unix/uim/LICENSE

}


build() {

  cd "${srcdir}/${_pkgname}/src"

  msg "Starting make..."

  unset CC CC_host CC_target CXX CXX_host CXX_target LINK AR AR_host AR_target \
        NM NM_host NM_target READELF READELF_host READELF_target
  python2 build_mozc.py gyp --target_platform=Linux
  python2 build_mozc.py build -c $_bldtype unix/uim/uim.gyp:uim-mozc
}

package() {
  cd "${srcdir}/${_pkgname}/src"
  install -D -m 755 out_linux/${_bldtype}/libuim-mozc.so "${pkgdir}/usr/lib/uim/plugin/libuim-mozc.so"
  install -d "${pkgdir}/usr/share/uim"
  install    -m 644 ${srcdir}/uim-mozc/Mozc/scm/*.scm "${pkgdir}/usr/share/uim/"
  install -D -m 644 data/images/unix/ime_product_icon_opensource-32.png "${pkgdir}/usr/share/uim/pixmaps/mozc.png"
  install    -m 644 data/images/unix/ui-tool.png "${pkgdir}/usr/share/uim/pixmaps/mozc_tool_selector.png"
  install    -m 644 data/images/unix/ui-properties.png "${pkgdir}/usr/share/uim/pixmaps/mozc_tool_config_dialog.png"
  install    -m 644 data/images/unix/ui-dictionary.png "${pkgdir}/usr/share/uim/pixmaps/mozc_tool_dictionary_tool.png"

  install -D -m 644 unix/uim/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/uim-mozc/LICENSE"
}
