# Maintainer: phenylshima <phenylshima at outlook dot com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

## NOTE: This doens't support kill_line feature of uim.

# renovate: aur-sync depName=mozc 82348b002d368ba8d7361063d50846adf49b338e

_uimmozcrev="7beac7ba000e0459a4dc933f3873b521664d2665"
_mozcrev="89c70080d0102e8ed23cae6c05b535dedf506de4"

pkgname=uim-mozc
_pkgname=mozc
pkgver=2.29.5200.102
pkgrel=1
pkgdesc="uim plugin module for Mozc"
arch=('i686' 'x86_64')
url="https://github.com/e-kato/macuim"
license=('BSD')
groups=('mozc-im')
depends=('mozc>=2.29.5200.102' 'uim')
install=${pkgname}.install
makedepends=('bazel' 'git' 'python')
source=(
  mozc::git+https://github.com/google/mozc.git#commit=${_mozcrev}
  uim-mozc::git+https://github.com/e-kato/macuim.git#commit=${_uimmozcrev}
  'bazel.patch'
  'mozc.patch'
  'BUILD.bazel'
)
sha1sums=('SKIP'
          'SKIP'
          '7547e5cae4df8b516580c882bc975d8a70251db1'
          'b65c45338b3d0b86d32c78cd26b50e916f5187d2'
          'decb1a27894cf52c8a562dbf731e1654ef2f9b5e')

prepare() {
  cd "${srcdir}/${_pkgname}/"

  git submodule update --init --recursive
  patch -p1 -i "${srcdir}/bazel.patch"

  cd "${srcdir}/${_pkgname}/src"

  cp -rf "${srcdir}/uim-mozc/Mozc/uim" unix/
  patch -p1 -i "${srcdir}/mozc.patch"

  cp -rf "${srcdir}/BUILD.bazel" unix/uim

  # Extract license part of uim-mozc
  head -n 32 unix/uim/mozc.cc > unix/uim/LICENSE
}


build() {
  cd "${srcdir}/${_pkgname}/src"

  msg "Starting make..."

  unset ANDROID_NDK_HOME
  export JAVA_HOME='/usr/lib/jvm/java-11-openjdk/'
  bazel build unix/uim:uim-mozc unix/icons --config oss_linux --compilation_mode opt --experimental_cc_shared_library
}

package() {
  cd "${srcdir}/${_pkgname}/src"
  install -D -m 755 bazel-bin/unix/uim/libuim-mozc.so "${pkgdir}/usr/lib/uim/plugin/libuim-mozc.so"
  install -d "${pkgdir}/usr/share/uim"
  install    -m 644 ${srcdir}/uim-mozc/Mozc/scm/*.scm "${pkgdir}/usr/share/uim/"
  install -D -m 644 data/images/unix/ime_product_icon_opensource-32.png "${pkgdir}/usr/share/uim/pixmaps/mozc.png"
  install    -m 644 data/images/unix/ui-tool.png "${pkgdir}/usr/share/uim/pixmaps/mozc_tool_selector.png"
  install    -m 644 data/images/unix/ui-properties.png "${pkgdir}/usr/share/uim/pixmaps/mozc_tool_config_dialog.png"
  install    -m 644 data/images/unix/ui-dictionary.png "${pkgdir}/usr/share/uim/pixmaps/mozc_tool_dictionary_tool.png"

  install -D -m 644 unix/uim/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/uim-mozc/LICENSE"
}
