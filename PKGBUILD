# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=chiasmus
pkgver=0.1.27
pkgrel=2
pkgdesc="MCP server for formal verification with Z3, Prolog, and tree-sitter"
arch=('x86_64')
url="https://github.com/yogthos/chiasmus"
license=('Apache-2.0')
depends=('nodejs>=20')
makedepends=('npm' 'node-gyp' 'python')
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('bec4e87fccb616e73d9c54702b025c400b9f319f216ba2e0ec4f1b2caf62ca99')
noextract=("${pkgname}-${pkgver}.tgz")

latestver() {
  curl -s "https://registry.npmjs.org/${pkgname}" | jq -r '."dist-tags".latest'
}

build() {
  npm install --cache "${srcdir}/npm-cache" \
    --prefix "${srcdir}/staging" \
    --global \
    "${srcdir}/${pkgname}-${pkgver}.tgz"

  local node_root="${srcdir}/staging/lib/node_modules/${pkgname}"

  # npm >=12 refuses to run a dependency's install script, and neither of these
  # addons ships a linux-x64 prebuild, so nothing ever compiles their bindings.
  # npm only warns, so the absence surfaces at runtime rather than here.
  local addon
  for addon in better-sqlite3 @yogthos/tree-sitter-clojure; do
    ( cd "${node_root}/node_modules/${addon}" &&
      npm_config_nodedir=/usr node-gyp rebuild --release &&
      find build -mindepth 1 -maxdepth 1 ! -name Release -exec rm -rf {} + &&
      find build/Release -mindepth 1 ! -name '*.node' -exec rm -rf {} + )
  done

  # Exercise the bindings rather than merely resolving them: better-sqlite3
  # loads its .node lazily, so a bare require succeeds on a package that cannot
  # open a database.
  node --input-type=module -e '
    import { createRequire } from "node:module";
    const req = createRequire(process.argv[1] + "/");
    new (req("better-sqlite3"))(":memory:").prepare("select 1").get();
    await import(req.resolve("@yogthos/tree-sitter-clojure"));
    console.log("native bindings exercised: better-sqlite3 tree-sitter-clojure");
  ' "${node_root}"
}

package() {
  local node_root="${pkgdir}/usr/lib/node_modules/${pkgname}"

  install -d "${pkgdir}/usr/lib/node_modules"
  cp -a "${srcdir}/staging/lib/node_modules/${pkgname}" "${node_root}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/node_modules/${pkgname}/dist/mcp-server.js" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${node_root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find "${node_root}" -type f -name '*.node' \
    \( -name '*darwin*' -o -name '*win32*' -o -name '*win64*' -o -name '*android*' -o -name '*freebsd*' -o -name '*-musl*' \) \
    -delete 2>/dev/null || true

  find "${node_root}" -type d \( -name darwin-arm64 -o -name darwin-x64 -o -name win32-arm64 -o -name win32-x64 \) \
    -exec rm -rf {} + 2>/dev/null || true

  find "${node_root}" -type d -path '*/linux-arm64' -exec rm -rf {} + 2>/dev/null || true
}
