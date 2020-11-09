# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='vdx'
pkgver=0.0.9
pkgrel=1
pkgdesc='Intuitive CLI for processing video, powered by FFmpeg'
arch=('any')
url='https://github.com/yuanqing/vdx'
_url_source='https://www.npmjs.com/package/vdx'
license=('MIT')
depends=('ffmpeg' 'nodejs')
makedepends=('npm' 'jq')
noextract=("${pkgname}-${pkgver}.tgz")
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('83461278d52df85df7c8c6bf93531a6761fd63f143d37d670da62b663c8577e2')

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
