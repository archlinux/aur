# Maintainer: Emir-Eins <emir-eins@outlook.com>
# Contributor: Wuxxin <wuxxin@gmail.com>
# Maintainer: Solomon <shlomochoina@gmail.com>
pkgname=openclaw-git
_pkgver=2026.5.25.beta.1
pkgver=2026.4.19.beta.2.r23575.g0751b6f2c9a
pkgrel=1
pkgdesc="Personal AI assistant that runs on your own devices (Bun build, highly optimized)"
arch=('x86_64')
url="https://github.com/openclaw/openclaw"
license=('MIT')
depends=('nodejs>=22')
makedepends=('git' 'bun' 'npm' 'python' 'cmake' 'gcc' 'make' 'pkgconf' 'libvips')
optdepends=('bubblewrap: for experimental additional sandboxed execution'
            'oxlint: for system-wide fast linting in doctor'
            'oxfmt: for system-wide fast formatting in doctor'
            'markdownlint-cli2: for system-wide documentation linting'
            'typescript: for system-wide tsc support')

provides=('openclaw')
conflicts=('openclaw')
source=('git+https://github.com/openclaw/openclaw.git'
        'git+https://github.com/openclaw/fs-safe.git'
        'openclaw-bwrap'
        'openclaw-agent-bwrap'
        'openclaw-bwrap-install-as-systemd-user-service'
        'openclaw-patch.sh'
        'openclaw.install'
        'openclaw-commit-382fe80'
        'openclaw-restart.hook'
        'README.md')
sha256sums=('SKIP'
            'SKIP'
            '273910e58f512a4f1d59fe2cde328d7abc68f720f5e6e98a23a06a43c3eb9599'
            '63e557c01ca78e392ac17f37538faff9be6e568bb6d8b33980c8836197fd06ad'
            '34fa95679d51f4d5be120e98714f8b580689e57bef6eb031dcf35c0b26948e7d'
            'd6f84cfe55eeb7e45a4e64eb442d0a0851ed78959a60c481c69d5f60bb07ad61'
            '7f7dc1a6d0c96c018de6c73b7594dc15c268c4152a0ade8001406055962c89a7'
            'cdaf01acb58af62348c6f669f8b77675f66428a8ae41b4b4e371739492fb05c6'
            '025de14715ac9508517d3461f0c35e289c545353443f5cab312a091b630e8b3a'
            '0c177909ae593fb349c0bcbb56dcd5efdc645e75d6e9861647c9defbf604afe5')

options=('!strip' '!debug')

pkgver() {
    cd "$srcdir/openclaw"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        local _count=$(git rev-list --count HEAD)
        local _hash=$(git rev-parse --short HEAD)
        printf "%s.r%s.g%s" "$_pkgver" "$_count" "$_hash"
    fi
}

prepare() {
    # Dynamically patch the install script with the correct package name
    sed -i "s/@PKGNAME@/$pkgname/g" "${srcdir}/openclaw.install"

    # 1. Build @openclaw/fs-safe from source
    echo "Building @openclaw/fs-safe from source..."
    cd "$srcdir/fs-safe"
    bun install
    bun run build

    # 2. Run the main openclaw patch script (performs bun install)
    cd "$srcdir/openclaw"
    bash "${srcdir}/openclaw-patch.sh"

    if [ -n "$OPENCLAW_REVERT_382fe80" ]; then
        echo "Reverting commit 382fe80 (restoring Google Antigravity)..."
        gzip -d < "$srcdir/openclaw-commit-382fe80" > "$srcdir/openclaw-commit-382fe80.patch"
        patch -R -p1 < "$srcdir/openclaw-commit-382fe80.patch"
    fi

    node scripts/ui.js install || true

    # 3. Surgically install built fs-safe into openclaw node_modules AFTER all installations
    echo "Surgically installing local @openclaw/fs-safe build..."
    rm -rf "$srcdir/openclaw/node_modules/@openclaw/fs-safe"
    mkdir -p "$srcdir/openclaw/node_modules/@openclaw/fs-safe"
    cp -r "$srcdir/fs-safe/dist" "$srcdir/fs-safe/package.json" "$srcdir/openclaw/node_modules/@openclaw/fs-safe/"
}

