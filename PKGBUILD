# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=jspm-cli
pkgver=2.0.0.beta.7
_pkgver=2.0.0-beta.7
pkgrel=3
pkgdesc="A JavaScript package manager designed to
work seamlessly with native modules in universal workflows,
while providing full compatibility with the npm ecosystem."
arch=('any')
url='https://jspm.org'
license=('Apache')
provides=('jspm')
depends=('nodejs' 'python')
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jspm/jspm-cli/archive/${_pkgver}.tar.gz")
sha256sums=('25ef15b2cf298e65ebdc72ba6fbdbdf575ffcc98cf7e3f0c49cd895710f8a312')

package() {
  cd "${srcdir}"
  if [[ -d npm-cache ]]; then
    rm -rf npm-cache
  fi
  mkdir ${srcdir}/npm-cache
  npm install --cache "${srcdir}/npm-cache" -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  sed -i "s|${pkgdir}||g" "${pkgdir}/usr/lib/node_modules/jspm/node_modules/sshpk/package.json"
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/jspm/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  chown -R root:root "${pkgdir}"
}