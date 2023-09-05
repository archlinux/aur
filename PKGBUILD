# Maintainer: malwareslayer <dwi-mulia-mokoginta@protonmail.com>

# Reference PKGBUILD: https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=whatsapp-nativefier

_name=devdocs
pkgname="${_name}"-nativefier
pkgver=2023.09.05
pkgrel=1
pkgdesc="DevDocs Desktop Nativefier"
arch=("x86_64")
url="https://devdocs.io/"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("nodejs-nativefier")
source=(
  "${_name}.ico"
  "${_name}.png"
  "${_name}.desktop"
  LICENSE::https://raw.githubusercontent.com/freeCodeCamp/devdocs/main/LICENSE
)
sha256sums=(
  "d1db8463695274e046e8c881e9719e86215a767fbe1765ecd6bbd50726e9e3c5"
  "5c9849cc8da8a9224a049729168656fa3ded623e245c4216e86cc51f3c3541d3"
  "2f130cf1277d9d5f2a99d9b29cb274647477991bda83e36f03cde81fb812ec43"
  "1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5"
)

build() {
  cd "${srcdir}"

  nativefier \
    --name "DevDocs" \
    --icon "${_name}.ico" \
    --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36" \
    --verbose \
    --single-instance \
    --tray \
    "${url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}
  install -Dm644 "${srcdir}/${_name}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  _folder="$(ls "${srcdir}" | grep "[dD]ev[dD]ocs-linux-")"
  _binary="$(ls "${srcdir}/${_folder}" | grep "[dD]ev[dD]ocs")"
  
  cp -rL "${srcdir}/${_folder}" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
  
  for _size in "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${_name}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  done
}
