# Maintainer: Evert
# Contributor: Emir-Eins <emir-eins@outlook.com>
# Contributor: Wuxxin <wuxxin@gmail.com>


pkgname=openclaw
pkgver=2026.4.15
pkgrel=2
pkgdesc="Personal AI assistant that runs on your own devices"
arch=('x86_64')
url="https://github.com/openclaw/openclaw"
license=('MIT')
depends=('nodejs>=22' 'bubblewrap')
makedepends=('bun' 'pnpm' 'npm' 'python')
optdepends=('bubblewrap: for experimental additional sandboxed execution')
conflicts=('openclaw-git')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/openclaw/openclaw/archive/refs/tags/v$pkgver.tar.gz"
    'openclaw-bwrap'
    'openclaw-agent-bwrap'
    'openclaw-bwrap-install-as-systemd-user-service'
    'openclaw-patch.sh'
    'openclaw.install'
    'README.md'
)

install=openclaw.install
sha256sums=('920d8e0e3c4d9c2d2d9a184c82d98a833f308cdd56a4fd282cec918466b4efe3'
            '28568550c4674efc8b90a9b4ea5cf9dc024770275c089499a5cc5d7064d1bba8'
            '44b23035089628327dbb05b1aa7a6daf09f21b82c0172ca59ed4576d3aa7b9a5'
            '34fa95679d51f4d5be120e98714f8b580689e57bef6eb031dcf35c0b26948e7d'
            '2c2ddb5d0187435f14fcb19aa908bb60500f17344eca8c16c8cc69b281f0b2ab'
            '908569172f29dcc788eb4d98a5fcff89ddaee9d4f656a1abcd59456d2e52bd9e'
            '817f2a15928521a5e3b9206ee227cbe0b699932fe8f54eaa6a4290c59608dff2')

options=('!strip' '!debug')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    bash "$srcdir/openclaw-patch.sh" --patch

    # bun has a bug with pnpm-lock.yaml workspace link migration (bun/issues/23026)
    # which causes @agentclientprotocol/sdk and other scoped packages to fail with 405.
    # Use pnpm (the upstream package manager) for dependency installation instead.
    # Restore pnpm as packageManager field so pnpm install accepts the project.
    sed -i 's/"packageManager": "bun@[^"]*"/"packageManager": "pnpm@10.30.3"/' package.json
    # Arch packaging should not fail just because an upstream dependency was published recently.
    # Disable pnpm's minimumReleaseAge gate for the build environment.
    sed -i 's/^minimumReleaseAge: .*/minimumReleaseAge: 0/' pnpm-workspace.yaml
    pnpm install
    # Install UI dependencies (scripts/ui.js detects bun and uses it if available)
    bun run ui:install
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    bun run build
    # Build Control UI
    bun run ui:build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

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
