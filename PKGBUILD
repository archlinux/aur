# Maintainer: zsh-ncursed <zsh.ncursed@gmail.com>
# vim: ft=sh:

pkgname=tabook
_pkgname=tabook
pkgver=0.3.0
pkgrel=1
pkgdesc='Terminal-based e-book reader for FB2 and EPUB formats'
# The Rust native module (crates/tabook-native) is compiled per-architecture,
# so the package is no longer arch-independent.
arch=('x86_64' 'aarch64')
url='https://github.com/zsh-ncursed/tabook'
license=('MIT')
depends=('nodejs>=18')
# better-sqlite3 ships prebuilt .node binaries for x86_64 and aarch64;
# stripping/debug-packing them fails on cross-arch files and gains nothing.
# !lto: makepkg's CFLAGS gets -flto, and the bundled sqlite3.c (compiled by
# the cc crate into the native module) ends up as LTO bytecode that the final
# cdylib link silently drops — the .node then has undefined sqlite3_* symbols.
options=(!strip !debug !lto)
# rust is needed for the napi build of the tabook-native module.
makedepends=('npm' 'git' 'python' 'gcc' 'make' 'rust')
optdepends=(
  'ueberzugpp: display book cover images in supported terminals'
  'zenity: graphical file picker for the `o` open-file dialog'
  'kdialog: graphical file picker (KDE alternative to zenity)'
)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  npm ci
  # Compile the Rust core. npm ci links @tabook/native as a workspace
  # symlink, so the resulting .node binary lands in crates/tabook-native
  # where the runtime loads it.
  npm run build:native
  # Fail loudly if the binding is broken (a silent link failure would ship
  # a .node with undefined symbols and the app would silently fall back to
  # the pure-TS implementations).
  node -e "require('./crates/tabook-native/index.cjs')" || exit 1
  npm run build
  npm prune --production
}

package() {
  cd "${srcdir}/${pkgname}"

  # App directory
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -r dist node_modules package.json "${pkgdir}/usr/lib/${pkgname}/"

  # Native module: node_modules/@tabook/native is an npm-workspace symlink to
  # ../../crates/tabook-native. cp -r preserves the symlink, so copy crates/
  # into the package for it to resolve at runtime.
  cp -r crates "${pkgdir}/usr/lib/${pkgname}/"

  # Strip better-sqlite3 prebuilds for other OSes — keep both linux-x64 and
  # linux-arm64 so the same package works on x86_64 and aarch64 (the runtime
  # loader in lib/binding.js picks the .node file by process.platform+arch).
  rm -f "${pkgdir}/usr/lib/${pkgname}/node_modules/better-sqlite3/prebuilds/"{darwin-*,win32-*,linuxmusl-*}*

  # es-toolkit ships ~12MB of prebuilt bundles in dist/. The runtime only loads
  # dist/compat — ink imports 'es-toolkit/compat', which resolves there (verified:
  # nothing imports the root 'es-toolkit' package). compat pulls in its transitive
  # deps (array/object/predicate/util/function/string/math/promise); the root
  # dist/index.mjs is kept for safety even though its ./error/ import is pruned
  # (dead until something imports the root entry). Drop the never-imported subdirs.
  rm -rf "${pkgdir}/usr/lib/${pkgname}/node_modules/es-toolkit/dist/"{fp,server,error,map,set,types} "${pkgdir}/usr/lib/${pkgname}/node_modules/es-toolkit/dist/browser.global.js"

  # better-sqlite3 bundles the SQLite C sources in deps/sqlite3; the prebuilt
  # .node binaries above are what actually gets loaded, so drop the sources.
  rm -rf "${pkgdir}/usr/lib/${pkgname}/node_modules/better-sqlite3/deps/sqlite3"

  # Dev-only artifacts across all deps, useless at runtime (~10MB): TypeScript
  # declaration files and source maps. Node only loads .js/.mjs, so .d.ts/.d.mts
  # are never resolved at runtime, and nothing in this dependency tree loads
  # .map files at runtime (stack-utils parses stack strings, not maps).
  find "${pkgdir}/usr/lib/${pkgname}/node_modules" -type f \( -name '*.d.ts' -o -name '*.d.mts' -o -name '*.map' \) -delete

  # TypeScript sources of specific packages whose runtime lives in compiled
  # output (main/module point to dist/ or lib/, NOT src/): smol-toml,
  # es-toolkit, better-sqlite3. Do NOT blanket-delete src/ dirs: fast-xml-parser
  # ships its runtime in src/ (main ./src/fxp.js) and yoga-layout in
  # dist/src/, so those must be kept.
  rm -rf "${pkgdir}/usr/lib/${pkgname}/node_modules/"{smol-toml,es-toolkit,better-sqlite3}/src

  # Binary wrapper
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/tabook" <<EOF
#!/bin/bash
exec node /usr/lib/${pkgname}/dist/cli/main.js "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/tabook"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}