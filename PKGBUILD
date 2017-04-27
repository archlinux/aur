#Maintainer: Plague-doctor <plague at privacyrequired dot com >

pkgver=0.2.0
pkgrel=1
PN="pcloud-drive"
pkgname=${PN}
pkgdesc="pCloud drive. Electron edition.
         Please note: The electron edition is a very early beta. Black magic and voo-doo might happen. YOU'VE BEEN WARNED!"

source_x86_64=("https://www.pcloud.com/pcloud") # Placeholder
arch=('x86_64')
url="https://www.pcloud.com"
_api_url="https://api.pcloud.com/getpublinkdownload?code="
_api_code=XZqSHAZGI7JK9zFqjVUc2D1xlds6jz8DqsX

makedepends=('jq' 'sed')
conflicts=('pcloud-git' 'pcloud')

md5sums_x86_64=('64062eaa3b24ddff63268ed45f3476a8')
validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

package() {
  install -d "$pkgdir"/{/usr/bin,opt}
  cp -r "${srcdir}/usr" "${pkgdir}/opt/${PN}"
  ln -s "/opt/${PN}/bin/${PN}" "${pkgdir}/usr/bin/${PN}"
  install -Dm644 "${pkgdir}/opt/${PN}/share/icons/default/128x128/apps/pcloud-drive.png" \
                 "${pkgdir}/usr/share/pixmaps/${PN}.png"
  install -Dm644 "${PN}.desktop" "${pkgdir}/usr/share/applications/${PN}.desktop"
  sed -i 's/AppRun/pcloud-drive/' "${pkgdir}/usr/share/applications/${PN}.desktop"
  sed -i 's/Name=pcloud/Name=pCloud\ drive/' "${pkgdir}/usr/share/applications/${PN}.desktop"
}

_get_source() {
  source_x86_64=("http://$(curl "${_api_url}${_api_code}" 2> /dev/null | jq -r '.hosts[0] + .path')")
}

jq --version &>/dev/null && _get_source || true
