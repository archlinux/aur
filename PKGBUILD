# Maintainer: Naoya Inada <naoina@kuune.org>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

# NOTE: This PKGBUILD is based on https://osdn.net/downloads/users/32/32747/fcitx-mozc-ut-20210725.PKGBUILD/

# Mozc compile option
_bldtype=Release

_mozcver=2.26.4444.102
_fcitxver=20210329
_utdicver=20210725
pkgver=${_mozcver}.${_utdicver}
pkgrel=1

_pkgbase=mozc
pkgname=mozc-ut
pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input) with Mozc UT Dictionary (additional dictionary)"
arch=('x86_64')
url="https://osdn.net/users/utuhiro/pf/utuhiro/files/"
license=('custom')
depends=('qt5-base')
makedepends=('clang' 'gyp' 'ninja' 'pkg-config' 'python' 'curl' 'gtk2' 'qt5-base' 'libxcb' 'glib2' 'bzip2' 'unzip')
conflicts=('fcitx-mozc' 'mozc' 'fcitx-mozc-ut2' 'mozc-ut2' 'fcitx-mozc-neologd-ut' 'mozc-neologd-ut' 'fcitx-mozc-ut-unified' 'mozc-ut-unified')

source=(
  https://osdn.net/users/utuhiro/pf/utuhiro/dl/mozc-${_mozcver}.tar.bz2
  abseil-cpp-20210324.1.tar.gz::https://github.com/abseil/abseil-cpp/archive/refs/tags/20210324.1.tar.gz
  googletest-release-1.10.0.tar.gz::https://github.com/google/googletest/archive/release-1.10.0.tar.gz
  japanese-usage-dictionary-master.zip::https://github.com/hiroyuki-komatsu/japanese-usage-dictionary/archive/master.zip
  protobuf-3.13.0.tar.gz::https://github.com/protocolbuffers/protobuf/archive/v3.13.0.tar.gz
  https://osdn.net/users/utuhiro/pf/utuhiro/dl/mozcdic-ut-${_utdicver}.tar.bz2
  https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip
  https://www.post.japanpost.jp/zipcode/dl/jigyosyo/zip/jigyosyo.zip
)

sha256sums=(
  '8c9040297a838faa8417439ddb1fd5c8881c38f7f3e6200f5147bfea460aed4f'
  '441db7c09a0565376ecacf0085b2d4c2bbedde6115d7773551bc116212c2a8d6'
  '9dc9157a9a1551ec7a7e43daea9a694a0bb5fb8bec81235d8a1e6ef64c716dcb'
  'e46b1c40facbc969b7a4af154dab30ab414f48a0fdbe57d199f912316977ac25'
  '9b4ee22c250fe31b16f1a24d61467e40780a3fbb9b91c3b65be2a376ed913a1a'
  'ff431c6da2344d400f3e1eb875cf5f870429f8febb24db63814a4a92dcc618c6'
  'SKIP'
  'SKIP'
)

prepare() {
  cd mozc-${_mozcver}
  rm -rf src/third_party
  mkdir src/third_party
  mv ${srcdir}/abseil-cpp-20210324.1 src/third_party/abseil-cpp
  mv ${srcdir}/googletest-release-1.10.0 src/third_party/gtest
  mv ${srcdir}/japanese-usage-dictionary-master src/third_party/japanese_usage_dictionary
  mv ${srcdir}/protobuf-3.13.0 src/third_party/protobuf

  # Add ZIP code
  cd src/data/dictionary_oss/
  PYTHONPATH="${PYTHONPATH}:../../" \
  python ../../dictionary/gen_zip_code_seed.py \
  --zip_code=${srcdir}/KEN_ALL.CSV --jigyosyo=${srcdir}/JIGYOSYO.CSV >> dictionary09.txt
  cd -

  # Use libstdc++ instead of libc++
  sed "/stdlib=libc++/d;/-lc++/d" -i src/gyp/common.gypi

  # Add UT dictionary
  cat ${srcdir}/mozcdic-ut-${_utdicver}/mozcdic*-ut-*.txt >> src/data/dictionary_oss/dictionary00.txt
}

build() {
  cd mozc-${_mozcver}/src

  _targets="server/server.gyp:mozc_server gui/gui.gyp:mozc_tool"

  GYP_DEFINES="enable_gtk_renderer==0" python build_mozc.py gyp --gypdir=/usr/bin --target_platform=Linux
  python build_mozc.py build -c $_bldtype $_targets
}

package() {
  cd mozc-${_mozcver}/src
  install -D -m 755 out_linux/${_bldtype}/mozc_server ${pkgdir}/usr/lib/mozc/mozc_server
  install -m 755 out_linux/${_bldtype}/mozc_tool ${pkgdir}/usr/lib/mozc/mozc_tool

  install -d ${pkgdir}/usr/share/licenses/$pkgname/
  install -m 644 ../LICENSE data/installer/*.html ${pkgdir}/usr/share/licenses/${pkgname}/

  install -d ${pkgdir}/usr/share/doc/${pkgname}/
  cp {../AUTHORS,../LICENSE,../README.md} ${pkgdir}/usr/share/doc/${pkgname}/
}
