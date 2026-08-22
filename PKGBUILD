# Maintainer: enihcam <enihcam@archlinux>
# Contributor: MiniMax AI <dev@minimaxi.com>

pkgname=mmx-cli
_pkgname=mmx-cli
_undici_ver=6.25.0
pkgver=1.0.22
pkgrel=2
pkgdesc='CLI for the MiniMax AI platform'
arch=('any')
url='https://github.com/MiniMax-AI/cli'
# Upstream publishes neither license metadata nor a license file.
license=('LicenseRef-Unknown')
depends=('nodejs>=18.17')
source=(
  "https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz"
  "https://registry.npmjs.org/undici/-/undici-$_undici_ver.tgz"
  'LICENSE_STATUS'
)
sha512sums=(
  '8ae624ee362ab3a9a89233d625ac31d432f5dfb5c0bced88350653a81a0459fbdc06edad4910279265f76423c49e610d457992b717b175136c1331a1023c5e8e'
  '660a560c2e6098d8ae63d0a72d55c41fcae5e74c61442b8b340f7b7c05272a2f1146e57813a286df5a434ec2d550a9e88491342375c3ad3784c9d017470e3bc6'
  '0c395d5e2409a9c453eb5932bd5c7de121823cf967e2595c3b436e19c3ee369379de98e09f7e46afc43130670005efe1866c3d4055cd313588713ebb3bdc72be'
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
