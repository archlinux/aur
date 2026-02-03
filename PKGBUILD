pkgname=prizrak-box-bin
_pkgname=Prizrak-Box
pkgver=1.0.21_alpha8
_electronversion=36
pkgrel=1
pkgdesc="A Simple Mihomo GUI.(Prebuilt version.Use system-wide electron)"
arch=('aarch64' 'x86_64')
url="https://github.com/legiz-ru/prizrak-box"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=("electron${_electronversion}")
makedepends=('asar')
source=("prizrak-box.sh")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.zst::${url}/releases/download/v1.0.21-alpha8/linux-arm64-aur.tar.zst")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.zst::${url}/releases/download/v1.0.21-alpha8/linux-amd64-aur.tar.zst")
sha256sums=('4497d4c2cfb24ca0665cbeabf377a6bc850a8cfd6dd17469b0dc937a9ed6bf65')
sha256sums_aarch64=('2f7dcc4a5c3f7bbbe0f7fa75d01c989e5ef4593c9a4e7e7c56ac87a9e1372043')
sha256sums_x86_64=('440edab94449213fb217d3065ec0d8e3105db104beb0e569cf930e2c84d998e2')

_get_electron_version() {
  _elec_ver="$(strings "${srcdir}/usr/lib/${_pkgname}/${_pkgname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
  echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}

prepare() {
  sed -i -e "
    s/@electronversion@/${_electronversion}/g
    s/@appname@/${pkgname%-bin}/g
    s/@runname@/app.asar/g
    s/@cfgdirname@/${_pkgname}/g
    s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
  " "${srcdir}/prizrak-box.sh"

  _get_electron_version

  sed -i -e "
    s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
    s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
  " "${srcdir}/usr/share/applications/${_pkgname}.desktop"

  asar e "${srcdir}/usr/lib/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
  find "${srcdir}/app.asar.unpacked/.vite" -type f -exec sed -i "s/process.resourcesPath/'\/usr\/lib\/${pkgname%-bin}'/g" {} +
  asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}

package() {
  install -Dm755 "${srcdir}/prizrak-box.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
  install -Dm755 "${srcdir}/usr/lib/${_pkgname}/resources/px" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
  install -Dm755 "${srcdir}/usr/lib/${_pkgname}/resources/px-service" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
  install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
  install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
  install -Dm644 "${srcdir}/usr/share/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
