# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Felix Golatofski <contact@xdfr.de>

_appname=ledger-live-desktop
pkgname=ledger-live
pkgdesc="Maintain your Ledger devices"
_electron='electron32'
_sha='c41378dc2620c366a46e01b36a1e8af03c8e9e62'
_short_sha="${_sha::7}"
pkgver=2.91.1
pkgrel=1
arch=('x86_64')
_gh_owner='LedgerHQ'
_gh_repo='ledger-live'
url='https://www.ledger.com/ledger-live'
license=('MIT')
depends=('ledger-udev' "${_electron}")
makedepends=('node-gyp' 'pnpm' 'nvm')
source=("${pkgname}-${pkgver}-${_short_sha}.tar.gz::https://api.github.com/repos/${_gh_owner}/${_gh_repo}/tarball/${_sha}"
        "${_appname}.sh")
sha512sums=('519e671d6c3a22be7cf5ae3a759e7cdc425909e53a319c9d705e4098d12d8a3ba0e45287d95682ed7d5984755df32df37172eca47a9376aecd4020d5e8a06ba9'
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
  cd "${_gh_owner}-${_gh_repo}-${_short_sha}"

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

  cd "${_gh_owner}-${_gh_repo}-${_short_sha}/apps/${_appname}"

  install -Dm 644 "dist/__appImage-x64/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  install -Dm 755 "dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${_appname}"

  install -Dm 644 "build/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_appname}.png"
  for i in 128 256 512 1024; do
    install -Dm 644 "build/icons/icon@${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_appname}.png"
  done

  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
