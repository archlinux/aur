# Maintainer: agony <27015 at riseup dot net>

pkgname=safe-chain
pkgver=1.5.30
pkgrel=1
pkgdesc='Protect against malicious code installed via npm, yarn, pnpm, pip, uv and poetry'
arch=('any')
url='https://github.com/AikidoSec/safe-chain'
license=('AGPL-3.0-or-later')
depends=('bash' 'nodejs')
makedepends=('npm')
optdepends=('npm: wrap npm and npx'
            'yarn: wrap yarn'
            'pnpm: wrap pnpm and pnpx'
            'bun: wrap bun and bunx'
            'python-pip: wrap pip'
            'python-pipx: wrap pipx'
            'uv: wrap uv and uvx'
            'python-poetry: wrap poetry'
            'python-pdm: wrap pdm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ca76c646f11d8e42669f3026e9e0192094a102bb2c111577ecbcb661451d4faa')

_safe_chain_env() {
  export HOME="${srcdir}/home"
  export XDG_CONFIG_HOME="${HOME}/.config"
  export XDG_DATA_HOME="${HOME}/.local/share"
  export npm_config_cache="${srcdir}/npm-cache"
  mkdir -p "${HOME}"
}

prepare() {
  cd "${pkgname}-${pkgver}"
  _safe_chain_env
  sed -i "s/\"version\": \"[^\"]*\"/\"version\": \"${pkgver}\"/" packages/safe-chain/package.json
  cp npm-shrinkwrap.json package-lock.json
  npm ci --omit=dev --ignore-scripts --no-audit --no-fund --workspace=packages/safe-chain
}

check() {
  cd "${pkgname}-${pkgver}"
  _safe_chain_env
  [[ "$(packages/safe-chain/bin/safe-chain.js --version)" == "Current safe-chain version: ${pkgver}" ]]
  [[ "$(packages/safe-chain/bin/safe-chain.js npm safe-chain-verify)" == 'OK: Safe-chain works!' ]]
}

package() {
  cd "${pkgname}-${pkgver}"
  local _dest="${pkgdir}/usr/lib/node_modules/@aikidosec/safe-chain"
  install -d "${_dest}" "${pkgdir}/usr/bin"
  cp -r packages/safe-chain/{bin,src,package.json} "${_dest}/"
  cp -r node_modules "${_dest}/"
  rm -r "${_dest}"/node_modules/{.bin,@aikidosec,.package-lock.json}
  for program in "${_dest}"/bin/*.js; do
    program="${program##*/}"
    ln -s "/usr/lib/node_modules/@aikidosec/safe-chain/bin/${program}" "${pkgdir}/usr/bin/${program%.js}"
  done
}
