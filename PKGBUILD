# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-browse-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="MCP server and relay that let AI agents drive your own Chromium-family browser"
arch=('x86_64' 'aarch64')
url="https://opencode.ai/product/browse"
license=('MIT')
depends=('glibc')
optdepends=('xdg-utils: open the extension page from `browse install`')
options=('!strip' '!debug')
install="$pkgname.install"

# Upstream publishes the CLI only as npm platform packages; its GitHub releases carry the extension
# zip, the npm launcher and checksums, no standalone binary.
source_x86_64=("${pkgname%-bin}-x86_64-${pkgver}.tgz::https://registry.npmjs.org/@opencode/browse-linux-x64/-/browse-linux-x64-${pkgver}.tgz")
sha256sums_x86_64=('883b5af5bbf7f7412de1eb11543d2da576c626629edcad97a58eb561feaa9de7')
source_aarch64=("${pkgname%-bin}-aarch64-${pkgver}.tgz::https://registry.npmjs.org/@opencode/browse-linux-arm64/-/browse-linux-arm64-${pkgver}.tgz")
sha256sums_aarch64=('2797ef0f80ba707ce96608252a3a11c409c2d1d239bf3e21beb3861a1d2d0b5f')

latestver() {
  curl -fsSL https://registry.npmjs.org/@opencode/browse |
    python3 -c 'import sys, json; print(json.load(sys.stdin)["dist-tags"]["latest"])'
}

package() {
  install -Dm755 "${srcdir}/package/bin/browse" "${pkgdir}/usr/bin/browse"

  # the npm package also exposes the launcher under these two names, which agent configs written
  # against it name; the binary takes the same arguments either way.
  ln -s browse "${pkgdir}/usr/bin/opencode-browser"
  ln -s browse "${pkgdir}/usr/bin/opencode-browser-cli"

  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
