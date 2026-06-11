# Maintainer: sandwichfarm <sandwich.farm@protonmail.com>

pkgname=nsite-git
pkgver=0.27.1
pkgrel=1
pkgdesc="Publish your site to nostr and blossom servers from the latest git source"
arch=('x86_64')
url="https://github.com/sandwichfarm/nsyte"
license=('MIT')
makedepends=('deno' 'git')
provides=('nsyte')
conflicts=('nsyte' 'nsyte-bin')
source=('git+https://github.com/sandwichfarm/nsyte.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/nsyte"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "${srcdir}/nsyte"
  deno compile --no-check \
    --allow-run \
    --allow-read \
    --allow-write \
    --allow-net \
    --allow-env \
    --allow-sys \
    --target "${CARCH}-unknown-linux-gnu" \
    --output dist/nsyte \
    src/cli.ts
}

package() {
  cd "${srcdir}/nsyte"
  install -Dm755 "dist/nsyte" "${pkgdir}/usr/bin/nsyte"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
