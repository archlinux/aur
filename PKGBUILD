# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=chiasmus
pkgver=0.1.40
pkgrel=2
pkgdesc="MCP server for formal verification with Z3, Prolog, and tree-sitter"
arch=('x86_64')
url="https://github.com/yogthos/chiasmus"
license=('Apache-2.0')
depends=('nodejs>=20')
makedepends=('npm' 'node-gyp' 'python')
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('0d1e911a8ada5007c5f440d0c87a0f284d367188aeb2d0f8fba790f833500a34')
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

  # npm >=12 refuses to run a dependency's install script, and this addon
  # ships no prebuild, so nothing compiles its binding. npm only warns, so the
  # absence surfaces at runtime rather than here. (better-sqlite3 needs no
  # rebuild: it ships prebuilds/linux-x64.node and its loader prefers that
  # over any build/Release copy npm's implicit gyp step may have made.)
  local addon
  for addon in @yogthos/tree-sitter-clojure; do
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

  # node-llama-cpp's optional platform packages: npm installs linux-armv7l on
  # x86_64 because upstream declares cpu as ["arm","x64"], but it is only
  # imported when buildOptions.arch is "arm". The cuda, cuda-ext, vulkan, and
  # cpu x64 variants are all load-bearing here: cuda (statically linked,
  # needs only the NVIDIA driver) is the primary GPU backend on NVIDIA
  # machines, cuda-ext is its fallback, and vulkan covers non-NVIDIA GPUs.
  rm -rf "${node_root}/node_modules/@node-llama-cpp/linux-armv7l"

  # better-sqlite3's loader prefers prebuilds/linux-x64.node over any
  # build/Release copy, so the other prebuilds are dead weight; keep only
  # what this arch/libc actually loads.
  find "${node_root}/node_modules/better-sqlite3/prebuilds" \
    -mindepth 1 -maxdepth 1 ! -name linux-x64.node -delete 2>/dev/null || true

  find "${node_root}" -type f -name '*.node' \
    \( -name '*darwin*' -o -name '*win32*' -o -name '*win64*' -o -name '*android*' -o -name '*freebsd*' -o -name '*musl*' \) \
    -delete 2>/dev/null || true

  find "${node_root}" -type d \( -name darwin-arm64 -o -name darwin-x64 -o -name win32-arm64 -o -name win32-x64 \) \
    -exec rm -rf {} + 2>/dev/null || true

  find "${node_root}" -type d -path '*/linux-arm64' -exec rm -rf {} + 2>/dev/null || true
}
