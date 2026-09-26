# Maintainer: cafreo

pkgname=wealthfolio-bin
_pkgname=Wealthfolio
pkgver=3.9.0
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
sha256sums_x86_64=('8003e375bd3ad791f4a6f45ee49e5d160873528d7911f06c90dd27f17ca8e669')
sha256sums_aarch64=('0b3187eab79c86032a5e4e977eed603e363e20be5348b572d49382b4f82b1b8f')
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
