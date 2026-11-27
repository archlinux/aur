# Maintainer: Lam Duc Trung <vn dot trungld at gmail dot com>

pkgbase=kitesurf-git
pkgname=('kitesurf-cli-git' 'kitesurf-engine-git')
_pkgname=kitesurf
pkgver=0.0.5.r400.gb9b904e
pkgrel=1
pkgdesc="Kitesurf, Cloudflare's browser engine for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/cloudflare/kitesurf"
license=('Apache-2.0')
makedepends=('cargo' 'git' 'nodejs>=22' 'npm' 'python')
# makepkg's -flto makes GCC emit LTO bytecode for the CLI's vendored C code (libdbus, aws-lc),
# which rustc's default linker, rust-lld, cannot read: the link fails with undefined symbols.
options=('!lto')
source=("$_pkgname::git+$url.git"
        'kitesurf-engine.mjs'
        'kitesurf-engine.service'
        'kitesurf-engine.env')
sha256sums=('SKIP'
            '753b12f5832f7fe4b7ed782db835f6385a517382ad488584531b546a88760e87'
            'cf02e9ff0104c22d7386752cb24add061acc60597780bb1e9fab80e01954d61d'
            'a98b303f3fc50fc34db501b90aa47903f34cc7921a58963f282f2ab13e894d79')

_clidir=packages/kitesurf-cli

# Bazelisk reads .bazelversion and fetches the pinned Bazel.
_bazel() {
  "$srcdir/tools/node_modules/.bin/bazel" "$@"
}

pkgver() {
  cd "$_pkgname"
  local _ver
  _ver=$(sed -n 's/^version = "\(.*\)"/\1/p' "$_clidir/Cargo.toml" | head -n1)
  printf "%s.r%s.g%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  # Build tools the repository pins: Bazelisk and pnpm 9.15.4.
  npm install --prefix "$srcdir/tools" --no-audit --no-fund --no-save @bazel/bazelisk pnpm@9.15.4

  cd "$_pkgname/$_clidir"
  # The repo root pins a nightly in rust-toolchain.toml; the CLI builds on stable.
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  # --- CLI ---
  cd "$srcdir/$_pkgname/$_clidir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Keep the build directory out of panic messages.
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
  cargo build --frozen --release

  # --- Engine ---
  # Bazel downloads its own pinned toolchains (Rust nightly, Node, binaryen, the DevTools
  # frontend) and compiles the Rust core to WebAssembly: this step needs network and takes a while.
  cd "$srcdir/$_pkgname"
  export PATH="$srcdir/tools/node_modules/.bin:$PATH"
  pnpm install --frozen-lockfile
  _bazel build --config=devtools //packages/engine:dist
  local _bin
  _bin=$(_bazel info --config=devtools bazel-bin)
  _bazel shutdown

  # Stage dist/ with its assets beside it, so the package does not depend on Bazel's layout.
  local _stage="$srcdir/engine" _dist="$_bin/packages/engine/dist" _assets
  rm -rf "$_stage"
  mkdir -p "$_stage"
  cp -rL "$_dist" "$_stage/dist"
  _assets=$(node -p 'JSON.parse(require("fs").readFileSync(process.argv[1], "utf8")).assets?.directory ?? ""' \
    "$_stage/dist/engine-mf.json")
  if [[ -z $_assets || ! -d $_dist/$_assets ]]; then
    error "Engine assets not found (assets.directory='$_assets')"
    return 1
  fi
  cp -rL "$_dist/$_assets" "$_stage/public"
  chmod -R u+w "$_stage"
  node -e '
    const fs = require("fs"), file = process.argv[1];
    const options = JSON.parse(fs.readFileSync(file, "utf8"));
    options.assets.directory = "../public";
    fs.writeFileSync(file, JSON.stringify(options, null, 1) + "\n");
  ' "$_stage/dist/engine-mf.json"

  # Runtime: the Miniflare (and workerd) version the engine is developed against,
  # with the repository's security overrides.
  node -e '
    const fs = require("fs");
    const [engineJson, rootJson, out] = process.argv.slice(1);
    const engine = JSON.parse(fs.readFileSync(engineJson, "utf8"));
    const root = JSON.parse(fs.readFileSync(rootJson, "utf8"));
    const miniflare = engine.dependencies?.miniflare ?? engine.devDependencies?.miniflare;
    if (!miniflare) throw new Error("miniflare version not found in packages/engine/package.json");
    const overrides = {};
    for (const [key, value] of Object.entries(root.pnpm?.overrides ?? {})) {
      // "name@range": "version" maps to npm; skip "parent>child" selectors and removals.
      const name = key.match(/^@?[^@>]+/)[0];
      if (key[name.length] === ">" || value === "-") continue;
      overrides[name] = value;
    }
    fs.writeFileSync(out, JSON.stringify({ private: true, type: "module",
      dependencies: { miniflare }, overrides }, null, 2) + "\n");
  ' packages/engine/package.json package.json "$_stage/package.json"
  cd "$_stage"
  npm install --omit=dev --no-audit --no-fund
  rm -f package-lock.json
  printf '%s\n' "$pkgver" > VERSION
}

package_kitesurf-cli-git() {
  pkgdesc="Terminal client for Kitesurf, Cloudflare's browser engine for AI agents"
  depends=('gcc-libs' 'glibc' 'ca-certificates')
  optdepends=('org.freedesktop.secrets: store the Cloudflare OAuth login (e.g. KWallet, gnome-keyring)'
              'kitty: Kitty graphics mode (or Ghostty; use --mode=ansi in other terminals)'
              'kitesurf-engine: run the engine locally (KITESURF_SERVER=http://127.0.0.1:8787)')
  provides=('kitesurf' 'kitesurf-cli')
  conflicts=('kitesurf' 'kitesurf-cli')

  cd "$_pkgname/$_clidir"
  install -Dm755 target/release/kitesurf "$pkgdir/usr/bin/kitesurf"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 ../../LICENSE ../../NOTICE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_kitesurf-engine-git() {
  pkgdesc="Kitesurf browser engine for AI agents, run locally as a CDP server and systemd user service"
  depends=('nodejs>=22' 'glibc')
  optdepends=('kitesurf-cli: view pages from the local engine in the terminal')
  provides=('kitesurf-engine')
  conflicts=('kitesurf-engine')
  # workerd and the sharp addon come prebuilt from npm.
  options=('!strip' '!debug')

  local _lib="$pkgdir/usr/lib/kitesurf-engine"
  install -d "$_lib" "$pkgdir/usr/bin"
  cp -a "$srcdir/engine/." "$_lib/"
  install -Dm755 "$srcdir/kitesurf-engine.mjs" "$_lib/kitesurf-engine.mjs"
  ln -s /usr/lib/kitesurf-engine/kitesurf-engine.mjs "$pkgdir/usr/bin/kitesurf-engine"

  install -Dm644 "$srcdir/kitesurf-engine.service" "$pkgdir/usr/lib/systemd/user/kitesurf-engine.service"
  install -Dm644 "$srcdir/kitesurf-engine.env" "$pkgdir/usr/share/doc/$pkgname/kitesurf-engine.env"
  install -Dm644 "$srcdir/$_pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$srcdir/$_pkgname/NOTICE" \
    -t "$pkgdir/usr/share/licenses/$pkgname/"
}
