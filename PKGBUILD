# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-browse-bin
pkgver=0.1.5
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
sha256sums_x86_64=('8ba73f16322a42544cad3a97490bfd14957b97b108b58f43913e6ca088a3cdd7')
sha256sums_aarch64=('0b550e8b6623994a947bc998704b4bc5e796e307323de5f947cd4abd7c7d7dab')
source_aarch64=("${pkgname%-bin}-aarch64-${pkgver}.tgz::https://registry.npmjs.org/@opencode/browse-linux-arm64/-/browse-linux-arm64-${pkgver}.tgz")

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
