# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Atakku <atakkudev@gmail.com>

pkgname=blockbench-git
_pkgname="${pkgname%-git}"
pkgver=5.1.6.r1.g47e633e4
pkgrel=1
pkgdesc='A low-poly 3D model editor (git version)'
arch=(x86_64 aarch64)
url='https://github.com/JannisX11/blockbench'
license=('GPL-3.0-or-later')
_electron=electron
depends=(
  "${_electron}"
  bash
  glibc
  imlib2
  libx11
)
makedepends=(git npm)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!debug)
source=("${_pkgname}::git+https://github.com/JannisX11/blockbench.git"
  "${_pkgname}.desktop")
sha256sums=('SKIP'
            '5a64727fcf696b3497190d441556322b4d0ffb70f560ba8eba6ef79ac5c36e8c')

pkgver() {
  cd "${_pkgname}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${_pkgname}"

  npm install
}

build() {
  cd "${_pkgname}"

  _electronDist=/usr/lib/${_electron}
  _electronVersion=$(cat ${_electronDist}/version)

  npm run publish-linux -- --linux --x64 --dir
}

package() {
  _electronDist=/usr/lib/${_electron}
  _electronVersion=$(cat ${_electronDist}/version)
  _electronVersionMajor=${_electronVersion%%.*}
  _electronDir=${_electronDist}${_electronVersionMajor}

  install -d "${pkgdir}/usr/"{bin,share/{pixmaps,applications}}
  install -d "${pkgdir}/${_electronDist}${_electronVersionMajor}/resources"

  echo -e "#!/bin/bash\nexec ${_electron} ${_electronDist}${_electronVersionMajor}/resources/${_pkgname}.asar \"\$@\"" > "${pkgdir}/usr/bin/${_pkgname}"
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

  install "${_pkgname}/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install "${_pkgname}/dist-electron/linux-unpacked/resources/app.asar" "${pkgdir}${_electronDist}${_electronVersionMajor}/resources/${_pkgname}.asar"
}
