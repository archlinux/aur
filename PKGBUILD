# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=feathers-cli
pkgver=4.4.2
pkgrel=1
pkgdesc="The command line interface for scaffolding Feathers applications"
arch=('any')
url='https://github.com/feathersjs/cli'
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/feathersjs/cli/archive/v${pkgver}.tar.gz")
sha256sums=('ca60760c5dab29d5aa59bacb5c375baea41a892ea50b9f759a438220b0892b28')

package() {
  cd "${srcdir}"
  if [[ -d npm-cache ]]; then
    rm -rf npm-cache
  fi
  mkdir ${srcdir}/npm-cache
  npm install --cache "${srcdir}/npm-cache" -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/@feathersjs/cli/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  chown -R root:root "${pkgdir}"
  sed -i "s|$pkgdir||" "${pkgdir}/usr/lib/node_modules/@feathersjs/cli/node_modules/sshpk/package.json"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/@feathersjs/cli/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
