# Maintainer: Wuxxin <wuxxin@gmail.com>
pkgname=openclaw-git
pkgver=2026.1.30.r83.g7a8a39a14
pkgrel=1
pkgdesc="Personal AI assistant that runs on your own devices"
arch=('x86_64')
url="https://github.com/openclaw/openclaw"
license=('MIT')
depends=('nodejs>=22' 'bubblewrap')
makedepends=('git' 'pnpm' 'python')
optdepends=('bubblewrap: for experimental additional sandboxed execution')
provides=('openclaw')
conflicts=('openclaw')
source=(
    'git+https://github.com/openclaw/openclaw.git'
    'openclaw-bwrap'
    'openclaw-agent-bwrap'
    'openclaw-container-agent-bwrap'
    'enable-npm-plugins.patch'
)
sha256sums=(
    'SKIP'
    '5e43df7c13ce9e21d3bf3ebd5822b7ae2f861aed0c07928ca9aa18be87fa1fa7'
    'b27805f3e54150ad6ff847bde895fb1eb241381e823bdd3f9b72326b4bc3668a'
    '45ddfb003f77bb90d25418f7a342b83b6bcfb6ad0f0d942f2a41539ec0f8b791'
    '950e18562fa7665373f9f907dfc380ef1e701f7f1a39b440f61cc6258ae2236e'
)

pkgver() {
    cd "$srcdir/openclaw"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/openclaw"
    # Apply patches
    patch -p1 <"$srcdir/enable-npm-plugins.patch"
    # Sharp needs node-gyp resolvable in node_modules when building from source
    pnpm add -D -w node-gyp
    pnpm install
    # Install UI dependencies
    pnpm ui:install
}

build() {
    cd "$srcdir/openclaw"
    pnpm build
    # Build Control UI
    pnpm ui:build
}

package() {
    cd "$srcdir/openclaw"

    # Install the package source to /usr/lib/openclaw
    install -d "$pkgdir/usr/lib/openclaw"
    cp -r dist node_modules package.json openclaw.mjs scripts extensions assets skills patches docs git-hooks AGENTS.md README.md README-header.png CHANGELOG.md "$pkgdir/usr/lib/openclaw/"

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
    install -m755 "$srcdir/openclaw-container-agent-bwrap" "$pkgdir/usr/bin/openclaw-container-agent-bwrap"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
