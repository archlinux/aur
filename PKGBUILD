# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=imza-bin
pkgver=0.8.0
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
sha256sums_x86_64=('b143f6195d524611e3a6dad6794ade341d5725c9030373ea0ec1e65fd0f6f5a5')
sha256sums_aarch64=('d50422b7d01f350d014228fcd19be2a63624fecbca752e5d83a5065f5c897479')

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
