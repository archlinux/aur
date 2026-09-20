# Maintainer: enihcam <enihcam@archlinux>
# Contributor: MiniMax AI <dev@minimaxi.com>

pkgname=mmx-cli
_pkgname=mmx-cli
_undici_ver=6.25.0
pkgver=1.0.26
pkgrel=1
pkgdesc='CLI for the MiniMax AI platform'
arch=('any')
url='https://github.com/MiniMax-AI/cli'
# Upstream publishes neither license metadata nor a license file.
license=('LicenseRef-Unknown')
depends=('nodejs>=18.17')
optdepends=(
  'curl: install Claude Code, Grok, or Hermes agents'
  'git: install the Hermes agent'
  'npm: install Codex, OpenCode, or Pi agents'
)
source=(
  "https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz"
  "https://registry.npmjs.org/undici/-/undici-$_undici_ver.tgz"
  'LICENSE_STATUS'
)
sha512sums=(
  'd64f981733e9d2c0c251648c4fdcbd993e3731f63c93b1380e067c0d9b632d0b995a28f8cb091e7d5995172ebab5f3d081e8a8a0d8e00bd55ffe053c8382dd87'
  '660a560c2e6098d8ae63d0a72d55c41fcae5e74c61442b8b340f7b7c05272a2f1146e57813a286df5a434ec2d550a9e88491342375c3ad3784c9d017470e3bc6'
  '92073a355b330ac1a0cd88eb1fce11cf15b5711f9245d3f187880f31da588ca653cc8bddce681e7483f21d208e3799a3450c764a4d7c340110efbb794f558d78'
)

noextract=(
  "$_pkgname-$pkgver.tgz"
  "undici-$_undici_ver.tgz"
)

package() {
  local moddir="$pkgdir/usr/lib/node_modules/$_pkgname"

  install -d "$moddir/node_modules/undici" "$pkgdir/usr/bin"
  bsdtar --no-same-owner -xf "$srcdir/$_pkgname-$pkgver.tgz" \
    --strip-components=1 -C "$moddir"
  bsdtar --no-same-owner -xf "$srcdir/undici-$_undici_ver.tgz" \
    --strip-components=1 -C "$moddir/node_modules/undici"

  # The published bundles only externalize undici. Keep installed metadata
  # aligned with the modules shipped by this package.
  node -e '
    const fs = require("node:fs");
    const path = process.argv[1];
    const version = process.argv[2];
    const pkg = JSON.parse(fs.readFileSync(path, "utf8"));
    pkg.dependencies = { undici: version };
    delete pkg.devDependencies;
    delete pkg.scripts;
    fs.writeFileSync(path, `${JSON.stringify(pkg, null, 2)}\n`);
  ' "$moddir/package.json" "$_undici_ver"

  chmod 0755 "$moddir/dist/mmx.mjs"
  ln -s "../lib/node_modules/$_pkgname/dist/mmx.mjs" "$pkgdir/usr/bin/mmx"
  install -Dm0644 "$srcdir/LICENSE_STATUS" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE_STATUS"
}
