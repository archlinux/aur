# Maintainer: enihcam <enihcam@archlinux>
# Contributor: MiniMax AI <dev@minimaxi.com>

pkgname=mmx-cli
_pkgname=mmx-cli
_undici_ver=6.25.0
pkgver=1.0.25
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
  'd4b5640c0de0bb56134f1661f2c09fe498c70b973f701e25618f08724c8ce25c8c60c1508fed4daa51a71a65ec8b5fd8a96f2dbf0495a03600021af433f647ba'
  '660a560c2e6098d8ae63d0a72d55c41fcae5e74c61442b8b340f7b7c05272a2f1146e57813a286df5a434ec2d550a9e88491342375c3ad3784c9d017470e3bc6'
  'caf94a26f4a6cda5f26771b14a0f1faeeb3382bf0bbaa3440ae4bb1430250dcec4c48ec95bc8965f75ea8dfdf104880804d663ec5803eaa8cc8160e3ff7434d5'
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
