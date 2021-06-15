# Maintainer: Henry Mohn <hmohniii@gmail.com>
pkgname=mjml-app
pkgver=3.0.3
pkgrel=1
pkgdesc='The desktop app for MJML'
arch=('any')
url="https://github.com/mjmlio/${pkgname}"
license=('MIT')
depends=('yarn')
source=(
  "https://github.com/mjmlio/${pkgname}/archive/v${pkgver}.tar.gz"
  "mjml-app.desktop"
)
md5sums=(
  '693fab16b353bc0e6c20d571c6091e35'
  '1f20e11d8f8e674500bdda8054e859c8'
)

prepare() {
  NODEVERSION=$(node --version)
  if [[ $NODEVERSION == "v16"* ]]; then
    printf "\n\n\033[0;31mMJML-APP is not compatible with NodeJS v16.  Please install an older version of NodeJS or use NVM to use set an older version of NodeJS prior to making this package.\n\n"
    exit 1
  fi
}

package() {
  install -D -m644 "mjml-app.desktop" "${pkgdir}/usr/share/applications/mjml-app.desktop"

  cd "${srcdir}/${pkgname}-${pkgver}/"

  yarn
  yarn dist

  install -dm755 "${pkgdir}/opt/"
  chmod -R 755 "dist/linux-unpacked"
  cp -r "dist/linux-unpacked" "${pkgdir}/opt/mjml-app"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/mjml-app/mjml-app" "${pkgdir}/usr/bin/mjml-app"

  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/assets/resources/icons/128x128.png" "${pkgdir}/opt/mjml-app/resources/app/assets/icon.png"
  install -d -m755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  ln -s "/opt/mjml-app/resources/app/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/mjml-app.png"
}
