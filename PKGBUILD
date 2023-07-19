# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Felix Golatofski <contact@xdfr.de>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=ledger-live-desktop
pkgname=ledger-live
pkgdesc="Maintain your Ledger devices"
pkgver=2.64.1
pkgrel=1
arch=('x86_64')
url='https://github.com/LedgerHQ/ledger-live'
license=('MIT')
depends=('ledger-udev' 'electron25')
makedepends=('node-gyp' 'fnm' 'pnpm')
_extdir=ledger-live--ledgerhq-live-desktop-${pkgver}
source=("${_pkgbin}-${pkgver}.tar.gz::${url}/archive/refs/tags/@ledgerhq/live-desktop@${pkgver}.tar.gz"
        "${_pkgbin}.sh")
sha512sums=('65fb1922a66b11b2215bd8d39593ad48db87c3e7f60bdb5f2b7a3d0ef9360c16c613a810c3ddcf270bcfc2b1216582af1e04e065f002e19b2310a0d6057bba89'
            '2efbcd1da3ae4c84d9e3e9b2848e7535c1d3c533eb755f70d07992159742d7141d7e35b2590c51b799948965954c211e953d1ddb7a00bb8713ea06b58a732ca0')

_fnm_use() {
  export FNM_DIR="${srcdir}/.fnm"
  eval "$(fnm env --shell bash)"
  version="$(awk -F "=" '/node/ {print $2}' .prototools | xargs)"
  fnm use "${version}" --install-if-missing
}

build() {
  cd "${_extdir}"

  _fnm_use

  export GIT_REVISION="${pkgver}"
  pnpm i --filter="ledger-live-desktop..." --filter="ledger-live" --frozen-lockfile --unsafe-perm
  pnpm build:lld:deps
  pnpm desktop build

  # Correct .desktop
  sed -e "s/AppRun --no-sandbox/${_pkgbin}/g" -i "apps/${_pkgbin}/dist/__appImage-x64/${_pkgbin}.desktop"
  sed -e "/X-AppImage-Version/d" -i "apps/${_pkgbin}/dist/__appImage-x64/${_pkgbin}.desktop"
}

package() {
  install -Dm 755 "${_pkgbin}.sh" "${pkgdir}/usr/bin/${_pkgbin}"

  cd "${_extdir}/apps/${_pkgbin}"

  install -Dm 644 "dist/__appImage-x64/${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"
  install -Dm 755 "dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${_pkgbin}"

  install -Dm 644 "build/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgbin}.png"
  for i in 128 256 512 1024; do
    install -Dm 644 "build/icons/icon@${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgbin}.png"
  done

  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
