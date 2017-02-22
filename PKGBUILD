# Maintainer: Dave Blair <mail@dave-blair.de>
# Contributor: Rustam Tsurik <rustam.tsurik@gmail.com>

pkgname=memsource-editor
_pkg=MemsourceEditor
_platform=ubuntu-12.04
pkgver=6.202.2
pkgrel=1
pkgdesc="A CAT translation tool, requires Memsource subscription"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.memsource.com/"
install=${pkgname}.install

if [ "$CARCH" = "i686" ]; then
  depends=('qt4'
           'bzip2'
           'libsm'
           'libx11'
           'libxrender'
           'freetype2'
           'fontconfig'
           'libpng12')
elif [ "$CARCH" = "x86_64" ]; then
  depends=('lib32-qt4'
           'lib32-bzip2'
           'lib32-libsm'
           'lib32-libx11'
           'lib32-libxrender'
           'lib32-freetype2'
           'lib32-fontconfig'
           'lib32-libpng12')
fi
depends+=('shared-mime-info')

makedepends=('imagemagick')
#http://download.memsource.com/production/updates/memsource-editor/linux/ubuntu-12.04/archive/install/MemsourceEditor-6.200.2-ubuntu-12.04.run
options=('!strip')
source=("http://download.memsource.com/production/updates/memsource-editor/linux/${_platform}/archive/install/${_pkg}-${pkgver}-${_platform}.run"
        "memsource-editor.desktop"
        "memsource-editor.xml"
        "memsource"
        "license.desktop")

sha256sums=('933ee043c2536bfed51f2f849a3958cefa9a053490c04afd82b302ab526e1d99'
            '943056f6643f110d94663e4bbf1650850d49ea0adb48cc0355ad5b4f6112da24'
            '94fff65cc3a6cfbc79d4f7bdb6ef1c3855a032e52932de6051867a1f99119257'
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
  install -d ${pkgdir}/opt/memsource-editor/{fonts,lib/imageformats,spelling}
  install -d ${pkgdir}/usr/{bin,share/{mime/packages,applications}}
  install -d ${pkgdir}/usr/share/licenses/memsource-editor

  install -Dm 775 ${srcdir}/build/memsource-editor/TranslationEditor ${pkgdir}/opt/memsource-editor/
  install -Dm 664 ${srcdir}/build/memsource-editor/fonts/*.ttf ${pkgdir}/opt/memsource-editor/fonts/
  install -Dm 664 ${srcdir}/build/memsource-editor/lib/*.* ${pkgdir}/opt/memsource-editor/lib/
  install -Dm 664 ${srcdir}/build/memsource-editor/lib/imageformats/* ${pkgdir}/opt/memsource-editor/lib/imageformats/
  install -Dm 755 ${srcdir}/memsource ${pkgdir}/usr/bin/
  install -Dm 644 ${srcdir}/memsource-editor.desktop ${pkgdir}/usr/share/applications/
  install -Dm 644 ${srcdir}/memsource-editor.xml ${pkgdir}/usr/share/mime/packages/
  install -Dm 755 ${srcdir}/license.desktop ${pkgdir}/usr/share/licenses/memsource-editor/

  for sz in 16 24 32 36 48 64 96 128 192 256; do
    install -d ${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/apps
    convert ${srcdir}/build/memsource-editor/app.png -resize ${sz}x${sz} \
    ${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/apps/memsource-editor.png
    install -d ${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/mimetypes
    convert ${srcdir}/build/memsource-editor/application-x-mxliff.svg -resize ${sz}x${sz} \
    ${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/mimetypes/memsource-editor-translation.png
  done
}
