# Maintainer: Alkindi42

pkgname=joplin-desktop
pkgver=1.4.12
pkgrel=1
pkgdesc="An open source note taking and to-do application with synchronization capabilities"
arch=('x86_64')
depends=('nodejs>10' 'nss' 'gtk3' 'libxss' 'libsecret' 'rsync' 'libgsf' 'libexif' 'libcroco')
source=(
  "${pkgname%-*}.sh" "${pkgname%-*}.desktop"
  "${pkgname}-${pkgver}.tar.gz::https://github.com/laurent22/${pkgname%-*}/archive/v${pkgver}.tar.gz"
)
makedepends=('npm' 'git')
optdepends=('libappindicator-gtk3: for tray icon')
conflicts=('joplin' 'joplin-beta')
url="https://joplinapp.org"
license=('MIT')
sha256sums=('5951f61e8cad6670d4b7c2c18849faa2f9d5ff32185285f8f17594232cf32962'
            'd78f008381e07acb5edcae54143a7505799dfbb86816b48e596eb2d20da0f94c'
            'f3a5e8e910144a0cae265ea4082e6f69ee12ea550d296a7948ee5f80c38a28de')

build() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"

  rm -rf packages/app-mobile \
    packages/generator-joplin \
    packages/app-cli

  npm install

  # Install app-desktop
  cd "${srcdir}/${pkgname%-*}-${pkgver}/packages/app-desktop"
  npm run dist
}

package() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}/packages"

  install -d ${pkgdir}/usr/share/${pkgname}

  # App-desktop
  cp -R app-desktop/dist/linux-unpacked/* "${pkgdir}/usr/share/${pkgname}"

  install -Dm755 "${srcdir}/${pkgname%-*}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname%-*}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
