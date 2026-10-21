# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

_npmname=agent-skill-manager
pkgname=asm
pkgver=2.23.0
pkgrel=2
pkgdesc="Universal CLI/TUI for managing AI coding agent skills across 17+ platforms"
arch=('any')
url="https://github.com/luongnv89/asm"
license=('MIT')
depends=('nodejs>=22')
makedepends=('npm')
provides=('agent-skill-manager')
conflicts=('agent-skill-manager')
# Upstream's lockfile pins the runtime tree; npm ci checks every entry's integrity hash.
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz
        "package-lock-$pkgname-$pkgver.json::https://raw.githubusercontent.com/luongnv89/asm/v$pkgver/package-lock.json")
sha1sums=('3fd06276de54ef43c93a3022a9845ef69b5ceeea'
          'cdd8e4961b8b6dd4af2dc135624064affa6dbb16')

prepare() {
  cp "$srcdir/package-lock-$pkgname-$pkgver.json" "$srcdir/package/package-lock.json"
}

build() {
  cd "$srcdir/package"
  # --legacy-peer-deps: upstream's .npmrc sets it, and its lockfile was resolved with it.
  # --ignore-scripts: upstream's postinstall only warns about other asm binaries on PATH.
  npm ci --omit=dev --ignore-scripts --legacy-peer-deps --no-audit --no-fund --cache "$srcdir/npm-cache"
}

package() {
  install -d "$pkgdir/usr/lib/node_modules" "$pkgdir/usr/bin"
  cp -r --no-preserve=ownership "$srcdir/package" "$pkgdir/usr/lib/node_modules/$_npmname"
  # The full lockfile lists the dev tree too; node_modules/.package-lock.json records what is installed.
  rm "$pkgdir/usr/lib/node_modules/$_npmname/package-lock.json"
  find "$pkgdir/usr/lib/node_modules" -type d -exec chmod 755 {} +

  ln -s "../lib/node_modules/$_npmname/dist/agent-skill-manager.js" "$pkgdir/usr/bin/asm"
  ln -s "../lib/node_modules/$_npmname/dist/agent-skill-manager.js" "$pkgdir/usr/bin/$_npmname"

  install -Dm644 "$srcdir/package/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
