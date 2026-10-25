# Maintainer: omgold@aur

pkgname=graph-it-live
pkgver=1.21.0
pkgrel=1
pkgdesc='Local code dependency and call-graph analysis CLI and MCP server'
arch=('any')
url='https://github.com/magic5644/Graph-It-Live'
license=('MIT')
depends=('nodejs>=22')
makedepends=('npm')
optdepends=('git: analysis of changes against Git revisions')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'tree-sitter-compat.patch'
        'stage-runtime.cjs')
sha256sums=('c97085159641d75ef541ef88d3b68c353cae4dbad2abde6b9aa29c8d84c55a44'
            'fbd0302a4ccd6119d049314520a7525a748a77ccb613e67bc8413d5118cf0568'
            '61a7c67112bc8566efc783724021c11d579be21de702f87f8c328c8fbfb3eb82')

prepare() {
  cd "Graph-It-Live-$pkgver"
  # 0.26 rejects the legacy dylink format in tree-sitter-wasms 0.1.13.
  # Pin 0.25.10 in both manifests, including its npm integrity checksum.
  patch -Np1 -i "$srcdir/tree-sitter-compat.patch"
  # The lockfile pins npm downloads and verifies their integrity. Keep npm's
  # cache in srcdir; neither building nor packaging needs network access.
  npm ci --ignore-scripts --no-audit --no-fund --cache "$srcdir/npm-cache"
  # Upstream keeps 0.0.1 in Git and stamps the release version before building.
  npm version "$pkgver" --no-git-tag-version --ignore-scripts --offline \
    --cache "$srcdir/npm-cache"
}

build() {
  cd "Graph-It-Live-$pkgver"
  npm run build:cli -- --production
  node "$srcdir/stage-runtime.cjs" "$PWD" "$srcdir/runtime"

  # Retain upstream's exact versions for the external runtime libraries and
  # their dependencies; everything needed is already in the prepare() cache.
  cd "$srcdir/runtime"
  npm install --package-lock-only --omit=dev --ignore-scripts --offline \
    --no-audit --no-fund --cache "$srcdir/npm-cache"
  npm ci --omit=dev --ignore-scripts --offline --no-audit --no-fund \
    --cache "$srcdir/npm-cache"
  node "$srcdir/stage-runtime.cjs" --verify \
    "$srcdir/Graph-It-Live-$pkgver" "$PWD"
  find node_modules -type f -name '*.map' -delete
}

package() {
  install -dm755 "$pkgdir/usr/lib/$pkgname" "$pkgdir/usr/bin"
  cp -a "$srcdir/runtime/"{dist,node_modules,package.json} \
    "$pkgdir/usr/lib/$pkgname/"
  ln -s "/usr/lib/$pkgname/dist/graph-it.js" "$pkgdir/usr/bin/graph-it"

  cd "Graph-It-Live-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -a "$srcdir/runtime/licenses" "$pkgdir/usr/share/licenses/$pkgname/bundled"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/CLI.md "$pkgdir/usr/share/doc/$pkgname/CLI.md"
}
