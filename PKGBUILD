# Maintainer: Dave Blair <mail@dave-blair.de>
# Contributor: Rustam Tsurik <rustam.tsurik@gmail.com>

pkgname=memsource-editor
_pkg=MemsourceEditor
_platform=ubuntu-14.04
pkgver=6.211.2
pkgrel=1
pkgdesc="A CAT translation tool, requires Memsource subscription"
arch=('x86_64')
license=('custom')
url="http://www.memsource.com/"
install=${pkgname}.install

depends=('qt4'
         'bzip2'
         'libsm'
         'libx11'
         'libxrender'
         'freetype2'
         'fontconfig'
         'libpng12')

depends+=('shared-mime-info')

makedepends=('imagemagick')
options=('!strip')
source=("http://download.memsource.com/production/updates/memsource-editor/linux/${_platform}/archive/install/${_pkg}-${pkgver}-${_platform}.run"
        "memsource-editor.desktop"
        "memsource-editor.xml"
        "memsource"
        "license.desktop")

sha256sums=('2ad2c77ca1e8a2cac0c4c0f2e2549f8ec6c32dc1cf09cef9e3473114ae8598ad'
            '943056f6643f110d94663e4bbf1650850d49ea0adb48cc0355ad5b4f6112da24'
            'dbe0e241bc352b170577725c6f8b86922b36757f1cc82b6d16f967fe5f398266'
            '4802b77ffefd2cdd7526fec28a690f8dc560fef74501806b3485648dcac830fe'
            '3c6d72cdb51dab05682d0c84153171de68ef14cf8b593dfd44123a9365dd1f1e')

build() {
  install -d ${srcdir}/build
  cd ${srcdir}/build
  chmod +x ../${_pkg}-${pkgver}-${_platform}.run

  install -d ${srcdir}/build/Desktop
  echo XDG_DESKTOP_DIR=\${srcdir}/build/Desktop\ > ${srcdir}/build/user-dirs.dirs
  export XDG_CONFIG_HOME=${srcdir}/build
  export HOME=${srcdir}/build

  ../${_pkg}-${pkgver}-${_platform}.run --mode unattended --prefix ${srcdir}/build/memsource-editor
}

package() {
  export XDG_DATA_HOME+=:${pkgdir}/usr/share
  export XDG_DATA_DIRS+=:${pkgdir}/usr/share
  install -d ${pkgdir}/opt/memsource-editor
  install -d ${pkgdir}/usr/{bin,share/{mime/packages,applications}}
  install -d ${pkgdir}/usr/share/licenses/memsource-editor

  #install -Dm 775 ${srcdir}/build/memsource-editor/TranslationEditor ${pkgdir}/opt/memsource-editor/
  #install -Dm 664 ${srcdir}/build/memsource-editor/fonts/*.ttf ${pkgdir}/opt/memsource-editor/fonts/
  #install -Dm 664 ${srcdir}/build/memsource-editor/lib/*.* ${pkgdir}/opt/memsource-editor/lib/
  #install -Dm 664 ${srcdir}/build/memsource-editor/lib/imageformats/* ${pkgdir}/opt/memsource-editor/lib/imageformats/
  install -Dm 755 ${srcdir}/memsource ${pkgdir}/usr/bin/
  install -Dm 644 ${srcdir}/memsource-editor.desktop ${pkgdir}/usr/share/applications/
  install -Dm 644 ${srcdir}/memsource-editor.xml ${pkgdir}/usr/share/mime/packages/
  install -Dm 755 ${srcdir}/license.desktop ${pkgdir}/usr/share/licenses/memsource-editor/

  rm -f "${srcdir}/build/memsource-editor/install.log" \
    "${srcdir}/build/memsource-editor/Uninstall Memsource Editor.desktop" \
    "${srcdir}/build/memsource-editor/TranslationEditorUpdater" \
    "${srcdir}/build/memsource-editor/uninstall" \
    "${srcdir}/build/memsource-editor/uninstall.dat" \
    "${srcdir}/build/memsource-editor/MemsourceEditor.desktop"

  cp -a ${srcdir}/build/memsource-editor ${pkgdir}/opt

  for sz in 16 24 32 36 48 64 96 128 192 256; do
    install -d ${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/apps
    convert ${srcdir}/build/memsource-editor/app.png -resize ${sz}x${sz} \
    ${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/apps/memsource-editor.png
    install -d ${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/mimetypes
    convert ${srcdir}/build/memsource-editor/application-x-mxliff.svg -resize ${sz}x${sz} \
    ${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/mimetypes/memsource-editor-translation.png
  done
}
