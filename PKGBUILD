# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=zvec-grep
pkgname=zg
pkgver=0.2.0
pkgrel=1
pkgdesc="Local-first search across your workspace, built for humans and AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/zvec-ai/zvec-grep"
license=('Apache-2.0')
depends=('nodejs>=22')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5162be1998ece6c4f2177e22643cc14abfa0a1077522cb764dfe49ceb45e9dc1')

build() {
  cd "${_pkgname}-${pkgver}"

  npm ci --cache "${srcdir}/npm-cache" --ignore-scripts --no-audit --no-fund
}

package() {
  cd "${_pkgname}-${pkgver}"

  local mod_dir="/usr/lib/node_modules/${_pkgname}"

  npm run build \
    --no-audit --no-fund \
    --cache "${srcdir}/npm-cache"

  npm run postbuild \
    --no-audit --no-fund \
    --cache "${srcdir}/npm-cache"


  install -dm755 "$pkgdir/$mod_dir/node_modules"
  install -dm755 "$pkgdir/usr/bin" \
                 "$pkgdir/usr/share/doc/${_pkgname}"

  cp -ap dist "$pkgdir/$mod_dir"
  cp -a node_modules/. "$pkgdir/$mod_dir/node_modules/"
  ln -s "$mod_dir/dist/cli/index.js" "$pkgdir/usr/bin/${pkgname}"

  cp -r docs/* "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"


}
