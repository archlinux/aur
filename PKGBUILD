# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: mrAppleXZ <mr.applexz@gmail.com> 

pkgname=blockbench
_pkgname=Blockbench
pkgver=4.7.0
pkgrel=1
pkgdesc="A low-poly 3D model editor"
arch=('x86_64')
url="https://blockbench.net/"
license=('GPL3')
provides=(blockbench)
conflicts=(blockbench)

_pkgname=blockbench
_electron=electron
_electronDist=/usr/lib/${_electron}
_electronVersion=$(cat ${_electronDist}/version)

depends=("${_electron}" 'giblib')
makedepends=(git npm)
source=("${_pkgname}::git+https://github.com/JannisX11/blockbench.git#tag=v${pkgver}"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            '74731a9f68dbef112c93dafee1a1a8665b9de0816f94643169419ad838dbf66c')

prepare() {
  cd "${srcdir}/${_pkgname}"
  npm install
}

build() {
  cd "${srcdir}/${_pkgname}"
  npm run dist -- --linux --x64 --dir -c.electronDist=${_electronDist} -c.electronVersion=${_electronVersion}
}

package() {
  install -d "${pkgdir}/usr/"{bin,share/{pixmaps,applications}}
  install -d "${pkgdir}/${_electronDist}/resources"
  echo -e "#!/bin/bash\nexec ${_electron} ${_electronDist}/resources/${_pkgname}.asar \"\$@\"" > "${pkgdir}/usr/bin/${_pkgname}"
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"
  install "${srcdir}/${_pkgname}/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install "${srcdir}/${_pkgname}/dist/linux-unpacked/resources/app.asar" "${pkgdir}/${_electronDist}/resources/${_pkgname}.asar"
  cp -r "${srcdir}/${_pkgname}/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/${_electronDist}/resources/${_pkgname}.asar.unpacked"
}
