# Maintainer: agony <27015 at riseup dot net>

pkgname=npq
pkgver=3.27.5
pkgrel=1
pkgdesc='Safely install npm packages by auditing them before the install stage'
arch=('any')
url='https://github.com/lirantal/npq'
license=('Apache-2.0')
depends=('nodejs>=24' 'npm>=11.10')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c6c16f76e4603b68cf721a38552f9fd1021647203e1206f713a6e6665cad1f6a')

_npm_env() {
  export HOME="${srcdir}/home"
  export XDG_CONFIG_HOME="${HOME}/.config"
  export XDG_DATA_HOME="${HOME}/.local/share"
  export npm_config_cache="${srcdir}/npm-cache"
  export npm_config_loglevel=error
  mkdir -p "${HOME}"
}

prepare() {
  cd "${pkgname}-${pkgver}"
  _npm_env
  npm ci --ignore-scripts --no-audit --no-fund
}

build() {
  cd "${pkgname}-${pkgver}"
  _npm_env
  rm -rf "${srcdir}/pack" "${srcdir}/dist"
  mkdir "${srcdir}/pack" "${srcdir}/dist"
  npm pack --ignore-scripts --pack-destination "${srcdir}/pack"
  tar -xf "${srcdir}"/pack/*.tgz -C "${srcdir}/dist" --strip-components=1
  cp package-lock.json "${srcdir}/dist/"
  cd "${srcdir}/dist"
  npm pkg set version="${pkgver}"
  npm ci --omit=dev --ignore-scripts --offline --no-audit --no-fund
  rm package-lock.json README.md LICENSE
}

check() {
  cd "${pkgname}-${pkgver}"
  _npm_env
  NODE_OPTIONS=--disable-warning=ExperimentalWarning node_modules/.bin/jest --collectCoverage=false --silent --reporters=summary < /dev/null
}

package() {
  install -d "${pkgdir}/usr/lib/node_modules" "${pkgdir}/usr/bin"
  cp -a "${srcdir}/dist" "${pkgdir}/usr/lib/node_modules/${pkgname}"
  ln -s "../lib/node_modules/${pkgname}/bin/npq.js" "${pkgdir}/usr/bin/npq"
  ln -s "../lib/node_modules/${pkgname}/bin/npq-hero.js" "${pkgdir}/usr/bin/npq-hero"
}
