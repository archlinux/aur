# Maintainer: UTUMI Hirosi <utuhiro78 att yahoo dott co dott jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

## Mozc compile option
_bldtype=Release

_mozcver=2.23.2815.102
_dicver=20191230
_revision=1

_pkgbase=mozc
pkgname=mozc-neologd-ut
true && pkgname=('mozc-neologd-ut' 'fcitx-mozc-neologd-ut')
pkgver=${_mozcver}.${_dicver}.${_revision}
pkgrel=1
arch=('i686' 'x86_64')
url="https://osdn.net/users/utuhiro/pf/utuhiro/files/"
license=('custom')
makedepends=('clang' 'gyp' 'protobuf' 'ninja' 'pkg-config' 'python' 'curl' 'gtk2' 'qt5-base' 'zinnia' 'fcitx' 'libxcb' 'glib2' 'bzip2' 'unzip')

source=('https://osdn.net/frs/chamber_redir.php?m=jaist&f=%2Fusers%2F25%2F25365%2Fmozc-neologd-ut-2.23.2815.102.20191230.1.tar.xz'
        # https://github.com/google/mozc/issues/462#issuecomment-573220288
        # https://salsa.debian.org/debian/mozc/tree/master/debian/patches
        http://download.fcitx-im.org/fcitx-mozc/fcitx-mozc-icon.tar.gz)

sha1sums=('SKIP'
          '883f4fc489a9ed1c07d2d2ec37ca72509f04ea5d')

prepare() {
  cd mozc-neologd-ut-${pkgver}/src
  patch -Np2 -i "${srcdir}/mozc-neologd-ut-${pkgver}/patches/mozc-2.23.2815.102-python-3.patch"
  patch -Np2 -i "${srcdir}/mozc-neologd-ut-${pkgver}/patches/debian_patches_Fix-build-with-gcc8.patch"
  patch -Np2 -i "${srcdir}/mozc-neologd-ut-${pkgver}/patches/debian_patches_add_support_new_japanese_era.patch"
}

build() {
  cd mozc-neologd-ut-${pkgver}/src

  _targets="server/server.gyp:mozc_server gui/gui.gyp:mozc_tool renderer/renderer.gyp:mozc_renderer unix/fcitx/fcitx.gyp:fcitx-mozc unix/fcitx/fcitx.gyp:gen_fcitx_mozc_i18n"

  GYP_DEFINES="use_libprotobuf=1 use_libzinnia=1 document_dir=/usr/share/licenses/${pkgbase}" python build_mozc.py gyp --gypdir=/usr/bin --target_platform=Linux
  python build_mozc.py build -c $_bldtype $_targets
}

package_mozc-neologd-ut() {
  pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
  arch=('i686' 'x86_64')
  depends=('qt5-base' 'zinnia')
  conflicts=('fcitx-mozc' 'mozc' 'fcitx-mozc-ut2' 'mozc-ut2' 'fcitx-mozc-ut' 'mozc-ut')
  cd mozc-neologd-ut-${pkgver}/src
  install -D -m 755 out_linux/${_bldtype}/mozc_server "${pkgdir}/usr/lib/mozc/mozc_server"
  install    -m 755 out_linux/${_bldtype}/mozc_tool   "${pkgdir}/usr/lib/mozc/mozc_tool"

  install -d "${pkgdir}/usr/share/licenses/$pkgname/"
  install -m 644 ../LICENSE data/installer/*.html "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_fcitx-mozc-neologd-ut() {
  pkgdesc="Fcitx engine module for Mozc"
  arch=('i686' 'x86_64')
  depends=("mozc-neologd-ut=${pkgver}" 'fcitx')
  replaces=('fcitx-mozc' 'fcitx-mozc-ut2' 'fcitx-mozc-ut')

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
