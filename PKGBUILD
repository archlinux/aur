# Maintainer: cafreo

pkgname=wealthfolio-bin
_pkgname=Wealthfolio
pkgver=3.6.3
pkgrel=1
pkgdesc="A Beautiful and Boring Investment Tracker, with Local Data Storage. No Subscriptions, No Cloud."
arch=('x86_64' 'aarch64')
url="https://wealthfolio.app/"
license=('AGPL-3.0')
groups=()
depends=('curl' 'wget' 'gtk3' 'webkit2gtk-4.1')
makedepends=()
checkdepends=()
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=("${_pkgname}_${pkgver}_x86_64.deb::https://github.com/wealthfolio/${pkgname%-bin}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}_${pkgver}_aarch64.deb::https://github.com/wealthfolio/${pkgname%-bin}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
noextract=()
sha256sums_x86_64=('aef246a372344445f530ae0cc6b2a4f584c1ca94b5e854d53e9f85045f3e9d5e')
sha256sums_aarch64=('f3041062cdfea3bcc31af1e86bfa69b74286233ccbf6ee1fb0d4d208ec49cc3e')
validpgpkeys=()

prepare() {
    cd "${srcdir}" 
    bsdtar -xf "${_pkgname}_${pkgver}_$CARCH.deb" data.tar.*
    bsdtar -xf data.tar.* -C "${srcdir}"
    sed -i "s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i "s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}

package() {
  # bin
  install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"

  # desktop file
  install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

  # icon images
  local _icon_sizes=(32x32 128x128 256x256@2)
  for size in "${_icon_sizes[@]}";do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname%-bin}.png"
  done 
}
