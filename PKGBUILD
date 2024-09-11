# Maintainer: Evan Chen <evan at evanchen dot cc>

pkgname=prettier-plugin-latex
pkgver=2.0.1
pkgrel=1
pkgdesc="Plugin to format LaTeX with prettier.js"
arch=(any)
url=https://github.com/siefkenj/prettier-plugin-latex
license=(MIT)
depends=(nodejs prettier)
makedepends=(jq npm)
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${pkgname}-$pkgver.tgz")
sha256sums=('a3ce3da1b0d2bc573e00229921f201dae5b4bc466f2d37d0f92a7bc9f1a3e042')

package() {
  npm install -g --prefix "$pkgdir/usr" --no-bin-links "$srcdir/$pkgname-$pkgver.tgz"

  # `local json tempjson` is unnecessary because commands in pipelines are
  # executed in their own subshells
  local mainjson=$pkgdir/usr/lib/node_modules/@${pkgname%%-*}/${pkgname#*-}/package.json
  find "$pkgdir/usr" -type f -name package.json -print0 |
    while read -rd '' json; do
      tempjson=$(mktemp)
      if [ "$json" = "$mainjson" ]; then
        jq 'with_entries(select(.key | test("^_.+") | not))' \
          "$json" >"$tempjson"
      else
        jq 'del(._where,.man)' \
          "$json" >"$tempjson"
      fi
      cp "$tempjson" "$json"
    done

  # See https://github.com/npm/npm/issues/9359
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  # See https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}

# vim: set ts=2 sw=2 et:
