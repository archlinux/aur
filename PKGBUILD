# Maintainer: Brody <archfan at brodix dot de>

pkgname=markdownlint-cli2
pkgver=0.6.0
pkgrel=1
pkgdesc='MarkdownLint Command Line Interface'
arch=(any)
url=https://github.com/DavidAnson/markdownlint-cli2
license=(MIT)
depends=(nodejs)
makedepends=(
  jq
  npm
)
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha512sums=(06fdb4afa58675c1cc5a2f10bc0159dc206e9dfe22e1a62655d4dfa40bd738323fd64ddfd3d0d96748b42dc5fd64c8655718e83b36d50f3d4d5b229ce61c13aa)

package() {
  npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # Fix permissions
  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  # Remove local paths from package.json
  find "${pkgdir}/usr" -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  local _tmppackage="$(mktemp)"
  local _pkgjson="${pkgdir}/usr/lib/node_modules/${pkgname}/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "${_pkgjson}" >"${_tmppackage}"
  mv "${_tmppackage}" "${_pkgjson}"
  chmod 644 "${_pkgjson}"

  # Install license
  install -Dm644 package/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
