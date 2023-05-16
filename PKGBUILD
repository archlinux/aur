# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Felix Golatofski <contact@xdfr.de>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=ledger-live-desktop
pkgname=ledger-live
pkgdesc="Ledger Live - Desktop"
pkgver=2.58.0
pkgrel=1
arch=('x86_64')
url='https://github.com/LedgerHQ/ledger-live'
license=('MIT')
depends=('ledger-udev' 'electron23')
makedepends=('node-gyp' 'proto')
_extdir="ledger-live--ledgerhq-live-desktop-${pkgver}"
source=("${_pkgbin}-${pkgver}.tar.gz::${url}/archive/refs/tags/@ledgerhq/live-desktop@${pkgver}.tar.gz"
        "${_pkgbin}.sh")
sha512sums=('e397eee65aea4f21e544d33af5a4e9acf810c198998cda949ed65ea360b81a8fff4218ddec0ff8d6681b3f69df75c447165b8f46ba030ae7f7a575e1646d8aa4'
            '15f6703121d1f2df2dab494efd645ef27830b5cff41184483c75a21545d79b183ababb47bebc8571c7f77e562497efc2453c3e41b59e40ad03be2baacf20148e')

_proto_use() {
  export PROTO_ROOT="${srcdir}/.proto"
  export PATH="${PROTO_ROOT}/bin:${PATH}"
  proto use
}

build() {
  cd "${_extdir}"

  _proto_use

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