build() {
    cd "$srcdir/openclaw"
    bun run build
    node scripts/ui.js build || true
}

package() {
    cd "$srcdir/openclaw"
    
    echo "Creating package directory structure..."
    install -d "$pkgdir/usr/lib/openclaw"
    
    # Safely copy directories that exist to the package directory
    for dir in assets dist dist-runtime docs extensions node_modules patches scripts skills git-hooks; do
        if [ -d "$dir" ]; then
            cp -r "$dir" "$pkgdir/usr/lib/openclaw/"
        fi
    done
    cp openclaw.mjs package.json AGENTS.md "$pkgdir/usr/lib/openclaw/"

    # Early aggressive removal of any musl packages that may have slipped through
    # (defense in depth even if bunfig.toml restricted architectures).
    cd "$pkgdir/usr/lib/openclaw"
    echo "Early removal of any musl-specific native packages in pkgdir..."
    find node_modules -maxdepth 3 -type d \( \
        -name '*-musl*' -o -name '*linuxmusl*' -o -name '*musl-x64*' \
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
    find node_modules -maxdepth 2 -type d \( \
        -name '*-musl*' -o -name '*linuxmusl*' -o -name '*musl-x64*' \
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
      if echo "$f" | grep -qiE '(darwin|win32|arm64|aarch64|linux-arm|android|ios|musl)'; then
        if ! echo "$f" | grep -qiE 'linux-x64|x64'; then
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
    find node_modules -type d \( -name '*-musl*' -o -name '*linuxmusl*' \) \
      -exec rm -rf {} + 2>/dev/null || true

    # --- General high-value bloat that is never needed at runtime ---
    # These patterns are safe for a production OpenClaw install because:
    # - The app already has its own typescript + tsx for any TS execution.
    # - All first-party code is pre-built into dist/.
    # - Documentation, tests, and types are not loaded by the runtime.

    # Declaration files (huge win — 25k+ of these)
    find node_modules -name "*.d.ts" -o -name "*.d.mts" -o -name "*.d.cts" \
      | xargs rm -f 2>/dev/null || true

    # Source maps that leaked in
    find node_modules -name "*.js.map" -o -name "*.mjs.map" \
      | xargs rm -f 2>/dev/null || true

    # Remaining TypeScript sources (we keep the typescript package itself)
    find node_modules -path 'node_modules/typescript' -prune -o \
      \( -name "*.ts" -o -name "*.tsx" \) -print \
      | xargs rm -f 2>/dev/null || true

    # Markdown, changelogs, licenses at any depth (very common waste)
    find node_modules -type f \( \
        -name "*.md" -o -name "*.markdown" \
        -o -name "CHANGELOG*" -o -name "HISTORY*" -o -name "CONTRIBUTING*" \
        -o -name "LICENSE*" -o -name "LICENCE*" \
      \) -delete 2>/dev/null || true

    # Test, fixture, example, benchmark, and coverage directories
    find node_modules -type d \( \
        -name test -o -name __tests__ -o -name tests \
        -o -name fixtures -o -name __fixtures__ \
        -o -name examples -o -name docs -o -name benchmarks -o -name benchmark \
        -o -name coverage -o -name .nyc_output -o -name .turbo \
        -o -name .github \
      \) -prune -exec rm -rf {} + 2>/dev/null || true

    # Nested node_modules duplicates that hoisting didn't eliminate
    find node_modules -path '*/node_modules/*/node_modules' -type d -prune \
      -exec rm -rf {} + 2>/dev/null || true

    # Various editor / VCS / cache noise that sometimes appears
    find node_modules -name ".git*" -o -name ".editorconfig" -o -name ".prettierrc*" \
      | xargs rm -rf 2>/dev/null || true

    # Safe aggressive src/ removal:
    # Only delete src/ directories when the package has compiled output elsewhere
    # (dist/, lib/, build/, cjs/, esm/). This protects tiny ESM packages like
    # sisteransi, yoctocolors, is-unicode-supported, stdin-discriminator, etc.
    # whose published "main" / "exports" point directly into src/.
    echo "Safely removing src/ directories that have compiled alternatives..."
    # Explicit allowlist of packages known to ship src/ as their runtime
    PROTECTED_SRC_PKGS="sisteransi|yoctocolors|is-unicode-supported|stdin-discriminator|west|prompts|@clack"
    find node_modules -path 'node_modules/typescript' -prune -o -type d -name src -print 2>/dev/null | while read -r srcdir; do
      pkgdir=$(dirname "$srcdir")
      pkgname=$(basename "$pkgdir")
      if echo "$pkgname" | grep -qE "^($PROTECTED_SRC_PKGS)"; then
        continue   # leave it alone
      fi
      if [ -d "$pkgdir/dist" ] || [ -d "$pkgdir/lib" ] || [ -d "$pkgdir/build" ] || \
         [ -d "$pkgdir/cjs" ] || [ -d "$pkgdir/esm" ]; then
        rm -rf "$srcdir" 2>/dev/null || true
      fi
    done

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

    # --- SPECIAL HANDLING: massively duplicated nested 'openclaw' package ---
    # Because of workspace rewriting + Bun hoisted install, node_modules/openclaw contains
    # a near-full duplicate of dist/ (~91M), docs, src, and even its own node_modules.
    # The top-level package already provides everything the runtime needs.
    # We keep a tiny stub so that `import ... from "openclaw"` and the rich "exports" map continue to work.
    if [ -d "node_modules/openclaw" ]; then
        echo "Slimming duplicated node_modules/openclaw (biggest single win)..."

        # Strategy for a robust minimal stub:
        # - Keep (a copy of) the real package.json — it has the complete "exports" map for plugin-sdk/* etc.
        # - Explicitly ensure "./package.json" is resolvable (some runtime code imports it directly).
        # - Delete everything heavy (dist, docs, src, internal node_modules, etc.).
        # - Symlink the big artifacts back to the top-level tree we already ship.

        # Copy the real package.json (small, ~105k) so we have the authoritative exports map
        cp package.json node_modules/openclaw/package.json 2>/dev/null || true

        # Patch the copied package.json to guarantee the ./package.json subpath works
        # (the upstream exports map does not include it by default)
        node -e '
          const fs = require("fs");
          const p = "node_modules/openclaw/package.json";
          try {
            const pkg = JSON.parse(fs.readFileSync(p, "utf8"));
            pkg.exports = pkg.exports || {};
            if (!pkg.exports["./package.json"]) {
              pkg.exports["./package.json"] = "./package.json";
            }
            fs.writeFileSync(p, JSON.stringify(pkg, null, 2));
          } catch (e) {}
        ' 2>/dev/null || true

        # Now delete all the duplicated heavy children
        find node_modules/openclaw -mindepth 1 -maxdepth 1 \
            ! -name 'package.json' \
            ! -name 'openclaw.mjs' \
            ! -name 'THIRD_PARTY_NOTICES.md' \
            ! -name 'npm-shrinkwrap.json' \
            -exec rm -rf {} + 2>/dev/null || true

        # Wire the heavy runtime pieces back via symlinks (saves ~150 MB with zero behavior change)
        ln -sfn ../../dist node_modules/openclaw/dist 2>/dev/null || true
        ln -sfn ../../openclaw.mjs node_modules/openclaw/openclaw.mjs 2>/dev/null || true
        ln -sfn ../../docs node_modules/openclaw/docs 2>/dev/null || true
    fi

    # --- Drop large build/dev tools that are not required at runtime ---
    # typescript + tsx are intentionally kept (see earlier comment).
    # vite is a build tool / dev server; references in the tree are to theme names ("vitesse-*")
    # or vitest compat shims, not the vite package itself.
    echo "Removing large build-time-only packages (vite and related)..."
    rm -rf node_modules/vite node_modules/rolldown node_modules/@rolldown 2>/dev/null || true

    # One more pass to clean any symlinks that became broken during the above
    find node_modules -xtype l -delete 2>/dev/null || true
    find node_modules -type d -empty -delete 2>/dev/null || true

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
