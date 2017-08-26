#Maintainer: Plague-doctor <plague at privacyrequired dot com >

pkgver=0.4.0
pkgrel=2
PN="pcloud"
pkgname="pcloud-drive"
pkgdesc="pCloud drive. Electron edition."

source_x86_64=("https://www.pcloud.com/pcloud") # Placeholder
arch=('x86_64')
url="https://www.pcloud.com"
_api_url="https://api.pcloud.com/getpublinkdownload?code="
_api_code=XZP9wiZMnCUoWjGnMhNgA4uAD52czcrPjLX
makedepends=('jq' 'sed')
conflicts=('pcloud-git' 'pcloud')

md5sums_x86_64=('11254617b943a3d4243d92804aea8722')
validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

package() {
  install -d "$pkgdir"/{/usr/bin,opt}
  cp -r "${srcdir}/usr" "${pkgdir}/opt/${PN}"
  ln -s "/opt/${PN}/bin/${PN}" "${pkgdir}/usr/bin/${PN}"
  install -Dm644 "${pkgdir}/opt/${PN}/share/icons/default/128x128/apps/pcloud.png" \
                 "${pkgdir}/usr/share/pixmaps/${PN}.png"
  install -Dm644 "${PN}.desktop" "${pkgdir}/usr/share/applications/${PN}.desktop"
  sed -i 's/AppRun/pcloud/' "${pkgdir}/usr/share/applications/${PN}.desktop"
  sed -i 's/Name=pcloud/Name=pCloud/' "${pkgdir}/usr/share/applications/${PN}.desktop"
}

_get_source() {
  source_x86_64=("${pkgname}-${pkgver}-${pkgrel}::http://$(curl "${_api_url}${_api_code}" 2> /dev/null | jq -r '.hosts[0] + .path')")
}

jq --version &>/dev/null && _get_source || true
