# Maintainer: escape0707 <tothesong at gmail dot com>
pkgname=vite-plus-bin
pkgver=1.0.0rc.1
_upstreamver=${pkgver/rc/-rc}
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
  "https://registry.npmjs.org/@voidzero-dev/vite-plus-cli-linux-x64-gnu/-/vite-plus-cli-linux-x64-gnu-$_upstreamver.tgz"
)
sha256sums=('09cea9516f54756af99ecb2e8d471c44bb12684127235d24e158a6079a1df35a'
            '31f8605c18989581ac1c3a6223183d2fc9c15740519f740b24a689ff1358c9a8'
            'd0561bc4c9302641d21241a3a62ebced4519565fa545045bd22b71b4ed61a1a6')

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
