# Maintainer: Robert Gonciarz <gonciarz at gmail dot com>

pkgname=ardrive-cli
pkgver=1.20.2
pkgrel=1
pkgdesc="ArDrive CLI written in node.js"
arch=("any")
url="https://github.com/ardriveapp/${pkgname}/"
license=("AGPL-3.0-or-later")
depends=("nodejs" "unzip")
makedepends=("jq" "npm")
source=("${pkgname}-${pkgver}.tgz::http://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha1sums=("e64f89cecc14f46859ab83823886f5b61344b7df")
sha256sums=("2a81465650b3e7d277da7a9bf2157958cd8d294d914d14d102f125a17898f3b6")

prepare() {
  tar -zxf "${srcdir}/${pkgname}-${pkgver}.tgz" --directory "${srcdir}" "package/LICENSE"
  mv package/LICENSE package/LICENSE.md
}

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  install -Dm644 "${srcdir}/package/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  find "${pkgdir}/usr" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr" -type f -exec chmod 644 {} \;

  chown -R root:root "${pkgdir}"

  find "${pkgdir}" -type f -name "package.json" -print0 | xargs -0 sed -i "/_where/d"

  local tmppackage="$(mktemp)"
  local pkgjson="${pkgdir}/usr/lib/node_modules/${pkgname#nodejs-}/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
  mv "${tmppackage}" "${pkgjson}"
  chmod 644 "${pkgjson}"
}
