# Maintainer: escape0707 <tothesong at gmail dot com>
pkgname=vite-plus-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='The Unified Toolchain for the Web'
arch=('x86_64')
url='https://viteplus.dev'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('npm')
provides=("vite-plus=$pkgver")
conflicts=('vite-plus')
options=('!strip' '!debug')
source=(
  'package.json'
  'package-lock.json'
  "https://registry.npmjs.org/@voidzero-dev/vite-plus-cli-linux-x64-gnu/-/vite-plus-cli-linux-x64-gnu-$pkgver.tgz"
)
sha256sums=('a1524a627ca0d66d9c0453f8a80df77fbc84fdffa188940abfa464a532dd0d54'
            'adedd305db9fa99fd2e71a06c1a9fb56fcd874d0da14e519f48b468908b0af85'
            '31439b12eb8a842077ba20c1a6ee9016e1b7552587b76706b176fabce591fb52')

prepare() {
  npm ci --cache "$srcdir/npm-cache" \
    --omit=dev --ignore-scripts --no-audit --no-fund
}

package() {
  install -Dm755 package/vp "$pkgdir/usr/lib/vite-plus/bin/vp"
  cp -a node_modules "$pkgdir/usr/lib/vite-plus/"
  # flatted ships a separate Python implementation; Vite+ uses its JS export.
  rm -r "$pkgdir/usr/lib/vite-plus/node_modules/flatted/python"

  install -d "$pkgdir/usr/bin"
  local cmd
  for cmd in vp vpr vpx; do
    ln -s ../lib/vite-plus/bin/vp "$pkgdir/usr/bin/$cmd"
  done

  install -Dm644 node_modules/vite-plus/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
