# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Ivelin Velkov <ivelin dot velkov at gmail dot com>

pkgname=teams-for-linux
pkgver=1.0.68
pkgrel=1
pkgdesc="Unofficial Microsoft Teams client for Linux using Electron."
arch=("aarch64" "armv7h" "i686" "x86_64")
url="https://github.com/IsmaelMartinez/${pkgname}"
license=("GPL3")
depends=("gtk3" "libxss" "nss")
makedepends=("node-gyp" "yarn")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/IsmaelMartinez/${pkgname}/archive/v${pkgver}.tar.gz"
  "${pkgname}.desktop"
)
sha256sums=(
  "d4600601b303eb6f53396a61f7cb53a08952ea30c574753cee213e4146ee696a"
  "4aa7c4aa178ba4e0f97f9ff4a514764a03b332978495d5e7f2dc1ce3f74db615"
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  yarn install --non-interactive --pure-lockfile --cache-folder "${srcdir}/yarn-cache"
  if [[ ${CARCH} == "aarch64" ]]; then
    yarn electron-builder build --arm64 --linux dir
  elif [[ ${CARCH} == "armv7h" ]]; then
    yarn electron-builder build --armv7l --linux dir
  elif [[ ${CARCH} == "i686" ]]; then
    yarn electron-builder build --ia32 --linux dir
  elif [[ ${CARCH} == "x86_64" ]]; then
    yarn electron-builder build --x64 --linux dir
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
