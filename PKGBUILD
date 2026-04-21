# Maintainer: JasonLandbridge

pkgname=omniroute-bin
pkgver=3.6.9
pkgrel=4
pkgdesc="OpenAI-compatible AI gateway with routing, retries, caching, and observability"
arch=('x86_64')
url="https://github.com/diegosouzapw/OmniRoute"
license=('MIT')
depends=('nodejs-lts-krypton')
makedepends=('npm' 'python')
optdepends=('systemd: user service management via systemctl --user')
install="${pkgname}.install"
options=('!strip')
source=(
  "${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/omniroute/-/omniroute-${pkgver}.tgz"
  'omniroute.sh'
  'omniroute.service'
  '.env.example'
)
sha512sums=(
  '3b2d6dcbd5b2dfe7639eccb6ebfe5c9152a093606ddf95da85ab818e7df2bb35f781088fcb1ced0bd2dc0c266ff2c8e8ef70c4d19c99b03543dd1eca47370826'
  'SKIP'
  'SKIP'
  'SKIP'
)

build() {
  local _pkgroot="${srcdir}/package"
  local _app_binary="${_pkgroot}/app/node_modules/better-sqlite3/build/Release/better_sqlite3.node"

  cd "${_pkgroot}"

  export HOME="${srcdir}/npm-home"
  export npm_config_cache="${srcdir}/npm-cache"
  export npm_config_build_from_source=true
  export npm_config_audit=false
  export npm_config_fund=false
  export npm_config_update_notifier=false

  mkdir -p "${HOME}" "${npm_config_cache}"

  npm install --omit=dev --ignore-scripts --no-audit --no-fund
  npm rebuild better-sqlite3 --build-from-source
  node scripts/postinstall.mjs

  [[ -f "${_app_binary}" ]] || {
    printf 'Missing repaired better-sqlite3 binary at %s\n' "${_app_binary}" >&2
    return 1
  }

  rm -rf "${_pkgroot}/node_modules"
}

package() {
  install -d "${pkgdir}/usr/lib/omniroute"
  cp -a "${srcdir}/package/." "${pkgdir}/usr/lib/omniroute/"

  install -Dm755 "${srcdir}/omniroute.sh" "${pkgdir}/usr/bin/omniroute"
  install -Dm644 "${srcdir}/omniroute.service" "${pkgdir}/usr/lib/systemd/user/omniroute.service"
  install -Dm644 "${srcdir}/.env.example" "${pkgdir}/usr/share/doc/${pkgname}/.env.example"
  install -Dm644 "${srcdir}/package/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
