# Maintainer: Brody <archfan at brodix dot de>

pkgname=markdownlint-cli2
pkgver=0.7.1
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
sha512sums=(379f25c39d16b3458e7c2734ec1f5d3ca3273cc6c88fa642325b3364b55fc41c0a37f33e599a972dd387c912f6056099dc03c1c5037da83130ed57f53d1a8592)

package() {
  npm install -g --prefix "${pkgdir}"/usr --cache "${srcdir}"/npm-cache ${pkgname}-${pkgver}.tgz

  # Fix permissions
  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  # Remove local paths from package.json
  find "${pkgdir}"/usr -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  local _tmppackage=$(mktemp)
  local _pkgjson="${pkgdir}"/usr/lib/node_modules/${pkgname}/package.json
  jq '.|=with_entries(select(.key|test("_.+")|not))' "${_pkgjson}" >${_tmppackage}
  mv ${_tmppackage} "${_pkgjson}"
  chmod 644 "${_pkgjson}"

  # Install license
  install -Dm644 package/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim: ts=2 sw=2 et:
