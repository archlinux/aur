# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=htconvert
pkgver=1.0.7
pkgrel=1
pkgdesc="Convert .htaccess redirects to nginx.conf redirects"
arch=('any')
url='https://github.com/lukechilds/htconvert'
license=('MIT')
depends=('bash' 'nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('73b534a15d61f935f8724e584ab14abe58bc476e6971a2df0ce765b68f4796cc')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  npm install --cache "${srcdir}/npm-cache"
  npm run-script build
}

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/lib/node_modules/
  mv ${pkgname}-${pkgver} ${pkgdir}/usr/lib/node_modules/htconvert
  ln -s /usr/lib/node_modules/htconvert/dist/cli.js ${pkgdir}/usr/bin/htconvert
  install -Dm644 ${pkgdir}/usr/lib/node_modules/htconvert/LICENSE ${pkgdir}/usr/share/licenses/htconvert/LICENSE
  rm ${pkgdir}/usr/lib/node_modules/htconvert/LICENSE
  sed -i "s|${srcdir}||g" "${pkgdir}/usr/lib/node_modules/${pkgname}/node_modules/sshpk/package.json"
  chmod 755 ${pkgdir}/usr/lib/node_modules/htconvert/dist/cli.js
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  chown -R root:root "${pkgdir}"
}