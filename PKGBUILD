# Maintainer: invt <invt@localhost>

pkgname=granola-wine
pkgver=7.319.1
pkgrel=1
pkgdesc='Granola AI Notepad for Windows packaged to run under Wine'
arch=('x86_64')
url='https://www.granola.ai/'
license=('custom')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'wine' 'xdg-utils')
makedepends=('7zip')
install="${pkgname}.install"
options=('!strip' '!debug')
noextract=("Granola-${pkgver}-win-x64.exe")
source=(
  "Granola-${pkgver}-win-x64.exe::https://dr2v7l5emb758.cloudfront.net/${pkgver}/Granola-${pkgver}-win-x64.exe"
  'granola.in'
  'granola-wine.desktop'
  'granola-wine.install'
  'LICENSE'
)
sha256sums=('4cdeabf87e9b72d23ef7e59896087a4d67481f50e74b58eac9c25ec1b4a61942'
            'c92ef8f028398fe840f001dacd6b80e665914275c346e78fccaac89019b179c2'
            'd3271d0a19cc761fdcdbd45f82670ff45f19362d9a26b6f457617032e6f86c62'
            '06c5b52f1f88887bf4e501d895c116bf351e46118b707d486ec6f0e0afeddc15'
            'af454ff477d4c6608b755801ac954010a74ce37580b359e6404cfe8151eec8ba')

prepare() {
  rm -rf "${srcdir}/installer" "${srcdir}/app"
  mkdir -p "${srcdir}/installer" "${srcdir}/app"

  7z x -y -o"${srcdir}/installer" "${srcdir}/Granola-${pkgver}-win-x64.exe" '$PLUGINSDIR/app-64.7z'
  7z x -y -o"${srcdir}/app" "${srcdir}/installer/\$PLUGINSDIR/app-64.7z"
}

package() {
  install -d "${pkgdir}/opt/${pkgname}/app"
  cp -a "${srcdir}/app/." "${pkgdir}/opt/${pkgname}/app/"

  install -Dm755 "${srcdir}/granola.in" "${pkgdir}/usr/bin/granola"
  sed -i "s/@PKGVER@/${pkgver}/g" "${pkgdir}/usr/bin/granola"

  install -Dm644 "${srcdir}/granola-wine.desktop" "${pkgdir}/usr/share/applications/granola-wine.desktop"
  install -Dm644 "${srcdir}/app/resources/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/granola-wine.png"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
