# Maintainer: bastidest <bastidest at mailbox dot org>

pkgname=git-conventional-commits
pkgver=2.5.1
pkgrel=1
pkgdesc="Git Conventional Commits Util to generate Semantic Version and Markdown Change Log and Validate Commit Messages"
arch=('any')
url="https://www.npmjs.com/package/$pkgname"
license=('GPL3')
groups=()
depends=('nodejs' 'git')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('e84302ae0c7e37977b09ba9633913dbd333ca4f56adcbf667a2a049c5bf29bf2')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  chown -R root:root "${pkgdir}"

  # Remove references to $pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove references to $srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
}
