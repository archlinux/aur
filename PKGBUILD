# Maintainer: Jaime Martínez Rincón <jaime@jamezrin.name>
# Maintainer: Patrick Schratz <patrick.schratz@gmail.com>
# Maintainer: Jared Allard <jaredallard@outlook.com>
# code adapted from https://github.com/jaredallard/notion-app

pkgname=notion-app
pkgver=2.0.11
pkgrel=2
epoch=1
pkgdesc="The all-in-one workspace for your notes and tasks"
arch=('i686' 'x86_64')
url="https://www.notion.so/desktop"
license=('MIT')
depends=('electron' 're2' 'gtk3' 'xdg-utils')
makedepends=('imagemagick' 'p7zip' 'asar')
optdepends=('notion-enhancer: enhancements and fixes')
source=(
        "Notion-"${pkgver}".exe::https://desktop-release.notion-static.com/Notion%20Setup%20${pkgver}.exe" 
        'notion-app'
        'notion-app.desktop')
md5sums=('b3fb76f3cdc664e71e7438348c472a16'
         '6f4dfafeaaf5ef56c4eb5ef78792e063'
         'dc75abd9b8f3f455a0b8fc0d8d8932b5')
build() {
  msg "Extracting app from Windows build..."
  7z x -y "${srcdir}/Notion-"${pkgver}".exe" -o"${srcdir}/build-1" >/dev/null
  7z x -y "${srcdir}/build-1/\$PLUGINSDIR/app-64.7z" -o"${srcdir}/build-2" >/dev/null
  asar extract "${srcdir}/build-2/resources/app.asar" "${srcdir}/build-3" >/dev/null
  
  msg "Converting app icon..."
  mkdir -p "${srcdir}/build-4"
  convert "${srcdir}/build-3/icon.ico[0]" "${srcdir}/build-4/icon.png" >/dev/null

  msg "Copying files to final build stage..."
  cp -r "${srcdir}/build-2/locales" "${srcdir}/build-4/"
  cp "${srcdir}/build-2/resources/app.asar" "${srcdir}/build-4/app.asar"
  cp "${srcdir}/notion-app" "${srcdir}/build-4"
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"

  cp -r "${srcdir}/build-4/"* "${pkgdir}/opt/${pkgname}"
  install -Dm644 "${srcdir}/build-4/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"
}
