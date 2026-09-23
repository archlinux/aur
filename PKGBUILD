# Maintainer: Callum Webb <spikywebb@gmail.com>

pkgname=sparql-language-server
pkgver=4.3.0
pkgrel=2
_commit=d3e39c4c876ff276da9e36e73f9f6376b36da849
pkgdesc="Language server providing autocomplete, diagnostics and hover tooltips for SPARQL, including W3C standard SPARQL and Stardog extensions"
arch=('any')
url="https://github.com/stardog-union/stardog-language-servers"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
        "LICENSE-$pkgver::$url/raw/$_commit/LICENSE")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('60fde1bb23ead303c8efe1d3ee8d8a15c6e90fd42cdd0c3ae2982ce5502693ec'
            'fcd336454f2450ed91604bcaa9fbb5f9e73cdd6081ac991d468f5e6e07c3fd4a')

package() {
  npm install -g \
    --prefix "$pkgdir/usr" \
    --cache "$srcdir/npm-cache" \
    "$srcdir/$pkgname-$pkgver.tgz"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  # Non-deterministic race in npm gives 777 permissions to random directories
  # https://github.com/npm/cli/issues/1103
  find "$pkgdir" -type d -exec chmod 755 {} +

  # Strip the build directory out of the installed package.json files
  local pkgjson
  while IFS= read -r -d '' pkgjson; do
    local tmp
    tmp="$(mktemp)"
    jq 'with_entries(select(.key | startswith("_") | not))' "$pkgjson" >"$tmp"
    mv "$tmp" "$pkgjson"
    chmod 644 "$pkgjson"
  done < <(find "$pkgdir/usr/lib/node_modules" -name package.json -print0)

  # Upstream's webpack banner wraps the shebang in a comment
  # (`/*! #!/usr/bin/env node */`), so the kernel never sees `#!` at byte 0 and
  # execve() falls back to /bin/sh, which chokes on the minified JS. Replace the
  # banner with a real shebang.
  local cli="$pkgdir/usr/lib/node_modules/$pkgname/dist/cli.js"
  if [[ $(head -n1 "$cli") != '#!'* ]]; then
    sed -i '1s|^/\*! *\(#!.*\) \*/$|\1|' "$cli"
    head -n1 "$cli" | grep -q '^#!/usr/bin/env node$' || {
      echo "error: failed to restore shebang in dist/cli.js" >&2
      return 1
    }
  fi

  install -Dm644 "$srcdir/LICENSE-$pkgver" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
