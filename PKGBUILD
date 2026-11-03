# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=zvec-grep
pkgname=zg
pkgver=0.3.0
pkgrel=1
pkgdesc="Local-first search across your workspace, built for humans and AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/zvec-ai/zvec-grep"
license=('Apache-2.0')
depends=('nodejs>=22')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e1de1fa02e43513abd560a1c8ccc4ed4d82abb78a1b36980ab1550f3fa6b7c39')

build() {
  cd "${_pkgname}-${pkgver}"

  npm ci --cache "${srcdir}/npm-cache" --ignore-scripts --no-audit --no-fund
  npm run build
  npm prune --cache "${srcdir}/npm-cache" \
    --omit=dev --ignore-scripts --no-audit --no-fund
}

package() {
  cd "${_pkgname}-${pkgver}"

  local mod_dir="/usr/lib/node_modules/${pkgname}"

  install -dm755 "$pkgdir/$mod_dir/node_modules"
  install -dm755 "$pkgdir/usr/bin" \
                 "$pkgdir/usr/share/doc/${pkgname}"

  cp -ap dist "$pkgdir/$mod_dir"
  cp -a node_modules/. "$pkgdir/$mod_dir/node_modules/"
  install -Dm644 package.json "$pkgdir/$mod_dir/package.json"
  ln -s "$mod_dir/dist/cli/index.js" "$pkgdir/usr/bin/${pkgname}"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
