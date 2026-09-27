# Maintainer: Emir-Eins <emir-eins@outlook.com>
# Contributor: Wuxxin <wuxxin@gmail.com>
# Maintainer: Solomon <shlomochoina@gmail.com>
pkgname=openclaw-git
# Fallback base version only if package.json is unreadable (history rewrites make
# git-describe tags unreliable; see pkgver()).
_pkgver=2026.7.2
pkgver=2026.9.6.r100853.gd9bc2066b623
pkgrel=1
pkgdesc="Personal AI assistant that runs on your own devices (Bun build, highly optimized)"
arch=('x86_64')
url="https://github.com/openclaw/openclaw"
license=('MIT')
# 2026.9+ refuses Node 22 and Node 25 (node:sqlite NUL truncation, nodejs/node#61954).
# Satisfied by extra/nodejs (26.x) or extra/nodejs-lts-krypton (24.x). nodejs-lts-jod is 22.x.
depends=('nodejs>=24.16.0')
makedepends=('git' 'bun' 'npm' 'python' 'cmake' 'gcc' 'make' 'pkgconf' 'libvips')
optdepends=('bubblewrap: for experimental additional sandboxed execution'
            'oxlint: for system-wide fast linting in doctor'
            'oxfmt: for system-wide fast formatting in doctor'
            'markdownlint-cli2: for system-wide documentation linting'
            'typescript: for system-wide tsc support')

provides=('openclaw')
conflicts=('openclaw')
source=('git+https://github.com/openclaw/openclaw.git'
        'openclaw-bwrap'
        'openclaw-agent-bwrap'
        'openclaw-bwrap-install-as-systemd-user-service'
        'openclaw-patch.sh'
        'openclaw.install'
        'openclaw-commit-382fe80'
        'openclaw-restart.hook'
        'README.md')
sha256sums=('SKIP'
            '273910e58f512a4f1d59fe2cde328d7abc68f720f5e6e98a23a06a43c3eb9599'
            '63e557c01ca78e392ac17f37538faff9be6e568bb6d8b33980c8836197fd06ad'
            '34fa95679d51f4d5be120e98714f8b580689e57bef6eb031dcf35c0b26948e7d'
            'f7226d4fa28c8708f9e7146935579b758a4b77c9a53eff6b9d365161ab58456f'
            '9c5b93702b739c42ebe71376c417a9b7118db055a5b44d74ebf608ecc5915beb'
            'cdaf01acb58af62348c6f669f8b77675f66428a8ae41b4b4e371739492fb05c6'
            '025de14715ac9508517d3461f0c35e289c545353443f5cab312a091b630e8b3a'
            '0c177909ae593fb349c0bcbb56dcd5efdc645e75d6e9861647c9defbf604afe5')

options=('!strip' '!debug')

