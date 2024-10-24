# Maintainer: Phillip Schichtel <phillip at schich dot tel>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Ivelin Velkov <ivelin dot velkov at gmail dot com>

pkgname=teams-for-linux
pkgver=1.11.1
pkgrel=1
pkgdesc="Unofficial Microsoft Teams client for Linux using Electron."
arch=("aarch64" "armv7h" "i686" "x86_64")
url="https://github.com/IsmaelMartinez/${pkgname}"
license=("GPL-3.0-only")
depends=("gtk3" "libxss" "nss")
makedepends=("nodejs>=18" "node-gyp" "npm")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/IsmaelMartinez/${pkgname}/archive/v${pkgver}.tar.gz"
  "${pkgname}.desktop"
)
sha256sums=('669bb613ad99f4fd1c66c0013f1981819882ab11b586ff2ce0c226e516c63428'
            '4aa7c4aa178ba4e0f97f9ff4a514764a03b332978495d5e7f2dc1ce3f74db615')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm_config_cache="${srcdir}/package-cache" npm install
  if [[ ${CARCH} == "aarch64" ]]; then
    npx electron-builder build --arm64 --linux dir
  elif [[ ${CARCH} == "armv7h" ]]; then
    npx electron-builder build --armv7l --linux dir
  elif [[ ${CARCH} == "i686" ]]; then
    npx electron-builder build --ia32 --linux dir
  elif [[ ${CARCH} == "x86_64" ]]; then
    npx electron-builder build --x64 --linux dir
  fi

}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -dm755 "${pkgdir}/opt" "${pkgdir}/usr/bin"

  if [[ ${CARCH} == "aarch64" ]]; then
    _unpacked_dirname="linux-arm64-unpacked"
  elif [[ ${CARCH} == "armv7h" ]]; then
    _unpacked_dirname="linux-armv7l-unpacked"
  elif [[ ${CARCH} == "i686" ]]; then
    _unpacked_dirname="linux-ia32-unpacked"
  elif [[ ${CARCH} == "x86_64" ]]; then
    _unpacked_dirname="linux-unpacked"
  fi

  cp -r --preserve=mode "${srcdir}/${pkgname}-${pkgver}/dist/${_unpacked_dirname}" "${pkgdir}/opt/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  for _file in "${srcdir}/${pkgname}-${pkgver}/build/icons/"*.png
  do
    _filename="$(basename ${_file})"
    install -Dm644 "${_file}" "${pkgdir}/usr/share/icons/hicolor/${_filename%.png}/apps/${pkgname}.png"
  done
  ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
