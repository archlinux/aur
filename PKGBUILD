# Maintainer: Ralf Meyer <dev dot ralfmeyer at gmail dot com>

_pkgname=kubenav
pkgname=${_pkgname}-bin
pkgver=3.9.0
pkgrel=1
pkgdesc="kubenav is the navigator for your Kubernetes clusters right in your pocket"
arch=("x86_64")
url="https://kubenav.io"
license=("MIT")
# depends on imagemagick to resize icons
makedepends=("imagemagick")
# We cannot strip the zip file binary otherwise it will cause an invalid binary
options=(!strip)
source=(
  "${_pkgname}.png"
  "${_pkgname}.desktop"
  "${_pkgname}.sh"
  "https://raw.githubusercontent.com/${_pkgname}/${_pkgname}/master/LICENSE"
  "${_pkgname}::https://github.com/${_pkgname}/${_pkgname}/releases/download/${pkgver}/${_pkgname}-linux-amd64.zip"
)
sha256sums=(
  "517ed89a60aff62e88728a7dde46aa379dc13298ba8d9603b22e0f7c2d7acf44"
  "ccd171582ee890dc55bdc06a9c7e1da64ed06e40624fc08b4a41c7338bb69730"
  "a2116b86eaf46f1642d4ad0619a32afea98daef86f36d8381a4b2bd2863bb436"
  "56c443ef0e654b4568e4e2091a9ac016f6708421e03056f119d610ee95ad0ae7"
  "cc0ff2346e78c6ad9f450ea05290f25a9ff54fd8c7fe330219fabe346b785a57"
)
_iconsha256sum=${sha256sums[0]}
_tmpdesktopfile="/tmp/${_pkgname}.desktop"

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}"/opt/${_pkgname}/${_pkgname}
  install -Dm755 "${srcdir}/${_pkgname}".sh "${pkgdir}"/usr/bin/${_pkgname}

  sed "s/Icon=kubenav/Icon=${_iconsha256sum}/g" "${srcdir}/${_pkgname}.desktop" > "${_tmpdesktopfile}"

  install -Dm644 "${_tmpdesktopfile}" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${_pkgname}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${_iconsha256sum}.png"
  done

  echo "  -> Fixing desktop entry..."
  	sed -i \
  		-e "/Exec=/i\StartupWMClass=kubenav" \
  		"$pkgdir"/usr/share/applications/"$_pkgname".desktop

}
