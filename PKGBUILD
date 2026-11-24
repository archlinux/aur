# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=imza-bin
pkgver=0.7.6
pkgrel=1
pkgdesc="Model-agnostic terminal coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/umutsevdi/imza"
license=('GPL-3.0-only')
depends=('curl' 'glib2' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libsecret')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/umutsevdi/imza/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${_dl}/imza-${pkgver}-linux-x64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${_dl}/imza-${pkgver}-linux-arm64.deb")
noextract=("${pkgname}-${pkgver}-x86_64.deb" "${pkgname}-${pkgver}-aarch64.deb")
sha256sums=('35805e210349253055aa9d46b5d4534c5b00b0388a7061c75fc649c79156bcbc')
sha256sums_x86_64=('c639f59799417a22d9adddf6d2c907fb34ae931c8342e22aa3246cf5667b1a9f')
sha256sums_aarch64=('b69ea954c6f013303f821c5cdda2198eb6206636e2e26796ac5c7293f85e4b76')

prepare() {
  mkdir -p deb
  bsdtar -xOf "${pkgname}-${pkgver}-${CARCH}.deb" data.tar.gz | bsdtar -xf - -C deb
}

package() {
  cd deb/usr/local
  install -Dm755 bin/imza -t "${pkgdir}/usr/bin"
  sed '/^Actions=/d;/^#!/d' share/applications/imza.desktop > imza.desktop
  install -Dm644 imza.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 share/icons/hicolor/128x128/apps/imza.png -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  install -Dm644 share/doc/imza/README.txt share/doc/imza/CHANGELOG.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 share/doc/imza/LICENSE.thirdparty.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
