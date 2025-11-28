# Maintainer: Felinae Tang <felinae225@qq.com>

pkgname=nodejs-mcp-hub
_npmname=mcp-hub
pkgver=4.2.1
pkgrel=1
pkgdesc="A centralized manager for Model Context Protocol (MCP) servers with dynamic server management and monitoring"
arch=("any")
url="https://github.com/ravitemer/mcp-hub"
license=("MIT")
depends=("nodejs")
makedepends=("npm" "jq")
optdepends=()
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  # Remove references to $pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove references to $srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" >"$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
}

sha256sums=('6b6508da13c96e72609466d7ed809ec7638df3e9b5e21a1cdc0a59bb6d4fb82b')
