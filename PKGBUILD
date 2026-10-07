# Maintainer: cafreo 

_pkgname=hoard
__pkgname=Hoard
pkgname=${_pkgname}-bin
pkgver=1.2.1
pkgrel=2
pkgdesc="Automatic, versioned game save sync across devices."
arch=('x86_64' 'aarch64')
url='https://github.com/rleeon/hoard'
license=('AGPL3')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3')
options=('!debug')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}_${pkgver}_x86_64.deb"::"$url/releases/download/v${pkgver}/${__pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}_${pkgver}_aarch64.deb"::"$url/releases/download/v${pkgver}/${__pkgname}_${pkgver}_arm64.deb")
sha256sums_x86_64=('a118db7511e39a17fe10997a077e161d267fee0ea458bfd973d3a8449ec44df7')
sha246sums_aarch64=('e99a8fa8e36d702cfffb41e76e8696a0ca7e7a18d8c1247a0579ce802704050a')

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
  install -Dm755 "${srcdir}/usr/bin/${_pkgname}-desktop" "${pkgdir}/usr/bin/${pkgname%-bin}-desktop"

  # desktop file
  install -Dm644 "${srcdir}/usr/share/applications/${__pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

  # icon images
  local _icon_sizes=(32x32 128x128 256x256@2)
  for size in "${_icon_sizes[@]}";do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}/apps/${_pkgname}-desktop.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname%-bin}-desktop.png"
  done 
}


