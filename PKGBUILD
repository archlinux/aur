_pkgname=fiji
pkgname=fiji-latest-bin
pkgver=20261030.1817
pkgrel=1
epoch=2
pkgdesc="Fiji is an image processing package, a “batteries-included” distribution of ImageJ2, bundling a lot of plugins which facilitate scientific image analysis."
arch=('x86_64')
url='http://fiji.sc/'
license=('GPL-3.0')
provides=("fiji=${pkgver}" "fiji-bin=${pkgver}")
conflicts=('fiji' 'fiji-bin')
replaces=('fiji-bin')
depends=(
  'freetype2'
  'libnet'
)
makedepends=('gendesk')
optdepends=('ttf-lucida-fonts: fix font rendering, see https://aur.archlinux.org/packages/fiji-bin#comment-1014013')
options=('!debug' '!strip')

source=("${pkgname}-${pkgver}.zip::https://downloads.imagej.net/fiji/archive/latest/${pkgver/./-}/fiji-latest-linux64-jdk.zip")
sha256sums=('a1c7996c9ed811966f706223a4aac32283e77e5c683741be2e422d43cf86d133')


prepare() {
  echo "Creating desktop file"
  gendesk -f -n --pkgname ${_pkgname} \
    --pkgdesc "${pkgdesc}" \
    --categories "Graphics;Science;ImageProcessing;" \
    --icon "${_pkgname}" \
    --exec ${_pkgname}
}

package()
{
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/pixmaps"
  mv "${srcdir}/Fiji" "${pkgdir}/opt/${_pkgname}"
  cp "${pkgdir}/opt/${_pkgname}/images/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  printf '#!/bin/sh\nexec /opt/%s/fiji-linux-x64 "$@"\n' "${_pkgname}" > "${pkgdir}/usr/bin/${_pkgname}"
  chmod +x "${pkgdir}/usr/bin/${_pkgname}"  
  install -Dm644 "${srcdir}/fiji.desktop" "${pkgdir}/usr/share/applications/fiji.desktop"
}
