# Ex-Maintainer: atvknox <atvknox at gmail dot com>
# Contributor: Christopher Cooper <christopher@cg505.com>

pkgname=happy-cli
pkgver=1.1.8
pkgrel=2
pkgdesc="Mobile and Web client for Claude Code and Codex - remote control your AI coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/slopus/happy"
license=('MIT')

depends=('nodejs>=18' 'ripgrep' 'difftastic' 'git')
makedepends=('pnpm' 'npm')
provides=("$pkgname")
conflicts=()

install='happy-cli.install'

source=("$pkgname-$pkgver.tar.gz::https://github.com/slopus/happy/archive/refs/tags/cli-$pkgver.tar.gz")
b2sums=('15a4b414fd6fd2caaafd796caab1b0c866a3dfc2ab301565dd20ae64533fefb20b0b50e7500844a5af2e88b77fe79eaabfddb4ed88a7d5f0f45818637f96b1f4')

# Skip stripping to handle multi-architecture binary targets cleanly
options=('!strip')

prepare() {
    cd "$srcdir/happy-cli-$pkgver"

    # Patch difftastic to use system binary instead of pulling standalone tool downloads
    sed -i "s|resolve(join(projectPath(), 'tools', 'unpacked', binaryName))|'/usr/bin/difft'|" \
        packages/happy-cli/src/modules/difftastic/index.ts

    # Fix shebangs only for known entrypoints cleanly
    sed -i '1s|^#!.*|#!/usr/bin/env node|' \
        packages/happy-cli/bin/happy.mjs \
        packages/happy-cli/bin/happy-mcp.mjs
}

build() {
    cd "$srcdir/happy-cli-$pkgver"

    export PNPM_HOME="$srcdir/.pnpm-home"
    export npm_config_store_dir="$srcdir/.pnpm-store"

    # Install dependencies with frozen lockfile cleanly
    pnpm install --frozen-lockfile --aggregate-output

    # Compile the workspace package using explicit directory target tracking
    pnpm --filter ./packages/happy-cli build

    rm -rf "$srcdir/isolated-dist"

    # Deploy production dependencies with legacy hoisting (required for pnpm v10)
    pnpm --filter ./packages/happy-cli deploy --legacy --prod "$srcdir/isolated-dist"
}

package() {
    cd "$srcdir/happy-cli-$pkgver"

    install -dm755 "$pkgdir/usr/lib/$pkgname"
    install -dm755 "$pkgdir/usr/bin"

    cp -r "$srcdir/isolated-dist/"* "$pkgdir/usr/lib/$pkgname/"

    # Remove upstream dev artifact
    rm -f "$pkgdir/usr/lib/$pkgname/scripts/unpack-tools.cjs"

    # Remove reproducibility-breaking metadata configurations and log assets
    find "$pkgdir/usr/lib/$pkgname/node_modules" -name ".modules.yaml" -delete 2>/dev/null || true
    find "$pkgdir/usr/lib/$pkgname" -name "*.log" -delete 2>/dev/null || true

    # Ensure runtime tool directory exists
    install -dm755 "$pkgdir/usr/lib/$pkgname/tools/unpacked"

    chmod 755 "$pkgdir/usr/lib/$pkgname/bin/"*.mjs

    # Create dynamic runtime wrapper using a quoted heredoc for maximum safety and clean syntax
    cat > "$pkgdir/usr/lib/$pkgname/happy-wrapper" << 'EOF'
#!/bin/bash
export NODE_NO_WARNINGS=1
exec /usr/lib/happy-cli/bin/happy.mjs "$@"
EOF

    chmod 755 "$pkgdir/usr/lib/$pkgname/happy-wrapper"

    ln -sf "/usr/lib/$pkgname/happy-wrapper" "$pkgdir/usr/bin/happy"
    ln -sf "/usr/lib/$pkgname/bin/happy-mcp.mjs" "$pkgdir/usr/bin/happy-mcp"
    
    # Target root-level monorepo license definition for long-term layout robustness
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
