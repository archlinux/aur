# Maintainer: Bryce Hoehn <17hoehbr@gmail.com>
pkgname=apple-music-electron
_pkgname=Apple-Music-Electron
pkgver=2.1.0
pkgrel=1
pkgdesc="Electron wrapper for Apple Music"
arch=("aarch64" "armv7h" "i686" "x86_64")
url="https://github.com/cryptofyre/${_pkgname}"
license=("MIT")
depends=('libxss')
makedepends=("yarn, git")
source=(
  "${_pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz"
  "${_pkgname}.desktop"
)

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
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
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -dm755 "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -r --preserve=mode "${srcdir}/${_pkgname}-${pkgver}/dist/linux-unpacked" "${pkgdir}/opt/${pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
sha256sums=('bbbdddd292fd590eb1278b9c5a608eb27fc65649cdf8c1981b3f955f312585ad'
            '5ee6328384f5afe500211dcfbe6a429ce29235439469c6d58c2ce65610c09ece')
