# Maintainer: Serge K <arch@phnx47.net>

_appname=ledger-live-desktop
_pkgname=ledger-live
pkgname="${_pkgname}-git"
_electron='electron38'
pkgver=2.133.0.r0.gb870b80
pkgrel=1
pkgdesc="Maintain your Ledger devices (git-main)"
arch=('x86_64')
url='https://github.com/LedgerHQ/ledger-live'
license=('MIT')
depends=('ledger-udev' "${_electron}")
makedepends=('git' 'node-gyp' 'python' 'pnpm' 'nvm' 'desktop-file-utils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}#branch=main"
        "${_appname}.sh")
sha512sums=('SKIP'
            '70effe952d7007e79e43523f5e8d868228eedb5049465c2ebea017f9c8b0b25f82e0c6f56cef59e40479d29149969cde8e7098edf8a0cad7b23a9a123e5f0755')

_nvm_install() {
  export NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install "$(awk -F "=" '/node/ {print $2}' .prototools | xargs)"
}

_check_electron() {
  expected_electron="electron$(grep -E '^\s+electron:' ${pkgname}/pnpm-workspace.yaml | awk '{print $2}' | cut -d. -f1)"
  if [[ "${_electron}" != "${expected_electron}" ]]; then
    echo -e "Using the wrong version of Electron! Expected '\e[32m${expected_electron}\e[0m' but using '\e[31m${_electron}\e[0m'."
    exit 1
  fi
}

prepare() {
  _check_electron
  sed -i "s~@ELECTRON@~${_electron}~" "${_appname}.sh"
}

build() {
  cd "${pkgname}"

  _nvm_install

  export UV_USE_IO_URING=0
  pnpm i --filter="${_appname}..." --filter="ledger-live" --frozen-lockfile --unsafe-perm
  pnpm build:lld:deps
  pnpm desktop build

  desktop-file-edit \
    --set-key=Exec \
    --set-value="${_appname} %U" \
    --add-category=Network \
    --remove-key=X-AppImage-Version \
    "apps/${_appname}/dist/__appImage-x64/${_appname}.desktop"
}

package() {
  install -Dm 755 "${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"

  cd "${pkgname}/apps/${_appname}"

  install -Dm 644 "dist/__appImage-x64/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  install -Dm 755 "dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${_appname}"

  install -Dm 644 "build/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_appname}.png"
  for i in 128 256 512 1024; do
    install -Dm 644 "build/icons/icon@${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_appname}.png"
  done

  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 --match '@ledgerhq/live-desktop@*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' | cut -d@ -f3
}
