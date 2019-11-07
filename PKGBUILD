# Maintainer: Yang Niao <ksmt4699 at gmail dot com>
# Contributor: MASAKI Haruka <yek at reasonset dot net>
# Contributor: UTUMI Hirosi <utuhiro78 att yahoo dott co dott jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

## Mozc compile option
_bldtype=Release

_mozcver=2.23.2815.102
_neodicver=20191024
_ut2dicver=20191014
_revision=1

_pkgbase=mozc
pkgbase=fcitx-mozc-neologd-ut+ut2
pkgname=fcitx-mozc-neologd-ut+ut2
true && pkgname=('mozc-neologd-ut+ut2' 'fcitx-mozc-neologd-ut+ut2')
pkgver=${_mozcver}.${_neodicver}.${_revision}
pkgrel=1
arch=('i686' 'x86_64')
url="https://osdn.net/users/utuhiro/pf/utuhiro/files/"
license=('custom')
makedepends=('clang' 'ninja' 'pkg-config' 'python2' 'curl' 'gtk2' 'qt5-base' 'zinnia' 'fcitx' 'libxcb' 'glib2' 'bzip2' 'unzip')

source=("https://osdn.net/frs/chamber_redir.php?m=ymu&f=%2Fusers%2F24%2F24574%2Fmozc-neologd-ut-2.23.2815.102.20191024.1.tar.xz"
        "https://ja.osdn.net/downloads/users/24/24521/mozc-2.23.2815.102%2Bdfsg~ut2-20171008d%2B20191014.tar.xz"
		add-new-japanese-era.patch
        # https://github.com/google/mozc/issues/441#issue-321728877
        fix-for-gcc81.patch
        http://download.fcitx-im.org/fcitx-mozc/fcitx-mozc-icon.tar.gz)

sha1sums=('SKIP'
          '08befd9228998283b47bf29fefeb84442fb0b29e'
          '94502348e60659765d3e6ae2780d07e5104a06a2'
          '2bad0705a0a09d8d5a79c874b59c485052da2b38'
          '883f4fc489a9ed1c07d2d2ec37ca72509f04ea5d')

prepare() {
  cp -f $srcdir/mozc-${_mozcver}+dfsg\~ut2-20171008d+${_ut2dicver}/mut/src/data/dictionary_oss/dictionary*.txt $srcdir/mozc-neologd-ut-${pkgver}/src/data/dictionary_oss/
  cd mozc-neologd-ut-${pkgver}/src

  # add a new Japanese era
  patch -Np2 -i "${srcdir}/add-new-japanese-era.patch"

  # fix for gcc-8.1
  patch -Np2 -i "${srcdir}/fix-for-gcc81.patch"

  # Adjust to use python2
  find . -name  \*.py        -type f -exec sed -i -e "1s|python.*$|python2|"  {} +
  find . -regex '.*\.gypi?$' -type f -exec sed -i -e "s|'python'|'python2'|g" {} +
}

build() {
  cd mozc-neologd-ut-${pkgver}/src

  _targets="server/server.gyp:mozc_server gui/gui.gyp:mozc_tool renderer/renderer.gyp:mozc_renderer unix/fcitx/fcitx.gyp:fcitx-mozc unix/fcitx/fcitx.gyp:gen_fcitx_mozc_i18n"

  GYP_DEFINES="document_dir=/usr/share/licenses/${pkgbase}" python2 build_mozc.py gyp --target_platform=Linux
  python2 build_mozc.py build -c $_bldtype $_targets
}

package_mozc-neologd-ut+ut2() {
  pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
  arch=('i686' 'x86_64')
  depends=('qt5-base' 'zinnia')
  conflicts=('fcitx-mozc' 'mozc' 'fcitx-mozc-ut2' 'mozc-ut2' 'fcitx-mozc-ut' 'mozc-ut' 'fcitx-mozc-neologd-ut' 'mozc-neologd-ut')
  cd mozc-neologd-ut-${pkgver}/src
  install -D -m 755 out_linux/${_bldtype}/mozc_server "${pkgdir}/usr/lib/mozc/mozc_server"
  install    -m 755 out_linux/${_bldtype}/mozc_tool   "${pkgdir}/usr/lib/mozc/mozc_tool"

  install -d "${pkgdir}/usr/share/licenses/$pkgname/"
  install -m 644 ../LICENSE data/installer/*.html "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_fcitx-mozc-neologd-ut+ut2() {
  pkgdesc="Fcitx engine module for Mozc"
  arch=('i686' 'x86_64')
  depends=("mozc-neologd-ut+ut2" 'fcitx')
  replaces=('fcitx-mozc' 'fcitx-mozc-ut2' 'fcitx-mozc-ut' 'fcitx-mozc-neologd-ut')

  cd mozc-neologd-ut-${pkgver}/src
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
  install -m 644 $srcdir/fcitx-mozc-icons/*.png ${pkgdir}/usr/share/fcitx/mozc/icon/
}
