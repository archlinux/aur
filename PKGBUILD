# Maintainer: Wuxxin <wuxxin@gmail.com>
pkgname=openclaw-git
pkgver=2026.1.30.r144.g7ee99af9f
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
    'openclaw-install-systemd-user-service'
    'enable-npm-plugins.patch'
    'openclaw.install'
    'README.md'
)
install=openclaw.install
sha256sums=('SKIP'
            'aaea26c3563aeef9def080e6d7d587710cd9a08022e80238e8d87db7569100c2'
            '3285fb067e78ccd588abac722eb4c03b3b56ee36ec92e333e0749bf065898ea0'
            '5b50d5a4a4991fe95034d4da58e78e142e0bee8f1ba3c9850e2c86b27074805a'
            '5e1f0836e1066c3676582b496f94eb77e00e57d047e3005300033020404f95a0'
            '72cf00f138984381e747bafe04d853d4f8dc3b6e2fa92f58e0739e881eda2799'
            '615a6ec5e675308f9de13449fb682c1df44ea6191146b059437a8743cbb3be1b')

pkgver() {
    cd "$srcdir/openclaw"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

    # Install the package source to /usr/lib/openclaw
    install -d "$pkgdir/usr/lib/openclaw"
    cp -r dist node_modules package.json openclaw.mjs scripts extensions assets skills patches docs git-hooks AGENTS.md README-header.png CHANGELOG.md "$pkgdir/usr/lib/openclaw/"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README-arch.md"

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
    install -m755 "$srcdir/openclaw-install-systemd-user-service" "$pkgdir/usr/bin/openclaw-install-systemd-user-service"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
