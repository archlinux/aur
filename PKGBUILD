# Maintainer: enihcam <enihcam@archlinux>
# Contributor: MiniMax AI <dev@minimaxi.com>

pkgname=mmx-cli
_pkgname=mmx-cli
_undici_ver=6.25.0
pkgver=1.0.27
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
  '36997dbef4ea447ea31fe03e76d1a3476d119f4e84ffeec16f79714c05f3384d5fe487c10b4f9245d531600f7f4c5f52238f7d309b15d800e5247164e4a34356'
  '660a560c2e6098d8ae63d0a72d55c41fcae5e74c61442b8b340f7b7c05272a2f1146e57813a286df5a434ec2d550a9e88491342375c3ad3784c9d017470e3bc6'
  '64a2f6a9df905e4beceaaf4543e5d1ce13ff8de8e40effbabda052e3e67d7292b4cfeade9ea4db4761d8b8ac6e0cf1235cd6697d0eec1f92deb9dbb30c990a3b'
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
