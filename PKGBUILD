# Maintainer: cafreo 

_pkgname=hoard
__pkgname=Hoard
pkgname=${_pkgname}-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Automatic, versioned game save sync across devices."
arch=('x86_64' 'aarch64')
url='https://github.com/rleeon/hoard'
license=('AGPL3')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3')
options=('!debug')
provides=("${_pkgname}" "${_pkgname}d" "${_pkgname}-desktop")
conflicts=("${_pkgname}" "${_pkgname}-cli")

source_x86_64=("${_pkgname}_${pkgver}_x86_64.deb"::"$url/releases/download/v${pkgver}/${__pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}_${pkgver}_aarch64.deb"::"$url/releases/download/v${pkgver}/${__pkgname}_${pkgver}_arm64.deb")
sha256sums_x86_64=('3281634d02bf313059e84d62bb3e490b7cb43877bfec0721a23748dc5242fedc')
sha246sums_aarch64=('0237c801731bea9317ddfa12f44ec6492eb6aadcfeb366e31b941f8b73650cec')

prepare() {
    cd "${srcdir}" 
    bsdtar -xf "${_pkgname}_${pkgver}_$CARCH.deb" data.tar.*
    bsdtar -xf data.tar.* -C "${srcdir}"
    sed -i "s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${__pkgname}.desktop"
    sed -i "s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${__pkgname}.desktop" 
}

package() {
  # bin
  install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm755 "${srcdir}/usr/bin/${_pkgname}d" "${pkgdir}/usr/bin/${pkgname%-bin}d"
  install -Dm755 "${srcdir}/usr/bin/${_pkgname}-desktop" "${pkgdir}/usr/bin/${pkgname%-bin}-desktop"

  # desktop file
  install -Dm644 "${srcdir}/usr/share/applications/${__pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

  # icon images
  local _icon_sizes=(32x32 128x128 256x256@2)
  for size in "${_icon_sizes[@]}";do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}/apps/${_pkgname}-desktop.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname%-bin}-desktop.png"
  done 
}


