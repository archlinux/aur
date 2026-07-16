# Maintainer: enihcam <enihcam@archlinux>
# Contributor: MiniMax AI <dev@minimaxi.com>

pkgname=mmx-cli
_pkgname=mmx-cli
pkgver=1.0.17
pkgrel=1
pkgdesc='CLI for the MiniMax AI platform'
arch=('any')
url='https://github.com/MiniMax-AI/cli'
license=('MIT')
depends=('nodejs>=18')
makedepends=('npm' 'jq')
optdepends=('bun: run from source for development')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha512sums=('9b0a43505b8568383e812ba2b618de030dda3507cce119c861ea94108c07c177e4285acb4698dd5bdf5306a2648ce65b2a23c7f4b470cb841f531e8ba611aa82')

noextract=("$_pkgname-$pkgver.tgz")

package() {
  # Install from the local tarball (not from the network).
  npm install -g \
    --prefix "$pkgdir/usr" \
    --cache "$srcdir/npm-cache" \
    "$srcdir/$_pkgname-$pkgver.tgz"

  # Strip $pkgdir references npm embeds in package.json (npm/cli#3828).
  find "$pkgdir" -name package.json -print0 \
    | xargs -r -0 sed -i '/_where/d'

  # Drop underscored-only fields from the top-level package.json.
  local tmppkg
  tmppkg="$(mktemp)"
  jq '.|=with_entries(select(.key|test("^_")|not))' \
    "$pkgdir/usr/lib/node_modules/$_pkgname/package.json" > "$tmppkg"
  mv "$tmppkg" "$pkgdir/usr/lib/node_modules/$_pkgname/package.json"
  chmod 644 "$pkgdir/usr/lib/node_modules/$_pkgname/package.json"

  # npm also leaks $pkgdir into .man entries — drop them.
  find "$pkgdir" -type f -name package.json | while read -r pkgjson; do
    local t
    t="$(mktemp)"
    jq 'del(.man)' "$pkgjson" > "$t"
    mv "$t" "$pkgjson"
    chmod 644 "$pkgjson"
  done
}
