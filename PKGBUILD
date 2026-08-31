# Maintainer: enihcam <enihcam@archlinux>
# Contributor: MiniMax AI <dev@minimaxi.com>

pkgname=mmx-cli
_pkgname=mmx-cli
_undici_ver=6.25.0
pkgver=1.0.24
pkgrel=1
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
  '47ba513b7a149968ca38f85e81a603f70f5cd7cb42c914968b4a5e33c07673103dc77044856a5ae60343a46801d4dd8e02543db465ea5cc2083786238e5f8888'
  '660a560c2e6098d8ae63d0a72d55c41fcae5e74c61442b8b340f7b7c05272a2f1146e57813a286df5a434ec2d550a9e88491342375c3ad3784c9d017470e3bc6'
  '5e59bfb18f5591d23e54097c2e978f40a12381c6e5aaa6498dbaffed4e76918abdb3fa7d93a9bfb9813f3680b8c8af40d1b7f73d0feebde956525a4402f07004'
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
