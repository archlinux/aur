# Maintainer: Bryce Hoehn <17hoehbr@gmail.com>
pkgname=apple-music-electron
pkgver=1.2.2
pkgrel=1
pkgdesc="Electron wrapper for Apple Music"
arch=("aarch64" "armv7h" "i686" "x86_64")
url="https://github.com/17hoehbr/${pkgname}"
license=("MIT")
makedepends=("yarn")
source=(
  "${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz"
  "${pkgname}.desktop"
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
  cp -r --preserve=mode "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked" "${pkgdir}/opt/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  for _file in "${srcdir}/${pkgname}-${pkgver}/build/icons/"*.png
  do
    _filename="$(basename ${_file})"
    install -Dm644 "${_file}" "${pkgdir}/usr/share/icons/hicolor/${_filename%.png}/apps/${pkgname}.png"
  done
  ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
md5sums=('dcad0a8bfefa945bc95bb638568aa51c'
         '87f25a41dc4228254e64cad7da745ee3')
