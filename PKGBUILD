#Maintainer: Marc Jose <Hering2007@web.de>
#Contributor: Lars Jose <larsjose77@gmail.com>
pkgname=franz-bin
pkgver=5.0.0_beta.12
pkgrel=1
pkgdesc='Free messaging app for services like WhatsApp, Slack, Messenger and many more.'
arch=('x86_64')
depends=('nodejs' 'libx11' 'libxext' 'libxss' 'libxkbfile')
makedepends=('tar' 'yarn' 'npm' 'xorriso')
conflicts=('franz')
url='https://github.com/meetfranz/franz'
license=('Apache')
source=("${pkgname}.desktop" "https://github.com/meetfranz/franz/archive/${pkgver//_/-}.tar.gz")
sha256sums=('f72d9fcad1e1de482a35414f5a346c7e3d6c6140849861f7a5fbfbf32dcded36'
            'b71cd923c5c17a65ddb085acb830f851c19787dac3a0beadea80cf52b836aeae')

build() {
  cd "franz-${pkgver//_/-}"
  yarn add gulp-cli@1.2.2 gulpjs/gulp#4.0 
  yarn rebuild --production --non-interactive
  USE_SYSTEM_XORRISO=true yarn build
}

package() {
  cd "franz-${pkgver//_/-}"
  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share"
  cp -r --preserve=mode out/linux-unpacked "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "$srcdir/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "build-helpers/images/icon.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png"
  ln -s "/usr/share/${pkgname}/franz" "${pkgdir}/usr/bin/${pkgname}"
}