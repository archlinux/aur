# Maintainer: DannyChain <dev@dannychain.anonaddy.me>

pkgname=app-outlet
pkgver=1.3.4
pkgrel=3
pkgdesc="A Universal linux app store"
url="https://app-outlet.github.io"
arch=("x86_64")
license=("MIT")
depends=()
makedepends=("nvm")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/app-outlet/app-outlet/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=("bb3a1aeffbac83a177f1e86f9cb02a5d18c93fd9c736ae65be31aa89fd146f68")

_ensure_local_nvm() {
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/${pkgname}-${pkgver}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  _ensure_local_nvm
  cd ${pkgname}-${pkgver}
  nvm install 10.16.3
}

build() {
  _ensure_local_nvm
  rm ${pkgname}-${pkgver}/electron-builder.json
  cp electron-builder.json ${pkgname}-${pkgver}/electron-builder.json
  cd ${pkgname}-${pkgver}
  npm install
  npm run electron:linux
}

package() {
  install -Dm644 ${pkgname}.desktop -t "${pkgdir}/usr/share/applications"
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "dist/favicon.512x512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "dist/linux-unpacked/." "$pkgdir/opt/${pkgname}"
}