pkgver() {
    cd "$srcdir/openclaw"

    # Upstream rewrites history and tags releases off non-main ancestry, so
    # `git describe` often lands on old v* tags or non-version tags such as
    # release-publish/* (which produce invalid Arch pkgver strings with '/').
    # package.json is the authoritative release version for the tree we build.
    local _ver=""
    if [[ -f package.json ]]; then
        _ver=$(node -pe 'require("./package.json").version' 2>/dev/null) || true
    fi
    if [[ -z "$_ver" ]]; then
        # Prefer a version-shaped tag by sort order (not ancestry).
        _ver=$(git tag -l 'v[0-9]*' --sort=-v:refname | head -n1 | sed 's/^v//')
    fi
    if [[ -z "$_ver" ]]; then
        _ver="$_pkgver"
    fi
    # Arch pkgver may only use alphanumerics and . _ +
    _ver=${_ver//-/.}

    local _count _hash
    _count=$(git rev-list --count HEAD)
    _hash=$(git rev-parse --short HEAD)
    printf "%s.r%s.g%s" "$_ver" "$_count" "$_hash"
}

prepare() {
    # engines.node is ">=24.16.0 <25 || >=26.1.0". Node 22 builds, then the
    # preinstall script aborts; Node 25 is excluded (sqlite NUL truncation).
    if ! node <<'NODE_ENGINE'
const [major, minor, patch] = process.versions.node.split(".").map(Number);
const in24 = major === 24 && (minor > 16 || (minor === 16 && patch >= 0));
const in26 = major > 26 || (major === 26 && (minor > 1 || (minor === 1 && patch >= 0)));
if (!in24 && !in26) process.exit(1);
NODE_ENGINE
    then
        echo "error: OpenClaw requires Node >=24.16.0 <25 or >=26.1.0; found $(node -v) ($(command -v node))." >&2
        echo "error: install extra/nodejs (26) or extra/nodejs-lts-krypton (24), then rebuild." >&2
        echo "error: nodejs-lts-jod (22) cannot build or run this release." >&2
        return 1
    fi

    # Dynamically patch the install script with the correct package name
    sed -i "s/@PKGNAME@/$pkgname/g" "${srcdir}/openclaw.install"

    # @openclaw/fs-safe comes from the registry during bun install, at the
    # version package.json pins (currently 0.18.2). Building the fs-safe git
    # checkout instead compiles a newer incompatible release and requires the
    # wasm32-unknown-unknown Rust target, which is not a makedepend. That
    # source build aborted prepare() before OpenClaw itself compiled.

    # Run the main openclaw patch script (performs bun install)
    cd "$srcdir/openclaw"
    bash "${srcdir}/openclaw-patch.sh"

    if [ -n "$OPENCLAW_REVERT_382fe80" ]; then
        echo "Reverting commit 382fe80 (restoring Google Antigravity)..."
        gzip -d < "$srcdir/openclaw-commit-382fe80" > "$srcdir/openclaw-commit-382fe80.patch"
        patch -R -p1 < "$srcdir/openclaw-commit-382fe80.patch"
    fi

    node scripts/ui.js install || true

    if [[ ! -f node_modules/@openclaw/fs-safe/package.json ]]; then
        echo "error: bun install did not provide node_modules/@openclaw/fs-safe." >&2
        echo "error: OpenClaw imports @openclaw/fs-safe during tsdown-build." >&2
        return 1
    fi
    echo "Using published @openclaw/fs-safe $(node -pe 'require("./node_modules/@openclaw/fs-safe/package.json").version')"
}

build() {
    cd "$srcdir/openclaw"

    # Bypass pnpm-shaped exec for build-all substeps. tsdown-build.mts then runs
    # `node node_modules/tsdown/dist/run.mjs` directly (see OPENCLAW_BUILD_ALL_NO_PNPM),
    # which is more reliable under Bun-hoisted node_modules than `.bin` shims.
    # pnpm is not a makedepend; without this flag the runner looks for `pnpm` on PATH.
    export OPENCLAW_BUILD_ALL_NO_PNPM=1
    # Never restore a stale build-all cache across makepkg runs.
    export OPENCLAW_BUILD_CACHE=0
    # Declaration emit via rolldown-plugin-dts balloons past ~12GB RSS and never
    # finishes writing root dist/ (zod CJS .d.cts storm). Runtime only needs JS;
    # package() already strips *.d.ts from the payload.
    export OPENCLAW_RUN_NODE_SKIP_DTS_BUILD=1

    if [[ ! -f node_modules/tsdown/dist/run.mjs ]]; then
        echo "error: tsdown is not installed (node_modules/tsdown/dist/run.mjs missing)." >&2
        echo "error: the tsdown-build step cannot run; check prepare()/bun install." >&2
        return 1
    fi

    # Do not use the default `full` profile: it runs write-plugin-sdk-entry-dts /
    # check-plugin-sdk-exports, which require the declaration emit we skip above.
    # qaRuntime covers the runtime graph: plugins assets, tsdown, postbuild, stamps.
    # Upstream renamed this from scripts/build-all.mjs to scripts/build-all.mts.
    node --import tsx scripts/build-all.mts qaRuntime

    # Extra full-profile steps that do not need .d.ts output.
    node --import tsx scripts/copy-hook-metadata.ts || true
    node --import tsx scripts/write-build-info.ts || true
    node --import tsx scripts/write-cli-startup-metadata.ts || true

    if [[ ! -d dist ]] || [[ -z "$(find dist -name '*.js' -print -quit 2>/dev/null)" ]]; then
        echo "error: build produced no dist/*.js output (tsdown-build failed or was incomplete)." >&2
        return 1
    fi
    echo "Build OK: $(find dist -name '*.js' | wc -l) JS files in dist/ ($(du -sh dist | awk '{print $1}'))"

    node scripts/ui.js build || true
}

package() {
    cd "$srcdir/openclaw"
    
    echo "Creating package directory structure..."
    install -d "$pkgdir/usr/lib/openclaw"
    
    # Safely copy directories that exist to the package directory.
    # packages/ holds workspace libs (@openclaw/ai, agent-core, …) that dist/
    # imports as externals — without them the CLI/TUI fails at runtime with
    # ERR_MODULE_NOT_FOUND for @openclaw/ai (and friends).
    for dir in assets dist dist-runtime docs extensions node_modules packages patches scripts skills git-hooks; do
        if [ -d "$dir" ]; then
            cp -a "$dir" "$pkgdir/usr/lib/openclaw/"
        fi
    done
    # Always materialize a real entrypoint file (never preserve a dangling link).
    install -Dm755 openclaw.mjs "$pkgdir/usr/lib/openclaw/openclaw.mjs"
    install -Dm644 package.json "$pkgdir/usr/lib/openclaw/package.json"
    install -Dm644 AGENTS.md "$pkgdir/usr/lib/openclaw/AGENTS.md"

    # Early aggressive removal of any musl packages that may have slipped through
    # (defense in depth even if bunfig.toml restricted architectures).
    cd "$pkgdir/usr/lib/openclaw"
    echo "Early removal of any musl-specific native packages in pkgdir..."
    find node_modules -maxdepth 4 -type d \( \
        -iname '*musl*' \
      \) -exec rm -rf {} + 2>/dev/null || true
    cd "$srcdir/openclaw"

    # Copy runtime workspace templates. HEARTBEAT.md (and only it) lives under
    # src/agents/templates/ in the source tree; other templates remain under docs/.
    # The runtime (workspace.ts) resolves relative to the package root and
    # throws if the template is missing. See https://github.com/openclaw/openclaw
    if [ -d "src/agents/templates" ]; then
        install -d "$pkgdir/usr/lib/openclaw/src/agents/templates"
        cp -r src/agents/templates/. "$pkgdir/usr/lib/openclaw/src/agents/templates/"
    fi

    # --- PERFORM PRUNING INSIDE $pkgdir ---
    cd "$pkgdir/usr/lib/openclaw"
    
    echo "Aggressively pruning heavy non-runtime assets from package..."
    rm -rf .git .github .artifacts .agents .pi .vscode .npmrc test qa Swabble vendor
    rm -f pnpm-lock.yaml bun.lockb tsconfig*.json vite.config.ts vitest*.config.ts .eslint* .prettier* .oxlint*
    
    # Prune extension node_modules (we hoisted the important ones to root)
    echo "Pruning redundant extension node_modules..."
    rm -rf ui/node_modules packages/*/node_modules extensions/*/node_modules dist/extensions/*/node_modules

    # --- VERY EARLY: Completely remove all musl-specific native packages ---
    # These are optional platform packages (e.g. @anthropic-ai/claude-agent-sdk-linux-x64-musl,
    # @github/copilot-linuxmusl-x64, sharp-linuxmusl-x64, lightningcss-linux-x64-musl, etc.)
    # They contain huge ELF binaries dynamically linked against musl libc.
    # On glibc-based Arch they are useless and cause namcap/makepkg warnings about
    # missing "libc.musl-x86_64.so.1".
    echo "Removing all musl-specific native packages (glibc-only system)..."
    find node_modules -maxdepth 4 -type d \( \
        -iname '*musl*' \
      \) -exec rm -rf {} + 2>/dev/null || true
    
    echo "Pruning development tools and caches..."
    # We MUST keep typescript and tsx as they are used for runtime plugin loading and code tools.
    # (vite is removed later in the aggressive cleanup pass — it is not needed at runtime.)
    rm -rf node_modules/@typescript node_modules/tsdown node_modules/@rolldown node_modules/rolldown node_modules/@oxlint node_modules/oxlint node_modules/@oxlint-tsgolint node_modules/oxlint-tsgolint node_modules/@oxfmt node_modules/oxfmt node_modules/esbuild node_modules/@esbuild node_modules/vitest node_modules/@vitest node_modules/jscpd node_modules/madge node_modules/.cache
    
    echo "Aggressive removal of native binaries + runtime-irrelevant bloat..."
    # This is deliberately broad because the final package is a self-contained runtime,
    # not a development environment. We can (and do) ship a lot less than a normal
    # `bun install` or `npm install` tree.

    # --- Native / prebuild / .node cleanup (much more aggressive) ---
    # 1. Nuke every prebuilds/ directory except the linux-x64 variants.
    #    This catches bare-*, napi-rs, better-sqlite3, sharp, lancedb, etc.
    find node_modules -type d -name prebuilds -print0 2>/dev/null | while IFS= read -r -d '' pre; do
      find "$pre" -mindepth 1 -maxdepth 1 ! -path "*linux-x64*" -exec rm -rf {} + 2>/dev/null || true
    done

    # 2. Remove any .node binary whose path indicates a non-linux-x64 platform.
    #    Also catch common wrong-arch directories (Release, build, binding, etc.).
    find node_modules \( -name "*.node" -o -path "*/Release/*.node" -o -path "*/build/*.node" \) 2>/dev/null | while read -r f; do
      # musl is never usable on Arch glibc, even when the path also says x64
      # (e.g. @koromix/koffi-linux-x64/musl_x64/koffi.node).
      if echo "$f" | grep -qiE 'musl'; then
        rm -f "$f" 2>/dev/null || true
        continue
      fi
      if echo "$f" | grep -qiE '(darwin|win32|arm64|aarch64|linux-arm|android|ios)'; then
        if ! echo "$f" | grep -qiE 'linux-x64'; then
          rm -f "$f" 2>/dev/null || true
        fi
      fi
    done

    # 3. Deep targeted sweeps inside the heaviest native packages.
    #    These often ship 5-10x more platform data than they need.
    for heavy in \
      sharp lancedb playwright playwright-core \
      tree-sitter @lancedb @tree-sitter \
      bare-fs bare-os bare-url \
      better-sqlite3 node-llama-cpp \
      @napi-rs @swc @oxc-project \
      @anthropic-ai @github; do
      dir="node_modules/$heavy"
      if [ -d "$dir" ]; then
        find "$dir" -path '*darwin*' -o -path '*win32*' -o -path '*arm64*' \
             -o -path '*aarch64*' -o -path '*linux-arm*' -o -path '*android*' \
             -o -path '*ios*' -o -path '*musl*' \
          | xargs rm -rf 2>/dev/null || true
      fi
    done

    # Final safety net: any remaining musl directories anywhere in node_modules
    # (catches deeply nested musl variants that the maxdepth-2 pass missed)
    find node_modules -type d -iname '*musl*' \
      -exec rm -rf {} + 2>/dev/null || true

    # Nested node_modules duplicates that hoisting didn't eliminate
    find node_modules -path '*/node_modules/*/node_modules' -type d -prune \
      -exec rm -rf {} + 2>/dev/null || true

    # Various editor / VCS / cache noise that sometimes appears
    find node_modules -name ".git*" -o -name ".editorconfig" -o -name ".prettierrc*" \
      | xargs rm -rf 2>/dev/null || true

    # Never delete a path that surviving JS or package.json still resolves.
    # Pattern deletes (src/, .ts, .d.ts, tests, docs, …) only run on
    # unreferenced files. Deleting protobufjs/src while minimal.js still
    # require("./src/index-minimal") is how WhatsApp/baileys broke; deleting
    # OpenTelemetry build/src because a directory was named "src" is the same
    # class of bug.
    echo "Pruning unreferenced node_modules bloat (keeping anything survivors still resolve)..."
    node <<'PRUNE_REFS'
const fs = require("fs");
const path = require("path");

const root = path.resolve("node_modules");
const jsExt = new Set([".js", ".cjs", ".mjs"]);
const skipCond = new Set(["types", "typings", "source", "@zod/source"]);
const importRe =
  /(?:require\s*\(\s*|from\s+|import\s*\(\s*|new\s+URL\s*\(\s*)['"](\.\.?\/[^'"]+)['"]/g;
const bloatDirs = new Set([
  "test",
  "__tests__",
  "tests",
  "fixtures",
  "__fixtures__",
  "examples",
  "docs",
  "benchmarks",
  "benchmark",
  "coverage",
  ".nyc_output",
  ".turbo",
  ".github",
]);
const compiledSiblings = ["dist", "lib", "build", "cjs", "esm"];
const bloatFile = (name) =>
  /\.d\.(ts|mts|cts)$/.test(name) ||
  /\.([cm]?js)\.map$/.test(name) ||
  /\.tsx?$/.test(name) ||
  /^(README|CHANGELOG|HISTORY|CONTRIBUTING|AUTHORS|LICENSE|LICENCE)/i.test(name) ||
  /\.(md|markdown)$/i.test(name);

function isTsOrDts(spec) {
  return /\.d\.(ts|mts|cts)$/.test(spec) || /\.tsx?$/.test(spec);
}

function collectRuntimeSpecs(value, cond, out) {
  if (typeof value === "string") {
    if (!skipCond.has(cond) && !isTsOrDts(value)) out.push(value);
    return;
  }
  if (Array.isArray(value)) {
    for (const item of value) collectRuntimeSpecs(item, cond, out);
    return;
  }
  if (value && typeof value === "object") {
    for (const [key, item] of Object.entries(value)) collectRuntimeSpecs(item, key, out);
  }
}

function runtimeSpecs(pkg) {
  const out = [];
  collectRuntimeSpecs(pkg.main, "default", out);
  collectRuntimeSpecs(pkg.module, "module", out);
  if (typeof pkg.browser === "string") collectRuntimeSpecs(pkg.browser, "browser", out);
  else if (pkg.browser && typeof pkg.browser === "object") {
    for (const item of Object.values(pkg.browser)) collectRuntimeSpecs(item, "browser", out);
  }
  collectRuntimeSpecs(pkg.exports, "default", out);
  if (typeof pkg.bin === "string") collectRuntimeSpecs(pkg.bin, "bin", out);
  else if (pkg.bin && typeof pkg.bin === "object") {
    for (const item of Object.values(pkg.bin)) collectRuntimeSpecs(item, "bin", out);
  }
  return out;
}

function listPackages(dir, acc = []) {
  if (!fs.existsSync(dir)) return acc;
  for (const ent of fs.readdirSync(dir, { withFileTypes: true })) {
    if (!ent.isDirectory() && !ent.isSymbolicLink()) continue;
    if (ent.name.startsWith(".")) continue;
    const child = path.join(dir, ent.name);
    if (ent.name.startsWith("@")) {
      listPackages(child, acc);
      continue;
    }
    if (fs.existsSync(path.join(child, "package.json"))) acc.push(child);
  }
  return acc;
}

const referenced = new Set();

function protect(abs) {
  let cur;
  try {
    cur = fs.existsSync(abs) ? fs.realpathSync(abs) : path.resolve(abs);
  } catch {
    cur = path.resolve(abs);
  }
  while (true) {
    referenced.add(cur);
    const parent = path.dirname(cur);
    if (parent === cur || !parent.startsWith(root)) break;
    cur = parent;
  }
}

function resolveRel(fromFile, spec) {
  const cleaned = spec.split("?")[0].split("#")[0];
  const base = path.resolve(path.dirname(fromFile), cleaned);
  if (cleaned.includes("*")) {
    protect(base.replace(/\/\*.*$/, "") || base);
    return;
  }
  const cands = [base];
  if (!path.extname(path.basename(base))) {
    cands.push(
      base + ".js",
      base + ".cjs",
      base + ".mjs",
      base + ".json",
      base + ".node",
      base + ".wasm",
      path.join(base, "index.js"),
      path.join(base, "index.cjs"),
      path.join(base, "index.mjs"),
      path.join(base, "package.json"),
    );
  }
  let hit = false;
  for (const cand of cands) {
    if (fs.existsSync(cand)) {
      protect(cand);
      hit = true;
    }
  }
  if (!hit) protect(base);
}

function walkFiles(start, onFile) {
  const stack = [start];
  while (stack.length) {
    const cur = stack.pop();
    let ents;
    try {
      ents = fs.readdirSync(cur, { withFileTypes: true });
    } catch {
      continue;
    }
    for (const ent of ents) {
      const full = path.join(cur, ent.name);
      if (ent.isDirectory()) {
        if (ent.name === "node_modules") continue;
        stack.push(full);
        continue;
      }
      if (ent.isFile()) onFile(full);
    }
  }
}

for (const pkgDir of listPackages(root)) {
  protect(path.join(pkgDir, "package.json"));
  let pkg = {};
  try {
    pkg = JSON.parse(fs.readFileSync(path.join(pkgDir, "package.json"), "utf8"));
  } catch {
    continue;
  }
  for (const spec of runtimeSpecs(pkg)) {
    const normalized = String(spec).replace(/\\/g, "/");
    resolveRel(path.join(pkgDir, "package.json"), normalized.startsWith(".") ? normalized : "./" + normalized);
  }
}

walkFiles(root, (full) => {
  if (!jsExt.has(path.extname(full))) return;
  let text;
  try {
    text = fs.readFileSync(full, "utf8");
  } catch {
    return;
  }
  importRe.lastIndex = 0;
  let match;
  while ((match = importRe.exec(text))) resolveRel(full, match[1]);
});

function isProtected(abs) {
  return referenced.has(abs);
}

function hasCompiledSibling(pkgDir) {
  return compiledSiblings.some((name) => fs.existsSync(path.join(pkgDir, name)));
}

let filesRemoved = 0;
let dirsRemoved = 0;
let srcKept = 0;

walkFiles(root, (full) => {
  const name = path.basename(full);
  const rel = path.relative(root, full);
  if (rel.startsWith("typescript" + path.sep) || rel === "typescript") return;
  if (!bloatFile(name)) return;
  if (isProtected(full)) return;
  try {
    fs.rmSync(full, { force: true });
    filesRemoved++;
  } catch {
    /* ignore */
  }
});

