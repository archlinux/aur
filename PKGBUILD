# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
_npmname=node-red
pkgver=4.1.1
pkgname=nodejs-${_npmname}
pkgrel=1
pkgdesc="A visual tool for wiring the Internet of Things."
arch=(x86_64 i686 armv5 armv6h armv7h aarch64)
url="https://nodered.org"
license=("APACHE")
depends=("nodejs>=18" "npm")
makedepends=('desktop-file-utils' 'gendesk')
optdepends=()
backup=("etc/default/${pkgname}")
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz"
		"${pkgname}.service"
		"${pkgname}.default")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('bf4e7a0ae54720f6c58580a0743dc6d456fcf7366c18e99feae397f566964381'
            'cb3468c4f5c5883ed89aef13485c6c604d22f917cec714585dbadd4914fff3e8'
            'd08994475b06f270b2f1a2b3c99c22fd33f001dc2a10413460caded125f81f38')

prepare() {
  gendesk -f -n \
          --pkgname="${pkgname}" \
          --pkgdesc="${pkgdesc}" \
          --name="Node-RED" \
          --exec="${_npmname}" \
          --icon="${_npmname}" \
          --terminal=true \
          --categories="Development"
}

package() {
  install -Dm644 ${pkgname}.default "${pkgdir}/etc/default/${pkgname}"
  install -Dm644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  mkdir -p ${pkgdir}/usr/lib/node_modules
  cd ${pkgdir}/usr/lib/node_modules
  npm install --cache "${srcdir}/npm-cache" --global --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
  echo "u ${pkgname} - - /var/lib/${pkgname}" | install -Dm644 /dev/stdin "${pkgdir}"/usr/lib/sysusers.d/"${pkgname}".conf
  echo "d /var/lib/${pkgname} 0750 ${pkgname} ${pkgname} -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/scalable/apps
  ln -s /usr/lib/node_modules/node-red/node_modules/@node-red/editor-client/public/red/images/node-red.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_npmname}.svg
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
