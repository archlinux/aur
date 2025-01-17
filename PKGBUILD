# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname='densify'
pkgver=0.3.2
pkgrel=1
pkgdesc='GTK+ application to easily compress pdf files using Ghostscript'
arch=('any')
url='https://github.com/hkdb/Densify'
license=('MIT')
depends=('ghostscript' 'hicolor-icon-theme' 'python-gobject' 'xorg-xrandr')
makedepends=('gendesk' 'imagemagick')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f7baeb266a267c40fb0a289674786155b8c126108cc2297c3292c6e931b9f6ff')

prepare() {
  echo -e "#!/bin/sh\ncd /usr/share/${pkgname} && exec python ${pkgname}" > "${pkgname}"
  gendesk -f -n \
    --pkgname="${pkgname}" \
    --pkgdesc="${pkgdesc}" \
    --name="${pkgname^}" \
    --comment="${pkgdesc}" \
    --exec="${pkgname}" \
    --icon="${pkgname}" \
    --categories='Utility'
}

package() {
  install -Dvm755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

  for i in 16 22 24 32 48 64 96 128 256; do
    convert "${pkgname^d}-${pkgver}/desktop-icon.png" -resize "${i}x${i}" "icon${i}.png"
    install -Dvm644 "icon${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done

  cd "${pkgname^d}-${pkgver}"
  install -Dvm755 "${pkgname}" -t "${pkgdir}/usr/share/${pkgname}"
  install -Dvm644 {'header','icon'}.png -t "${pkgdir}/usr/share/${pkgname}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
