# Maintainer: Phillip Schichtel <phillip at schich dot tel>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Ivelin Velkov <ivelin dot velkov at gmail dot com>

pkgname=teams-for-linux
pkgver=2.11.1
pkgrel=1
pkgdesc="Unofficial Microsoft Teams client for Linux using Electron."
arch=("aarch64" "armv7h" "i686" "x86_64")
url="https://github.com/IsmaelMartinez/${pkgname}"
license=("GPL-3.0-only")
depends=("gtk3" "libxss" "nss")
optdepends=('libfido2: WebAuthn with FIDO2 devices')
makedepends=("nodejs>=18" "node-gyp" "npm")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/IsmaelMartinez/${pkgname}/archive/v${pkgver}.tar.gz"
  "${pkgname}.desktop"
)
sha256sums=('3348e3c8088bfeacaccb3e70c1b14680f03775953ce334b9af46c68de763340c'
            'e67c98084736f797c575970935dd773b5c348ea3d9522bc5db733a92361fc05e')

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
