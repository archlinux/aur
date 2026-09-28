# Maintainer: cafreo

pkgname=wealthfolio-bin
_pkgname=Wealthfolio
pkgver=3.9.1
pkgrel=1
pkgdesc="A beautiful, private, local-first personal finance tracker. Investments, net worth, spending, and simulations."
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
sha256sums_x86_64=('0e1a4e3cb0860ab9e45aa2274f4cc7b244a704800fe4a513dd065e54af4e56c3')
sha256sums_aarch64=('95a75d6af66f708082c4237e4a02687f49a8c5879e3de413742041e6226f754a')
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
