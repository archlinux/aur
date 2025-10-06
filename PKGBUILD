# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Felix Golatofski <contact@xdfr.de>

_appname=ledger-live-desktop
pkgname=ledger-live
_electron='electron38'
pkgver=2.130.1
pkgrel=1
pkgdesc="Maintain your Ledger devices"
arch=('x86_64')
url='https://www.ledger.com/ledger-live'
license=('MIT')
depends=('ledger-udev' "${_electron}")
makedepends=('node-gyp' 'python' 'pnpm' 'nvm')
source=("${_appname}-${pkgver}.tar.gz::https://github.com/LedgerHQ/ledger-live/archive/@ledgerhq/live-desktop@${pkgver}.tar.gz"
        "${_appname}.sh")
sha512sums=('53279331c6a8f6587dd1f34276ff5dbd65058844d78d014a26f5325d453cd3ddb04237a8b0fb4076d8e412024e134f455900211d05876942908fa4cd68e8c8da'
            '70effe952d7007e79e43523f5e8d868228eedb5049465c2ebea017f9c8b0b25f82e0c6f56cef59e40479d29149969cde8e7098edf8a0cad7b23a9a123e5f0755')

_nvm_install() {
  export NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install "$(awk -F "=" '/node/ {print $2}' .prototools | xargs)"
}

prepare() {
  sed -i "s~@ELECTRON@~${_electron}~" "${_appname}.sh"
}

build() {
  cd "ledger-live--ledgerhq-live-desktop-${pkgver}"

  _nvm_install

  export UV_USE_IO_URING=0
  export GIT_REVISION="${pkgver}"
  pnpm i --filter="${_appname}..." --filter="ledger-live" --frozen-lockfile --unsafe-perm
  pnpm build:lld:deps
  pnpm desktop build

  sed -e "s/AppRun --no-sandbox/${_appname}/g" -i "apps/${_appname}/dist/__appImage-x64/${_appname}.desktop"
  sed -e "/X-AppImage-Version/d" -i "apps/${_appname}/dist/__appImage-x64/${_appname}.desktop"
}

package() {
  install -Dm 755 "${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"

  cd "ledger-live--ledgerhq-live-desktop-${pkgver}/apps/${_appname}"

  install -Dm 644 "dist/__appImage-x64/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  install -Dm 755 "dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${_appname}"

  install -Dm 644 "build/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_appname}.png"
  for i in 128 256 512 1024; do
    install -Dm 644 "build/icons/icon@${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_appname}.png"
  done

  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
