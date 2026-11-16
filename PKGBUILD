# Maintainer: Serge <arch@phnx47.net>

_pkgname=renovate
pkgname="${_pkgname}-git"
pkgver=44.244.2.r3.gb005ee4
pkgrel=1
pkgdesc="Automated dependency update tool (git-latest)"
arch=('any')
depends=('nodejs>=24.11.0' 'nodejs<27')
makedepends=('git' 'pnpm' 'semver')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url="https://github.com/renovatebot/renovate"
license=('AGPL-3.0-only')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

_check_node() {
  current_node="$(node -v)"
  expected_node="$(pnpm pkg get engines.node --loglevel=error)"
  if ! semver -r "${expected_node}" "${current_node}" > /dev/null; then
    echo -e "Using the wrong version of Node.js! Expected '\e[32m${expected_node}\e[0m' but using '\e[31m${current_node}\e[0m'."
    exit 1
  fi
}

prepare() {
  cd "${pkgname}"

  _check_node
  sed -i "s/\"version\": \"[^\"]*\"/\"version\": \"$(git describe --abbrev=0 --tags)\"/" package.json
}

build() {
  cd "${pkgname}"

  pnpm install --frozen-lockfile
  pnpm build
}

package() {
  cd "${pkgname}"

  install -dm 755 "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  cp -r "dist" "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  cp -r "node_modules" "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  cp "package.json" "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  cp "renovate-schema.json" "${pkgdir}/usr/lib/node_modules/${_pkgname}"

  chmod 775 "${pkgdir}/usr/lib/node_modules/${_pkgname}/dist/renovate.js"
  chmod 775 "${pkgdir}/usr/lib/node_modules/${_pkgname}/dist/config-validator.js"

  install -dm 755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/node_modules/${_pkgname}/dist/renovate.js" "${pkgdir}/usr/bin/${_pkgname}"
  ln -s "/usr/lib/node_modules/${_pkgname}/dist/config-validator.js" "${pkgdir}/usr/bin/${_pkgname}-config-validator"
}

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
