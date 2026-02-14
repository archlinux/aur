# Maintainer: Wuxxin <wuxxin@gmail.com>
pkgname=openclaw-git
pkgver=2026.2.9.r84.g8933010e84
pkgrel=1
pkgdesc="Personal AI assistant that runs on your own devices"
arch=('x86_64')
url="https://github.com/openclaw/openclaw"
license=('MIT')
depends=('nodejs>=22' 'bubblewrap')
makedepends=('git' 'bun' 'python')
optdepends=('bubblewrap: for experimental additional sandboxed execution')
provides=('openclaw')
conflicts=('openclaw')
source=(
    'git+https://github.com/openclaw/openclaw.git'
    'openclaw-bwrap'
    'openclaw-agent-bwrap'
    'openclaw-bwrap-install-as-systemd-user-service'
    'enable-npm-plugins.patch'
    'openclaw.install'
    'README.md'
)
install=openclaw.install
sha256sums=('SKIP'
            '28568550c4674efc8b90a9b4ea5cf9dc024770275c089499a5cc5d7064d1bba8'
            '44b23035089628327dbb05b1aa7a6daf09f21b82c0172ca59ed4576d3aa7b9a5'
            '828733c8f4d0f25974463b48cd93e219015d872aecbeda1fdcabf72a181fc65b'
            '5e1f0836e1066c3676582b496f94eb77e00e57d047e3005300033020404f95a0'
            '72cf00f138984381e747bafe04d853d4f8dc3b6e2fa92f58e0739e881eda2799'
            'd141bf464007efa0bfe424cc066564094fccd85f4d990f34522f0756c610fdf6')

options=('!strip' '!debug')

pkgver() {
    cd "$srcdir/openclaw"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "head.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/openclaw"
    # Apply patches
    patch -p1 <"$srcdir/enable-npm-plugins.patch"

    sed -i 's/pnpm /bun run /g' package.json
    # Replace pnpm exec with bun run in bundle-a2ui.sh
    sed -i 's/pnpm.*exec/bun run/g' scripts/bundle-a2ui.sh
    # Also update packageManager field just in case
    sed -i 's/"packageManager": "pnpm@.*/"packageManager": "bun@1.2.0",/' package.json
    # Inject Bun support into scripts/ui.js
    sed -i '/function resolveRunner() {/a \  const bun = which("bun"); if (bun) return { cmd: bun, kind: "bun" };' scripts/ui.js

    # Sharp needs node-gyp resolvable in node_modules when building from source
    bun add -d node-gyp
    bun install
    # Install UI dependencies
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
