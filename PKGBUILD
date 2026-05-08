# Maintainer: Emir-Eins <emir-eins@outlook.com>
# Contributor: Wuxxin <wuxxin@gmail.com>
# Maintainer: Solomon <shlomochoina@gmail.com>
pkgname=openclaw-bun-git
_pkgver=2026.4.19.beta.2
pkgver=2026.4.19.beta.2.r10690.gf49beec09aa
pkgrel=1
pkgdesc="Personal AI assistant that runs on your own devices (Bun build, highly optimized)"
arch=('x86_64')
url="https://github.com/openclaw/openclaw"
license=('MIT')
depends=('nodejs>=22')
makedepends=('git' 'bun' 'npm' 'python')
optdepends=('bubblewrap: for experimental additional sandboxed execution'
            'oxlint: for system-wide fast linting in doctor'
            'oxfmt: for system-wide fast formatting in doctor'
            'markdownlint-cli2: for system-wide documentation linting'
            'typescript: for system-wide tsc support')

provides=('openclaw')
conflicts=('openclaw' 'openclaw-git')
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
            '28568550c4674efc8b90a9b4ea5cf9dc024770275c089499a5cc5d7064d1bba8'
            '44b23035089628327dbb05b1aa7a6daf09f21b82c0172ca59ed4576d3aa7b9a5'
            '34fa95679d51f4d5be120e98714f8b580689e57bef6eb031dcf35c0b26948e7d'
            '3df0ba27df4db0c270370cccfaf417fe96f7dbff0d96d165dee34741605e751b'
            '7f7dc1a6d0c96c018de6c73b7594dc15c268c4152a0ade8001406055962c89a7'
            'cdaf01acb58af62348c6f669f8b77675f66428a8ae41b4b4e371739492fb05c6'
            '76ed2119685ad98af2823f6c0d96e258b93af689c5bee0b572fd9f82d032093a'
            '817f2a15928521a5e3b9206ee227cbe0b699932fe8f54eaa6a4290c59608dff2')

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

    # 3. Surgically install built fs-safe into openclaw node_modules AFTER bun install
    echo "Surgically installing local @openclaw/fs-safe build..."
    mkdir -p "$srcdir/openclaw/node_modules/@openclaw/fs-safe"
    cp -r "$srcdir/fs-safe/dist" "$srcdir/fs-safe/package.json" "$srcdir/openclaw/node_modules/@openclaw/fs-safe/"

    if [ -n "$OPENCLAW_REVERT_382fe80" ]; then
        echo "Reverting commit 382fe80 (restoring Google Antigravity)..."
        gzip -d < "$srcdir/openclaw-commit-382fe80" > "$srcdir/openclaw-commit-382fe80.patch"
        patch -R -p1 < "$srcdir/openclaw-commit-382fe80.patch"
    fi

    node scripts/ui.js install || true
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

    # --- PERFORM PRUNING INSIDE $pkgdir ---
    cd "$pkgdir/usr/lib/openclaw"
    
    echo "Aggressively pruning heavy non-runtime assets from package..."
    rm -rf .git .github .artifacts .agents .pi .vscode .npmrc test qa Swabble vendor
    rm -f pnpm-lock.yaml bun.lockb tsconfig*.json vite.config.ts vitest*.config.ts .eslint* .prettier* .oxlint*
    
    # Prune extension node_modules (we hoisted the important ones to root)
    echo "Pruning redundant extension node_modules..."
    rm -rf ui/node_modules packages/*/node_modules extensions/*/node_modules dist/extensions/*/node_modules
    
    echo "Pruning development tools and caches..."
    # We MUST keep typescript and tsx as they are used for runtime plugin loading and code tools
    rm -rf node_modules/@typescript node_modules/tsdown node_modules/@rolldown node_modules/rolldown node_modules/@oxlint node_modules/oxlint node_modules/@oxlint-tsgolint node_modules/oxlint-tsgolint node_modules/@oxfmt node_modules/oxfmt node_modules/esbuild node_modules/@esbuild node_modules/vitest node_modules/@vitest node_modules/jscpd node_modules/madge node_modules/.cache
    
    echo "Purging all non-glibc/non-x64 platform binaries..."
    find node_modules -name "*musl*" -o -name "*arm64*" -o -name "*darwin*" -o -name "*win32*" -o -name "*armv7*" | \
        grep -vE "linux-x64$" | xargs rm -rf 2>/dev/null || true

    echo "Pruning build artifacts and source maps..."
    find dist -type f \( -name "*.js.map" -o -name "*.d.ts" -o -name "*.d.mts" \) -delete
    
    echo "Finalizing node_modules cleanup..."
    # Only remove READMEs and other typical non-code root files
    find node_modules -maxdepth 2 -type f \( -name "README*" -o -name "CHANGELOG*" -o -name "HISTORY*" -o -name "AUTHORS*" -o -name "LICENSE*" \) -delete 2>/dev/null || true
    # Remove broken symlinks in .bin
    find node_modules/.bin -xtype l -delete 2>/dev/null || true
    # Remove empty directories in node_modules
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