for (const pkgDir of listPackages(root)) {
  const srcDir = path.join(pkgDir, "src");
  if (!fs.existsSync(srcDir) || !fs.statSync(srcDir).isDirectory()) continue;
  if (isProtected(srcDir) || !hasCompiledSibling(pkgDir)) {
    srcKept++;
    continue;
  }
  fs.rmSync(srcDir, { recursive: true, force: true });
  dirsRemoved++;
}

const stack = [root];
while (stack.length) {
  const cur = stack.pop();
  let ents;
  try {
    ents = fs.readdirSync(cur, { withFileTypes: true });
  } catch {
    continue;
  }
  for (const ent of ents) {
    if (!ent.isDirectory()) continue;
    const full = path.join(cur, ent.name);
    if (ent.name === "node_modules") continue;
    if (bloatDirs.has(ent.name) && !isProtected(full)) {
      fs.rmSync(full, { recursive: true, force: true });
      dirsRemoved++;
      continue;
    }
    stack.push(full);
  }
}

console.log(
  `unreferenced bloat: removed ${filesRemoved} files, ${dirsRemoved} dirs; kept ${srcKept} package-root src/ trees`,
);
PRUNE_REFS

    # Leftover build caches and incremental info
    find node_modules -name "*.tsbuildinfo" -o -name ".turbo" -o -name ".cache" \
      | xargs rm -rf 2>/dev/null || true

    # WebAssembly files for other platforms (rare but exists in some AI/media packages)
    find node_modules -name "*.wasm" 2>/dev/null | while read -r f; do
      if echo "$f" | grep -qiE '(darwin|win32|arm|android|ios)'; then
        rm -f "$f" 2>/dev/null || true
      fi
    done

    echo "Pruning build artifacts and source maps..."
    find dist -type f \( -name "*.js.map" -o -name "*.d.ts" -o -name "*.d.mts" \) -delete
    
    echo "Finalizing node_modules cleanup..."
    # Only remove READMEs and other typical non-code root files (shallow)
    find node_modules -maxdepth 2 -type f \( -name "README*" -o -name "CHANGELOG*" -o -name "HISTORY*" -o -name "AUTHORS*" -o -name "LICENSE*" \) -delete 2>/dev/null || true
    # Remove broken symlinks in .bin
    find node_modules/.bin -xtype l -delete 2>/dev/null || true
    # Remove empty directories in node_modules
    find node_modules -type d -empty -delete 2>/dev/null || true

    # Note: The heavy lifting for tests, .ts, .d.ts, .md, prebuilds, nested node_modules, etc.
    # is now done in the much more aggressive block above ("Aggressive removal of native binaries...").

    # --- SPECIAL HANDLING: nested 'openclaw' package / Bun self-link ---
    # Bun often installs node_modules/openclaw as a symlink to ".." (the package
    # root). The old "slim" path followed that symlink and ran:
    #   ln -sfn ../../openclaw.mjs node_modules/openclaw/openclaw.mjs
    # which rewrote the REAL /usr/lib/openclaw/openclaw.mjs into a broken link
    # (../../openclaw.mjs → /usr/openclaw.mjs). That makes `openclaw tui` die
    # immediately with MODULE_NOT_FOUND.
    if [ -e "node_modules/openclaw" ] || [ -L "node_modules/openclaw" ]; then
        echo "Normalizing node_modules/openclaw ..."
        _oc_resolved="$(readlink -f node_modules/openclaw 2>/dev/null || true)"
        _self_resolved="$(pwd -P)"
        _is_self_link=0
        if [ -L "node_modules/openclaw" ]; then
            _target="$(readlink node_modules/openclaw)"
            if [ "$_target" = ".." ] || [ "$_target" = "." ] || [ "$_oc_resolved" = "$_self_resolved" ]; then
                _is_self_link=1
            fi
        fi

        if [ "$_is_self_link" -eq 1 ]; then
            echo "  Bun self-link detected (node_modules/openclaw -> package root); replacing with a real stub dir"
            rm -f node_modules/openclaw
            mkdir -p node_modules/openclaw
        elif [ -d "node_modules/openclaw" ]; then
            echo "  Slimming duplicated node_modules/openclaw directory..."
            find node_modules/openclaw -mindepth 1 -maxdepth 1 \
                ! -name 'package.json' \
                ! -name 'openclaw.mjs' \
                ! -name 'THIRD_PARTY_NOTICES.md' \
                ! -name 'npm-shrinkwrap.json' \
                -exec rm -rf {} + 2>/dev/null || true
        fi

        # Authoritative package.json + minimal runtime wiring (paths relative to
        # node_modules/openclaw/, NOT followed through a self-link).
        cp package.json node_modules/openclaw/package.json 2>/dev/null || true
        node -e '
          const fs = require("fs");
          const p = "node_modules/openclaw/package.json";
          try {
            const pkg = JSON.parse(fs.readFileSync(p, "utf8"));
            pkg.exports = pkg.exports || {};
            if (!pkg.exports["./package.json"]) {
              pkg.exports["./package.json"] = "./package.json";
            }
            // Drop workspace: protocol so Node does not try to resolve workspaces.
            for (const section of ["dependencies", "devDependencies", "optionalDependencies", "peerDependencies"]) {
              const bag = pkg[section];
              if (!bag) continue;
              for (const [name, ver] of Object.entries(bag)) {
                if (typeof ver === "string" && ver.startsWith("workspace:")) {
                  bag[name] = "*";
                }
              }
            }
            fs.writeFileSync(p, JSON.stringify(pkg, null, 2));
          } catch (e) {}
        ' 2>/dev/null || true

        ln -sfn ../../dist node_modules/openclaw/dist 2>/dev/null || true
        ln -sfn ../../openclaw.mjs node_modules/openclaw/openclaw.mjs 2>/dev/null || true
        ln -sfn ../../docs node_modules/openclaw/docs 2>/dev/null || true
    fi

    # --- Materialize @openclaw/* workspace packages ---
    # dist/ imports e.g. @openclaw/ai as externals. After bun install those are
    # usually symlinks into packages/<name>. Re-link so Node can resolve them.
    if [ -d packages ]; then
        echo "Linking workspace packages into node_modules/@openclaw/ ..."
        mkdir -p node_modules/@openclaw
        for pkg_dir in packages/*/; do
            [ -f "${pkg_dir}package.json" ] || continue
            # Only keep package.json + dist (drop src/tests).
            find "$pkg_dir" -mindepth 1 -maxdepth 1 \
                ! -name 'package.json' \
                ! -name 'dist' \
                ! -name 'LICENSE' \
                ! -name 'README.md' \
                -exec rm -rf {} + 2>/dev/null || true
            if [ ! -d "${pkg_dir}dist" ]; then
                echo "  skip $(basename "$pkg_dir") (no dist/)"
                continue
            fi
            short="$(node -pe 'JSON.parse(require("fs").readFileSync(process.argv[1],"utf8")).name.replace(/^@openclaw\//,"")' "${pkg_dir}package.json" 2>/dev/null || true)"
            [ -n "$short" ] || continue
            rm -rf "node_modules/@openclaw/$short"
            ln -sfn "../../packages/$(basename "$pkg_dir")" "node_modules/@openclaw/$short"
            echo "  linked @openclaw/$short -> packages/$(basename "$pkg_dir")"
        done
    fi

    # Root package.json still says "workspace:*" for @openclaw/ai after our patch
    # script; Node ignores the version string if the package exists, but rewrite
    # for honesty / tooling.
    node -e '
      const fs = require("fs");
      const p = "package.json";
      try {
        const pkg = JSON.parse(fs.readFileSync(p, "utf8"));
        for (const section of ["dependencies", "devDependencies", "optionalDependencies", "peerDependencies"]) {
          const bag = pkg[section];
          if (!bag) continue;
          for (const [name, ver] of Object.entries(bag)) {
            if (typeof ver === "string" && ver.startsWith("workspace:")) bag[name] = "*";
          }
        }
        fs.writeFileSync(p, JSON.stringify(pkg, null, 2));
      } catch (e) {}
    ' 2>/dev/null || true

    # --- Drop large build/dev tools that are not required at runtime ---
    # typescript + tsx are intentionally kept (see earlier comment).
    # vite is a build tool / dev server; references in the tree are to theme names ("vitesse-*")
    # or vitest compat shims, not the vite package itself.
    echo "Removing large build-time-only packages (vite and related)..."
    rm -rf node_modules/vite node_modules/rolldown node_modules/@rolldown 2>/dev/null || true
    rm -rf node_modules/tsdown node_modules/unrun 2>/dev/null || true

    # One more pass to clean any symlinks that became broken during the above
    find node_modules -xtype l -delete 2>/dev/null || true
    find node_modules -type d -empty -delete 2>/dev/null || true

    # Final guard: entrypoint must be a regular file, not a symlink.
    if [ -L openclaw.mjs ] || [ ! -f openclaw.mjs ]; then
        echo "error: openclaw.mjs is missing or a symlink after packaging; restoring from srcdir" >&2
        if [ -f "$srcdir/openclaw/openclaw.mjs" ] && [ ! -L "$srcdir/openclaw/openclaw.mjs" ]; then
            install -Dm755 "$srcdir/openclaw/openclaw.mjs" openclaw.mjs
        else
            echo "error: cannot restore openclaw.mjs from $srcdir/openclaw" >&2
            return 1
        fi
    fi
    if [ ! -e node_modules/@openclaw/ai ]; then
        echo "error: node_modules/@openclaw/ai missing after packaging (TUI/CLI will fail)" >&2
        return 1
    fi

    # --- END PRUNING ---

    cd "$srcdir/openclaw"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README-arch.md"
    install -Dm644 "$srcdir/openclaw-restart.hook" "$pkgdir/usr/share/doc/$pkgname/openclaw-restart.hook.sample"

    for i in docker-compose.yml Dockerfile Dockerfile.sandbox Dockerfile.sandbox-browser; do
        if [ -f "$i" ]; then
            install -Dm644 "$i" "$pkgdir/usr/share/doc/$pkgname/examples/$i"
        fi
    done

    install -d "$pkgdir/usr/bin"
    cat >"$pkgdir/usr/bin/openclaw" <<WRAPPERSCRIPT
#!/bin/bash
exec node /usr/lib/openclaw/openclaw.mjs "\$@"
WRAPPERSCRIPT
    chmod +x "$pkgdir/usr/bin/openclaw"

    install -m755 "$srcdir/openclaw-bwrap" "$pkgdir/usr/bin/openclaw-bwrap"
    install -m755 "$srcdir/openclaw-agent-bwrap" "$pkgdir/usr/bin/openclaw-agent-bwrap"
    install -m755 "$srcdir/openclaw-bwrap-install-as-systemd-user-service" "$pkgdir/usr/bin/openclaw-bwrap-install-as-systemd-user-service"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
