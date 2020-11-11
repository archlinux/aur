# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='csvtojson'
pkgname="nodejs-${_pkgname}"
pkgver=2.0.10
pkgrel=1
pkgdesc='Blazing fast and Comprehensive CSV Parser'
arch=('any')
url='https://github.com/Keyang/node-csvtojson'
_url_source='https://www.npmjs.com/package/csvtojson'
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
noextract=("${_pkgname}-${pkgver}.tgz")
source=("https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
sha256sums=('41ab7fecdc9cf7007696196d927560741cecdf7fc28c47565221178bfb3ae592')

package() {
  npm install -g \
    --cache "${srcdir}/npm-cache" \
    --prefix "${pkgdir}/usr" \
    --user root \
    "${srcdir}/${_pkgname}-${pkgver}.tgz"

  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"

  find "${pkgdir}" -name 'package.json' -print0 | xargs -r -0 sed -i '/_where/d'

  local PKG_TEMP="$(mktemp)"
  local PKG_JSON="${pkgdir}/usr/lib/node_modules/${_pkgname}/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "${PKG_JSON}" > "${PKG_TEMP}"
  mv -f "${PKG_TEMP}" "${PKG_JSON}"
  chmod 644 "${PKG_JSON}"

  cd "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  install -Dvm644 'readme.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
