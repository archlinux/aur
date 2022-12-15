# Maintainer: Atakku <atakkudev@gmail.com>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=blockbench-git
pkgver=v4.5.2.r10.gc8bae884
pkgrel=1
pkgdesc="A low-poly 3D model editor (git version)"
arch=('any')
url=https://github.com/JannisX11/blockbench
license=('GPL3')
provides=(blockbench)
conflicts=(blockbench)

_pkgname=blockbench
_electron=electron
_electronDist=/usr/lib/${_electron}
_electronVersion=$(cat ${_electronDist}/version)

depends=("${_electron}")
makedepends=(git npm)
source=("${_pkgname}::git+https://github.com/JannisX11/blockbench.git"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            '74731a9f68dbef112c93dafee1a1a8665b9de0816f94643169419ad838dbf66c')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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
