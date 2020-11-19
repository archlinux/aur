# Maintainer: Masaki Haruka <yek at reasonset dot net>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

## Mozc compile option
_bldtype=Release

_mozcver=2.25.4190.102
_fcitxver=20201111
_utdicdate=20201110
pkgver=${_mozcver}.${_utdicdate}
pkgrel=1

pkgname=mozc-ut-unified-full
true && pkgname=('mozc-ut-unified-full' 'fcitx-mozc-ut-unified-full')
arch=('i686' 'x86_64')
url="https://osdn.net/users/utuhiro/pf/utuhiro/files/"
license=('custom')
makedepends=('clang' 'gyp' 'ninja' 'pkg-config' 'python' 'curl' 'gtk2' 'qt5-base' 'fcitx' 'libxcb' 'glib2' 'bzip2' 'unzip')

source=(
  https://osdn.net/users/utuhiro/pf/utuhiro/dl/mozc-${_mozcver}.tar.bz2
  abseil-cpp-20200923.2.tar.gz::https://github.com/abseil/abseil-cpp/archive/20200923.2.tar.gz
  googletest-release-1.10.0.tar.gz::https://github.com/google/googletest/archive/release-1.10.0.tar.gz
  japanese-usage-dictionary-master.zip::https://github.com/hiroyuki-komatsu/japanese-usage-dictionary/archive/master.zip
  protobuf-3.13.0.tar.gz::https://github.com/protocolbuffers/protobuf/archive/v3.13.0.tar.gz
  https://osdn.net/users/utuhiro/pf/utuhiro/dl/fcitx-mozc-${_fcitxver}.patch
  https://download.fcitx-im.org/fcitx-mozc/fcitx-mozc-icon.tar.gz
  https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip
  https://www.post.japanpost.jp/zipcode/dl/jigyosyo/zip/jigyosyo.zip
  'https://osdn.net/frs/chamber_redir.php?m=jaist&f=%2Fusers%2F26%2F26898%2Fmozcdic-ut-20201110.1.tar.bz2'
)

sha1sums=(
  'adf4968191ea1f9837b1f9d5d0aa47ac1e2ddee2'
  '1dd3f0a937c3678437646d26ca6784bd6a9b2b26'
  '9c89be7df9c5e8cb0bc20b3c4b39bf7e82686770'
  'bf15e8ff92cbde3c102cbf4ad50c2090a7165495'
  '2160cfb354148da3fb3891b267c2edc7e3eb5c30'
  '38de276494e299dc7e4816dfd95403fd0fdf8601'
  '883f4fc489a9ed1c07d2d2ec37ca72509f04ea5d'
  'SKIP'
  'SKIP'
  'cce854aec2506ff17499b3b3a75a01fbecc50066'
)

prepare() {
  cd mozc-${_mozcver}
  rm -rf src/third_party
  mkdir src/third_party
  mv ${srcdir}/abseil-cpp-20200923.2 src/third_party/abseil-cpp
  mv ${srcdir}/googletest-release-1.10.0 src/third_party/gtest
  mv ${srcdir}/japanese-usage-dictionary-master src/third_party/japanese_usage_dictionary
  mv ${srcdir}/protobuf-3.13.0 src/third_party/protobuf
  patch -Np1 -i ${srcdir}/fcitx-mozc-${_fcitxver}.patch

  # Add ZIP code
  cd src/data/dictionary_oss/
  PYTHONPATH="${PYTHONPATH}:../../" \
  python ../../dictionary/gen_zip_code_seed.py \
  --zip_code=${srcdir}/KEN_ALL.CSV --jigyosyo=${srcdir}/JIGYOSYO.CSV >> dictionary09.txt
  cd -

  # Avoid build errors
  sed -i -e 's/-stdlib=libc++//' src/gyp/common.gypi
  sed -i -e 's/-lc++//' src/gyp/common.gypi

  # Add UT dictionary
  cat ${srcdir}/mozcdic*-ut-*.txt >> src/data/dictionary_oss/dictionary00.txt
}

build() {
  cd mozc-${_mozcver}/src

  _targets="server/server.gyp:mozc_server gui/gui.gyp:mozc_tool unix/fcitx/fcitx.gyp:fcitx-mozc unix/fcitx/fcitx.gyp:gen_fcitx_mozc_i18n"

  GYP_DEFINES="document_dir=/usr/share/licenses/mozc" python build_mozc.py gyp --gypdir=/usr/bin --target_platform=Linux
  python build_mozc.py build -c $_bldtype $_targets
}

package_mozc-ut-unified-full() {
  pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input) with NEologd UT dictionary and UT2 dictionary with all dictionaries enabled."
  arch=('i686' 'x86_64')
  depends=('qt5-base')
  conflicts=('fcitx-mozc' 'mozc' 'fcitx-mozc-ut2' 'mozc-ut2' 'fcitx-mozc-ut' 'mozc-ut' 'fcitx-mozc-neologd-ut' 'mozc-neologd-ut' 'fcitx-mozc-neologd-ut+ut2' 'mozc-ut-unified' 'fcitx-mozc-ut-unified')
  cd mozc-${_mozcver}/src
  install -D -m 755 out_linux/${_bldtype}/mozc_server "${pkgdir}/usr/lib/mozc/mozc_server"
  install -m 755 out_linux/${_bldtype}/mozc_tool "${pkgdir}/usr/lib/mozc/mozc_tool"

  install -d "${pkgdir}/usr/share/licenses/$pkgname/"
  install -m 644 ../LICENSE data/installer/*.html "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_fcitx-mozc-ut-unified-full() {
  pkgdesc="Fcitx engine module for Mozc with NEologd UT dictionary and UT2 dictionary with all dictionaries enabled."
  arch=('i686' 'x86_64')
  depends=("mozc-ut-unified-full=${pkgver}" 'fcitx')
  conflicts=('fcitx-mozc' 'mozc' 'fcitx-mozc-ut2' 'mozc-ut2' 'fcitx-mozc-ut' 'mozc-ut' 'fcitx-mozc-neologd-ut' 'mozc-neologd-ut' 'fcitx-mozc-neologd-ut+ut2' 'mozc-ut-unified' 'fcitx-mozc-ut-unified')

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
