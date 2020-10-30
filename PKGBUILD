# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='vdx'
pkgver=0.0.7
pkgrel=1
pkgdesc='Intuitive CLI for processing video, powered by FFmpeg'
arch=('any')
url='https://github.com/yuanqing/vdx'
_url_source='https://www.npmjs.com/package/vdx'
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
noextract=("${pkgname}-${pkgver}.tgz")
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('39250e7d00fefb29e1ac686b89e73313bbce075ee7e9e5f34434e5d1cc3e30dd')

package() {
  npm install -g \
    --cache "${srcdir}/npm-cache" \
    --prefix "${pkgdir}/usr" \
    --user root \
    "${srcdir}/${pkgname}-${pkgver}.tgz"

  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"

  find "${pkgdir}" -name 'package.json' -print0 | xargs -r -0 sed -i '/_where/d'

  local PKG_TEMP="$(mktemp)"
  local PKG_JSON="${pkgdir}/usr/lib/node_modules/${pkgname}/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "${PKG_JSON}" > "${PKG_TEMP}"
  mv -f "${PKG_TEMP}" "${PKG_JSON}"
  chmod 644 "${PKG_JSON}"

  cd "${pkgdir}/usr/lib/node_modules/${pkgname}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
