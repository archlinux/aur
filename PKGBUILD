# Maintainer: Naoya Inada <naoina@kuune.org>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

# NOTE: This PKGBUILD is based on https://osdn.net/downloads/users/26/26962/fcitx-mozc-ut-2.26.4206.102.20201129.1.PKGBUILD/

## Mozc compile option
_bldtype=Release

_mozcver=2.26.4206.102
_fcitxver=20201111
_utdicdate=20201129
pkgver=${_mozcver}.${_utdicdate}
pkgrel=1

pkgname=fcitx-mozc-ut
arch=('i686' 'x86_64')
url="https://osdn.net/users/utuhiro/pf/utuhiro/files/"
license=('custom')
makedepends=('clang' 'gyp' 'ninja' 'pkg-config' 'python' 'curl' 'gtk2' 'qt5-base' 'fcitx' 'libxcb' 'glib2' 'bzip2' 'unzip')

source=(
  https://osdn.net/users/utuhiro/pf/utuhiro/dl/mozc-${_mozcver}.tar.bz2
  abseil-cpp-20200923.2.tar.gz::https://github.com/abseil/abseil-cpp/archive/20200923.2.tar.gz
  googletest-release-1.10.0.tar.gz::https://github.com/google/googletest/archive/release-1.10.0.tar.gz
  protobuf-3.13.0.tar.gz::https://github.com/protocolbuffers/protobuf/archive/v3.13.0.tar.gz
  https://osdn.net/users/utuhiro/pf/utuhiro/dl/fcitx-mozc-${_fcitxver}.patch
  https://osdn.net/users/utuhiro/pf/utuhiro/dl/fcitx-mozc-icons.tar.gz
  https://osdn.net/users/utuhiro/pf/utuhiro/dl/mozcdic-ut-${_utdicdate}.${pkgrel}.tar.bz2
)

sha1sums=(
  'a6bd5f40b623aef4e77c20fdcc208ba7ee75e1ee'
  '1dd3f0a937c3678437646d26ca6784bd6a9b2b26'
  '9c89be7df9c5e8cb0bc20b3c4b39bf7e82686770'
  '2160cfb354148da3fb3891b267c2edc7e3eb5c30'
  '38de276494e299dc7e4816dfd95403fd0fdf8601'
  'e930c580ecd0c9e0cecb57d148122c9122d4859c'
  'eb6fc52789044238b81596479107239e491c4f25'
)

prepare() {
  cd mozc-${_mozcver}
  rm -rf src/third_party
  mkdir src/third_party
  mv ${srcdir}/abseil-cpp-20200923.2 src/third_party/abseil-cpp
  mv ${srcdir}/googletest-release-1.10.0 src/third_party/gtest
  mv ${srcdir}/protobuf-3.13.0 src/third_party/protobuf
  patch -Np1 -i ${srcdir}/fcitx-mozc-${_fcitxver}.patch

  # Avoid build errors
  sed -i -e 's/-stdlib=libc++//' src/gyp/common.gypi
  sed -i -e 's/-lc++//' src/gyp/common.gypi
}

build() {
  cd mozc-${_mozcver}/src

  _targets="unix/fcitx/fcitx.gyp:fcitx-mozc unix/fcitx/fcitx.gyp:gen_fcitx_mozc_i18n"

  GYP_DEFINES="document_dir=/usr/share/licenses/mozc" python build_mozc.py gyp --gypdir=/usr/bin --target_platform=Linux
  python build_mozc.py build -c $_bldtype $_targets
}

package_fcitx-mozc-ut() {
  pkgdesc="Fcitx engine module for Mozc with Mozc UT Dictionary"
  arch=('i686' 'x86_64')
  depends=("mozc-ut=${pkgver}" 'fcitx')
  conflicts=('fcitx-mozc' 'fcitx-mozc-ut2' 'fcitx-mozc-neologd-ut' 'fcitx-mozc-ut-unified')

  cd mozc-${_mozcver}/src
  for mofile in out_linux/${_bldtype}/gen/unix/fcitx/po/*.mo
  do
    filename=`basename $mofile`
    lang=${filename/.mo/}
    install -D -m 644 "$mofile" "${pkgdir}/usr/share/locale/$lang/LC_MESSAGES/fcitx-mozc.mo"
  done

  install -D -m 755 out_linux/${_bldtype}/fcitx-mozc.so "${pkgdir}/usr/lib/fcitx/fcitx-mozc.so"
  install -D -m 644 unix/fcitx/fcitx-mozc.conf "${pkgdir}/usr/share/fcitx/addon/fcitx-mozc.conf"
  install -D -m 644 unix/fcitx/mozc.conf "${pkgdir}/usr/share/fcitx/inputmethod/mozc.conf"

  install -d ${pkgdir}/usr/share/fcitx/mozc/icon
  install -m 644 ${srcdir}/fcitx-mozc-icons/*.png ${pkgdir}/usr/share/fcitx/mozc/icon/
}
