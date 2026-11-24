# Maintainer: agony <27015 at riseup dot net>

pkgname=safe-chain-git
pkgver=r1613.bcd0336
pkgrel=1
pkgdesc='Protect against malicious code installed via npm, yarn, pnpm, pip, uv and poetry (git version)'
arch=('any')
url='https://github.com/AikidoSec/safe-chain'
license=('AGPL-3.0-or-later')
depends=('bash' 'nodejs')
makedepends=('git' 'npm')
optdepends=('npm: wrap npm and npx'
            'yarn: wrap yarn'
            'pnpm: wrap pnpm and pnpx'
            'bun: wrap bun and bunx'
            'python-pip: wrap pip'
            'python-pipx: wrap pipx'
            'uv: wrap uv and uvx'
            'python-poetry: wrap poetry'
            'python-pdm: wrap pdm')
provides=('safe-chain')
conflicts=('safe-chain')
source=("safe-chain::git+${url}.git")
sha256sums=('SKIP')

_safe_chain_env() {
  export HOME="${srcdir}/home"
  export XDG_CONFIG_HOME="${HOME}/.config"
  export XDG_DATA_HOME="${HOME}/.local/share"
  export npm_config_cache="${srcdir}/npm-cache"
  mkdir -p "${HOME}"
}

pkgver() {
  cd safe-chain
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd safe-chain
  _safe_chain_env
  cp npm-shrinkwrap.json package-lock.json
  npm ci --omit=dev --ignore-scripts --no-audit --no-fund --workspace=packages/safe-chain
}

build() {
  cd safe-chain
  sed -i "s/\"version\": \"[^\"]*\"/\"version\": \"$(git describe --tags)\"/" packages/safe-chain/package.json
}

check() {
  cd safe-chain
  _safe_chain_env
  [[ "$(packages/safe-chain/bin/safe-chain.js --version)" == "Current safe-chain version: $(git describe --tags)" ]]
  [[ "$(packages/safe-chain/bin/safe-chain.js npm safe-chain-verify)" == 'OK: Safe-chain works!' ]]
}

package() {
  cd safe-chain
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
