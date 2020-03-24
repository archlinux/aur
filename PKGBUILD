# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=foy
pkgver=0.1.29
pkgrel=1
pkgdesc="A simple, light-weight and modern task runner for general purpose"
arch=('any')
url='http://zaaack.github.io/foy'
license=('MIT')
makedepends=('yarn' 'npm')
source=("https://github.com/zaaack/foy/archive/v${pkgver}.tar.gz")
md5sums=('566c10753cf2ddbfea2530deafdd4836')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${srcdir}/yarn_cache
  rm package-lock.json
  rm -rf .vscode
  yarn --cache-folder=${srcdir}/yarn_cache install 
  yarn --cache-folder=${srcdir}/yarn_cache build
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/lib/node_modules/@zaaack/
  mv ${srcdir}/${pkgname}-${pkgver} ${pkgdir}/usr/lib/node_modules/@zaaack/foy
  ln -s /usr/lib/node_modules/@zaaack/foy/lib/cli.js ${pkgdir}/usr/bin/foy
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/@zaaack/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  chown -R root:root "${pkgdir}"
}