# Maintainer: David Birks <david@birks.dev>

pkgname=dishylink
pkgver=1.3.0
pkgrel=1
pkgdesc="Desktop app to monitor the performance and health of your Starlink"
arch=('any')
url="https://dishylink.com"
license=('MIT')
depends=('electron')
makedepends=('nodejs' 'npm')
source=("${pkgname}-${pkgver}-sources.zip::https://github.com/DaveyHert/Dishylink/releases/download/v${pkgver}/dishylink-${pkgver}-sources.zip"
  'dishylink.desktop')
b2sums=('d00be799866179740328b3c61a8ec07cbded34dcf07c88fb50951692004687f05955737999386eacabcb5ddf09f881b6afe2c1b8523bcd05117582e53bb9a19e'
        'SKIP')

build() {
  cd "${srcdir}"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  npm ci --ignore-scripts
  npx tsc -b
  ELECTRON=1 npx vite build
}

package() {
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -a dist dist-electron "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 build/icon.png "${pkgdir}/usr/lib/${pkgname}/build/icon.png"
  install -m644 build/trayTemplate.png "build/trayTemplate@2x.png" \
    "build/trayTemplateOutline.png" "build/trayTemplateOutline@2x.png" \
    "${pkgdir}/usr/lib/${pkgname}/build/"
  install -m644 package.json "${pkgdir}/usr/lib/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  printf '#!/bin/sh\nexec electron /usr/lib/%s "$@"\n' "${pkgname}" > "${pkgdir}/usr/bin/${pkgname}"
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/dishylink.desktop" \
    "${pkgdir}/usr/share/applications/dishylink.desktop"
  install -Dm644 "${srcdir}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
