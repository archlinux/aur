# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Based on the ledger-live-git AUR package
# Original Maintainer: Serge K <arch@phnx47.net>

_appname=ledger-live-desktop
_pkgname=ledger-live
pkgname="${_pkgname}-electron36-git"
_electron='electron36'
pkgver=r39814.gd6734a7dba
pkgrel=1
pkgdesc="Maintain your Ledger devices (git on thatonecalculator fork, security/upgrade-eol-electron branch)"
arch=('x86_64')
url='https://github.com/ThatOneCalculator/ledger-live'
license=('MIT')
depends=('ledger-udev' "${_electron}")
makedepends=('node-gyp' 'pnpm' 'nvm')
source=("${pkgname}::git+${url}#branch=security/upgrade-eol-electron"
        "${_appname}.sh")
sha512sums=('SKIP'
            '70effe952d7007e79e43523f5e8d868228eedb5049465c2ebea017f9c8b0b25f82e0c6f56cef59e40479d29149969cde8e7098edf8a0cad7b23a9a123e5f0755')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

_nvm_install() {
  export NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install "$(awk -F "=" '/node/ {print $2}' .prototools | xargs)"
}

prepare() {
  sed -i "s~@ELECTRON@~${_electron}~" "${_appname}.sh"

  cd "${pkgname}"
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  cd "${pkgname}"

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
    cd "${pkgname}" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
