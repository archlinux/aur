#Maintainer: Plague-doctor <plague at privacyrequired dot com >

pkgver=1.7.2
pkgrel=1
PN="pcloud"
pkgname=pcloud-drive
pkgdesc="pCloud drive. Electron edition."

source_x86_64=("https://www.pcloud.com/pcloud") # Placeholder
arch=('x86_64')
url="https://www.pcloud.com"
_api_url="https://api.pcloud.com/getpublinkdownload?code="
_api_code="XZ1EnhkZnWhXYgODKIL9KCc6KgknuzhOr5MV"
makedepends=('jq' 'sed')
conflicts=('pcloud-git' 'pcloud')
depends=('gconf' 'fuse3')

md5sums_x86_64=('9c808b309033b9fff8aee1703f4e2883')
validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

prepare() {
  chmod +x ${pkgname}-${pkgver}-${pkgrel}
  ./${pkgname}-${pkgver}-${pkgrel} --appimage-extract
  find ${srcdir}/squashfs-root/ -type d -exec chmod 755 {} \;
}

package() {
  install -d "$pkgdir"/{/usr/bin,opt}
  cp -r "${srcdir}/squashfs-root" "${pkgdir}/opt/${PN}"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor"
  cp -r "${srcdir}/squashfs-root/usr/share/icons/" "${pkgdir}/usr/share/"
  ln -s "/opt/${PN}/${PN}" "${pkgdir}/usr/bin/${PN}"
  install -Dm644 "${srcdir}/squashfs-root/${PN}.desktop" "${pkgdir}/usr/share/applications/${PN}.desktop"
  sed -i 's/AppRun/pcloud/' "${pkgdir}/usr/share/applications/${PN}.desktop"
  sed -i 's/Name=pcloud/Name=pCloud/' "${pkgdir}/usr/share/applications/${PN}.desktop"
  chmod 755 "${pkgdir}/opt/${PN}"
}

_get_source() {
  source_x86_64=("${pkgname}-${pkgver}-${pkgrel}::http://$(curl "${_api_url}${_api_code}" 2> /dev/null | jq -r '.hosts[0] + .path')")
}

jq --version &>/dev/null && _get_source || true
