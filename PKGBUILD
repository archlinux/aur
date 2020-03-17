# Maintainer: Dave Blair <mail@dave-blair.de>
# Contributor: Rustam Tsurik <rustam.tsurik@gmail.com>

pkgname=memsource-editor
_pkg=MemsourceEditor
pkgver=20.5.3
pkgrel=1
pkgdesc="A CAT translation tool, requires Memsource subscription"
arch=('x86_64')
license=('custom')
url="http://www.memsource.com/"
install=${pkgname}.install

depends=('bzip2'
         'libsm'
         'libx11'
         'libxrender'
         'freetype2'
         'fontconfig'
         'libpng12'
         'openssl-1.0'
         'qt5-xcb-private-headers')

depends+=('shared-mime-info')

makedepends=('imagemagick')
options=('!strip')
source=("http://download.memsource.com/production/updates/memsource-editor/linux/x64/archive/install/${_pkg}-${pkgver}-x64.run"
        "memsource-editor.desktop"
        "memsource-editor.xml"
        "memsource"
        "license.desktop")

sha256sums=('4f7c1a191d384ef7b237b77a2453b18836c2c8f5335c9ef8bd7bce7572df86ee'
            '215a02637392af7a3f0af23411c5234c9ce8cdf1ae5c0e40b97c43e5b0995a45'
            '8a40f0172dc948dfadec126b5ab9a4f983216034aa8fbf19a41b9466e6253866'
            '4802b77ffefd2cdd7526fec28a690f8dc560fef74501806b3485648dcac830fe'
            '3c6d72cdb51dab05682d0c84153171de68ef14cf8b593dfd44123a9365dd1f1e')

build() {
  install -d ${srcdir}/build
  cd ${srcdir}/build
  chmod +x ../${_pkg}-${pkgver}-x64.run

  install -d ${srcdir}/build/Desktop
  echo XDG_DESKTOP_DIR=\${srcdir}/build/Desktop\ > ${srcdir}/build/user-dirs.dirs
  export XDG_CONFIG_HOME=${srcdir}/build
  export HOME=${srcdir}/build

  ../${_pkg}-${pkgver}-x64.run --mode unattended --prefix ${srcdir}/build/memsource-editor
}

package() {
  export XDG_DATA_HOME+=:${pkgdir}/usr/share
  export XDG_DATA_DIRS+=:${pkgdir}/usr/share
  install -d ${pkgdir}/opt/memsource-editor
  install -d ${pkgdir}/usr/{bin,share/{mime/packages,applications}}
  install -d ${pkgdir}/usr/share/licenses/memsource-editor
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

  find ${pkgdir}/opt -type d | while read _item; do chmod 755 "$_item"; done
  find ${pkgdir}/opt -type f | while read _item; do chmod 644 "$_item"; done
  chmod +x ${pkgdir}/opt/memsource-editor/TranslationEditor
  chmod +x ${pkgdir}/opt/memsource-editor/run.sh
  chmod +x ${pkgdir}/opt/memsource-editor/libexec/QtWebEngineProcess

  for sz in 16 24 32 36 48 64 96 128 192 256; do
    install -d ${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/apps
    convert ${srcdir}/build/memsource-editor/app.png -resize ${sz}x${sz} \
    ${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/apps/memsource-editor.png
    install -d ${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/mimetypes
    convert ${srcdir}/build/memsource-editor/application-x-mxliff.svg -resize ${sz}x${sz} \
    ${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/mimetypes/memsource-translation.png
  done
}
