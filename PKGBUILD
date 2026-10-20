# Maintainer: escape0707 <tothesong at gmail dot com>
pkgname=vite-plus-bin
pkgver=1.3.0
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
sha256sums=('baa96b9ea69bfdb902e5ececaadb34e3ec72a2e809ec1fbe22f1dbd3ee84dabb'
            '7b0d1d0ed22e2babbd5e7eb8fbd45dd409a186ed0a99c9a5e1d31f44d7c1c513'
            '79b114bcccf3f7a090fd0cfdfec6f75bc9f12cf5c329aa0f17e74945fc4945bd')

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
