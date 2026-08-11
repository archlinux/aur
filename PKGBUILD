# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=chrome-devtools-axi
pkgver=0.1.29
pkgrel=1
pkgdesc="AXI-compliant chrome-devtools-mcp wrapper with contextual suggestions"
arch=('any')
url="https://github.com/kunchenguid/chrome-devtools-axi"
license=('MIT')
depends=('nodejs' 'chrome-devtools-mcp')
makedepends=('npm')
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha512sums=('20b9ea0d96c03f2944482e2d5ac00f64d8732f5a9716c39e44ee03e581328401c0ab7ba505f6f8dece198cb019fb291e2448bc5c6caa55c5ff3113a182eb80f7')

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

  # Route the bridge at the system chrome-devtools-mcp binary instead of
  # probing npm globals or falling back to npx at runtime.
  _literal_replace dist/src/bridge.js \
    'return { command: "npx", args: mcpArgs };' \
    'return { command: "chrome-devtools-mcp", args: mcpArgs };'
  _literal_replace dist/src/client.js \
    'Check that chrome-devtools-mcp is installed: npx chrome-devtools-mcp@latest --help' \
    'Check that chrome-devtools-mcp is installed: chrome-devtools-mcp --help'

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
