# Maintainer: Emir-Eins <emir-eins@outlook.com>
# Contributor: Wuxxin <wuxxin@gmail.com>
pkgname=openclaw-git
pkgver=2026.3.13.1.r1649.g4c60956d8e5
pkgrel=1
pkgdesc="Personal AI assistant that runs on your own devices"
arch=('x86_64')
url="https://github.com/openclaw/openclaw"
license=('MIT')
depends=('nodejs>=22' 'bubblewrap')
makedepends=('git' 'bun' 'pnpm' 'npm' 'python')
optdepends=('bubblewrap: for experimental additional sandboxed execution')
provides=('openclaw')
conflicts=('openclaw')
source=(
    'git+https://github.com/openclaw/openclaw.git'
    'openclaw-bwrap'
    'openclaw-agent-bwrap'
    'openclaw-bwrap-install-as-systemd-user-service'
    'openclaw-patch.sh'
    'openclaw.install'
    'openclaw-commit-382fe80'
    'README.md'
)

install=openclaw.install
sha256sums=('SKIP'
            '28568550c4674efc8b90a9b4ea5cf9dc024770275c089499a5cc5d7064d1bba8'
            '44b23035089628327dbb05b1aa7a6daf09f21b82c0172ca59ed4576d3aa7b9a5'
            '34fa95679d51f4d5be120e98714f8b580689e57bef6eb031dcf35c0b26948e7d'
            'f2e2fc61027c8753c023debdd4f68a975d8740e8c5d2078bda2c5a0713885fa2'
            '72cf00f138984381e747bafe04d853d4f8dc3b6e2fa92f58e0739e881eda2799'
            'cdaf01acb58af62348c6f669f8b77675f66428a8ae41b4b4e371739492fb05c6'
            '817f2a15928521a5e3b9206ee227cbe0b699932fe8f54eaa6a4290c59608dff2')

options=('!strip' '!debug')

pkgver() {
    cd "$srcdir/openclaw"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/openclaw"
    bash "$srcdir/openclaw-patch.sh" --patch
    if test "$OPENCLAW_REVERT_382fe80" != ""; then
        echo "reverse patching 382fe80"
        gzip -d < "$srcdir/openclaw-commit-382fe80" > $srcdir/openclaw-commit-382fe80.patch
        patch -R -p1 < "$srcdir/openclaw-commit-382fe80.patch"
    fi
    # bun has a bug with pnpm-lock.yaml workspace link migration (bun/issues/23026)
    # which causes @agentclientprotocol/sdk and other scoped packages to fail with 405.
    # Use pnpm (the upstream package manager) for dependency installation instead.
    # Restore pnpm as packageManager field so pnpm install accepts the project.
    sed -i 's/"packageManager": "bun@[^"]*"/"packageManager": "pnpm@10.30.3"/' package.json
    pnpm install
    # Install UI dependencies (scripts/ui.js detects bun and uses it if available)
    bun run ui:install
}

build() {
    cd "$srcdir/openclaw"
    bun run build
    # Build Control UI
    bun run ui:build
}

package() {
    cd "$srcdir/openclaw"

    # Install the package to /usr/lib/openclaw
    install -d "$pkgdir/usr/lib/openclaw"
    cp -r assets dist docs extensions git-hooks node_modules patches scripts skills "$pkgdir/usr/lib/openclaw/"
    cp openclaw.mjs package.json AGENTS.md "$pkgdir/usr/lib/openclaw/"

    rm -f "$pkgdir/usr/lib/openclaw/node_modules/.pnpm-workspace-state-v1.json"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README-arch.md"

    # Install examples
    for i in docker-compose.yml Dockerfile Dockerfile.sandbox Dockerfile.sandbox-browser; do
        install -Dm644 "$i" "$pkgdir/usr/share/doc/$pkgname/examples/$i"
    done

    # Install binary wrapper
    install -d "$pkgdir/usr/bin"

    # Create a wrapper script for the main openclaw executable
    cat >"$pkgdir/usr/bin/openclaw" <<EOF
#!/bin/bash
exec node /usr/lib/openclaw/openclaw.mjs "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/openclaw"

    # Install bwrap scripts
    install -m755 "$srcdir/openclaw-bwrap" "$pkgdir/usr/bin/openclaw-bwrap"
    install -m755 "$srcdir/openclaw-agent-bwrap" "$pkgdir/usr/bin/openclaw-agent-bwrap"
    install -m755 "$srcdir/openclaw-bwrap-install-as-systemd-user-service" \
        "$pkgdir/usr/bin/openclaw-bwrap-install-as-systemd-user-service"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
