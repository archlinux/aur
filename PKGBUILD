# Maintainer: KarlFiabeschi 1984itsnow[at]gmail[dot]com

_npmname=soccer-go
pkgname=nodejs-soccer-go
pkgver=1.2.0
pkgrel=1
pkgdesc="soccer-go is a node command line application to gather soccer stats and results"
arch=('any')
url="https://github.com/acifani/soccer-go"
license=(MIT)
depends=('nodejs')
makedepends=('npm' 'jq')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('1dc027ea14d11de079ad070b727149d19696febb7ca184cbbd17eb3d2acbd342')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${_npmname}-${pkgver}.tgz"

  # fix perms
  chown -R root:root "${pkgdir}"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -name "package.json" -print0 | xargs -0 sed -i "/_where/d"

  local tmppackage="$(mktemp)"
  local pkgjson="${pkgdir}/usr/lib/node_modules/${pkgname#nodejs-}/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
  mv "${tmppackage}" "${pkgjson}"
  chmod 644 "${pkgjson}"
}
