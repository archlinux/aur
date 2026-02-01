# Maintainer: Wuxxin <wuxxin@gmail.com>
pkgname=openclaw-git
pkgver=2026.1.30.r100.gd3e53eaf2
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
    'openclaw-install-systemd-user-service'
    'enable-npm-plugins.patch'
)
sha256sums=('SKIP'
            'aaea26c3563aeef9def080e6d7d587710cd9a08022e80238e8d87db7569100c2'
            '3285fb067e78ccd588abac722eb4c03b3b56ee36ec92e333e0749bf065898ea0'
            '44688c25fd6c6414ac4f7dbe249a94d9b38097e51ae0af79b13c4b5837ee23fb'
            '201b0587aa16e5525d5991367e637f46c7e7691dcdfbd0e8ab8cac4ca11233ec')

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
    install -m755 "$srcdir/openclaw-install-systemd-user-service" "$pkgdir/usr/bin/openclaw-install-systemd-user-service"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
