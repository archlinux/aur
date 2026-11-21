# Maintainer: H3mul <phil.d324@gmail.com>
pkgname=claude-mem-sync-git
pkgver=1.1.9.r148.g6019a4a
pkgrel=1
pkgdesc='Team memory sharing for claude-mem - H3mul fork with SSH remote support (builds from git)'
arch=('x86_64' 'aarch64')
url='https://github.com/H3mul/claude-mem-sync'
license=('MIT')
depends=('nodejs>=18')
makedepends=('git' 'npm')
provides=('claude-mem-sync')
conflicts=('claude-mem-sync')
options=('!debug')
# ponytail: tracks the feature branch until it lands on the fork's main; drop the fragment then
source=("claude-mem-sync::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd claude-mem-sync
  printf "%s.r%s.g%s" \
    "$(node -p "require('./package.json').version")" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd claude-mem-sync
  # dist/ is not committed upstream; the npm package is only on GitHub Packages (auth required)
  npm install --no-fund --no-audit --ignore-scripts --cache "$srcdir/npm-cache"
  npm run build
  npm pack --ignore-scripts --pack-destination "$srcdir"
}

package() {
  npm install -g --no-fund --no-audit --prefix "$pkgdir/usr" \
    --cache "$srcdir/npm-cache" "$srcdir/lopadova-claude-mem-sync-"*.tgz better-sqlite3@13.2.0

  find "$pkgdir/usr" -name package.json -exec sed -i '/"_where"/d' {} +
  chown -R root:root "$pkgdir"

  install -Dm644 "$srcdir/claude-mem-sync/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

  # Upstream's optional better-sqlite3@^11 has no prebuilds and can't compile on Node 26 (npm swallows
  # the failure, leaving an unbuilt copy that shadows ours), so drop it and use the sibling installed
  # above, which ships prebuilds and resolves via lib/node_modules. Check it loads (--help alone never does).
  local lib="$pkgdir/usr/lib/node_modules/@lopadova/claude-mem-sync"
  rm -rf "$lib/node_modules/better-sqlite3"
  (cd "$lib" && node -e "new (require('better-sqlite3'))(':memory:').close()")

  test -x "$pkgdir/usr/bin/mem-sync"
  "$pkgdir/usr/bin/mem-sync" --help >/dev/null
}
