# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgname=renovate
pkgname=renovate-git
pkgver=34.26.2.r0.g6c4864365c
pkgrel=1
pkgdesc="Renovate - Dependency update tool (Git version)"
arch=(any)
depends=('nodejs>=14')
makedepends=('git' 'yarn' 'npm' 'node-gyp')
provides=("${_pkgname}")
conflicts=("nodejs-renovate")
url="https://github.com/renovatebot/renovate"
license=('AGPL3')
source=("${pkgname}::git+https://github.com/renovatebot/renovate")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  yarn version --no-git-tag-version --new-version "$(git describe --abbrev=0 --tags)"
  yarn install
  yarn build
}

package() {
  install -dm755 "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  cp -r "${srcdir}/${pkgname}/dist" "${pkgdir}/usr/lib/node_modules/${_pkgname}/dist"
  cp -r "${srcdir}/${pkgname}/package.json" "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  cp -r "${srcdir}/${pkgname}/renovate-schema.json" "${pkgdir}/usr/lib/node_modules/${_pkgname}"

  chmod 775 "${pkgdir}/usr/lib/node_modules/${_pkgname}/dist/renovate.js"
  chmod 775 "${pkgdir}/usr/lib/node_modules/${_pkgname}/dist/config-validator.js"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/node_modules/${_pkgname}/dist/renovate.js" "${pkgdir}/usr/bin/$_pkgname"

  install -Dm644 "${srcdir}/${pkgname}/license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  yarn install --prod
  find "node_modules" -type d -exec chmod 755 {} +
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
