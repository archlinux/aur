# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Felix Golatofski <contact@xdfr.de>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=ledger-live-desktop
pkgname=ledger-live
pkgdesc="Maintain your Ledger devices"
pkgver=2.66.0
pkgrel=1
arch=('x86_64')
url='https://github.com/LedgerHQ/ledger-live'
license=('MIT')
depends=('ledger-udev' 'electron25')
makedepends=('node-gyp' 'fnm' 'pnpm')
source=("${_pkgbin}-${pkgver}.tar.gz::https://api.github.com/repos/LedgerHQ/ledger-live/tarball/@ledgerhq/live-desktop@${pkgver}"
        "${_pkgbin}.sh")
sha512sums=('6f2ed6cd0b409f609f28a88a7a1be14df7bf1b3637b8f8052071433a08f925ffbb1d93da1217a290f241054ddd8e29711fbd6f57b70d839cf34fecb6d08da307'
            '2efbcd1da3ae4c84d9e3e9b2848e7535c1d3c533eb755f70d07992159742d7141d7e35b2590c51b799948965954c211e953d1ddb7a00bb8713ea06b58a732ca0')

_fnm_use() {
  export FNM_DIR="${srcdir}/.fnm"
  eval "$(fnm env --shell bash)"
  version="$(awk -F "=" '/node/ {print $2}' .prototools | xargs)"
  fnm use "${version}" --install-if-missing
}

build() {
  cd LedgerHQ-ledger-live-*

  _fnm_use

  export GIT_REVISION="${pkgver}"
  pnpm i --filter="${_pkgbin}..." --filter="ledger-live" --frozen-lockfile --unsafe-perm
  pnpm build:lld:deps
  pnpm desktop build

  # Correct .desktop
  sed -e "s/AppRun --no-sandbox/${_pkgbin}/g" -i "apps/${_pkgbin}/dist/__appImage-x64/${_pkgbin}.desktop"
  sed -e "/X-AppImage-Version/d" -i "apps/${_pkgbin}/dist/__appImage-x64/${_pkgbin}.desktop"
}

package() {
  install -Dm 755 "${_pkgbin}.sh" "${pkgdir}/usr/bin/${_pkgbin}"

  cd LedgerHQ-ledger-live-*/apps/"${_pkgbin}"

  install -Dm 644 "dist/__appImage-x64/${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"
  install -Dm 755 "dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${_pkgbin}"

  install -Dm 644 "build/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgbin}.png"
  for i in 128 256 512 1024; do
    install -Dm 644 "build/icons/icon@${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgbin}.png"
  done

  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
