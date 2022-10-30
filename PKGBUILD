# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgname=renovate
pkgname=renovate-git
pkgver=34.9.1.r1.gae9cc2845e
pkgrel=1
pkgdesc="Renovate - Dependency update tool (Git version)"
arch=(any)
url="https://github.com/renovatebot/renovate"
source=("${pkgname}::git+https://github.com/renovatebot/renovate")
license=('AGPL3')
makedepends=('git' 'yarn')
depends=('nodejs>=14')
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  yarn version --no-git-tag-version --new-version "$(git describe --abbrev=0 --tags)"
  yarn install
  yarn build
}

package() {
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  cp -r "${srcdir}/${pkgname}/dist" "${pkgdir}/opt/${_pkgname}/dist"
  cp -r "${srcdir}/${pkgname}/package.json" "${pkgdir}/opt/${_pkgname}"
  cp -r "${srcdir}/${pkgname}/renovate-schema.json" "${pkgdir}/opt/${_pkgname}"

  chmod 775 "${pkgdir}/opt/${_pkgname}/dist/renovate.js"
  chmod 775 "${pkgdir}/opt/${_pkgname}/dist/config-validator.js"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/dist/renovate.js" "${pkgdir}/usr/bin/$_pkgname"

  install -Dm644 "${srcdir}/${pkgname}/license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd ${pkgdir}/opt/${_pkgname}
  yarn install --production
  find "node_modules" -type d -exec chmod 755 {} +
}

pkgver() {
  cd ${srcdir}/${pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
