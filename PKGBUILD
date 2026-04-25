# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=chrome-devtools-axi
pkgver=0.1.18
pkgrel=1
pkgdesc="AXI-compliant chrome-devtools-mcp wrapper with contextual suggestions"
arch=('any')
url="https://github.com/kunchenguid/chrome-devtools-axi"
license=('MIT')
depends=('nodejs' 'chrome-devtools-mcp')
makedepends=('npm')
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha512sums=('db4d4cba03cbdb9e613ed1c85a2706745264ebea2ffea2c58df4964504b138c0983bb8ab51dcd03a5fe8cf4231ae6e9afb7ce2499f26f4a6b38acee169f1a3e3')

latestver() {
  curl -fsSL "https://registry.npmjs.org/${pkgname}/latest" | jq -r '.version'
}

# Replace fixed string $2 with $3 in file $1. Fails loud if the needle is
# absent — keeps us honest when upstream refactors the call site out from
# under us. Avoids sed BRE escaping by staying in awk's literal index/substr.
_literal_replace() {
  local file=$1 needle=$2 repl=$3
  grep -qF -- "$needle" "$file" || {
    printf 'prepare: needle missing in %s: %s\n' "$file" "$needle" >&2
    exit 1
  }
  awk -v n="$needle" -v r="$repl" '{
    while ((i = index($0, n)) > 0)
      $0 = substr($0, 1, i-1) r substr($0, i+length(n))
    print
  }' "$file" > "$file.new"
  mv "$file.new" "$file"
}

prepare() {
  cd "${srcdir}/package"

  # Route the bridge at the system chrome-devtools-mcp instead of fetching it
  # through npx at runtime — otherwise our chrome-devtools-mcp depends= is a lie
  # and each call re-downloads an unpinned copy from the npm registry.
  _literal_replace dist/src/bridge.js \
    'const args = ["-y", "chrome-devtools-mcp@latest"];' \
    'const args = [];'
  _literal_replace dist/src/bridge.js \
    'command: "npx", args: buildTransportArgs()' \
    'command: "chrome-devtools-mcp", args: buildTransportArgs()'
  _literal_replace dist/src/client.js \
    'npx chrome-devtools-mcp@latest --help' \
    'chrome-devtools-mcp --help'

  # Upstream ships the built bridge script with a tsx shebang; no Arch user has
  # global tsx, and the bridge is a plain .js after build.
  _literal_replace dist/bin/chrome-devtools-axi-bridge.js \
    '#!/usr/bin/env tsx' \
    '#!/usr/bin/env node'
  sed -i '/^#!.*tsx$/d' dist/bin/chrome-devtools-axi-bridge.d.ts
}

build() {
  cd "${srcdir}/package"
  npm install --cache "${srcdir}/npm-cache" --omit=dev --ignore-scripts
}

package() {
  local node_root="${pkgdir}/usr/lib/node_modules/${pkgname}"

  install -dm755 "${pkgdir}/usr/lib/node_modules"
  cp -a "${srcdir}/package" "${node_root}"
  chmod 755 "${node_root}/dist/bin/chrome-devtools-axi.js"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "../lib/node_modules/${pkgname}/dist/bin/chrome-devtools-axi.js" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${node_root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
