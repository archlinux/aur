pkgname=ensoai
pkgver=0.2.43
pkgrel=1
pkgdesc="Multiple AI Agents, Parallel Workflow - Git worktree manager with AI integration"
arch=('x86_64')
url="https://github.com/J3n5en/EnsoAI"
license=('MIT')
depends=('electron39')
makedepends=('nodejs>=20' 'pnpm>=10' 'git' 'libxcrypt-compat')
optdepends=(
    'claude-cli: Claude AI agent support'
    'codex: Codex AI agent support'
    'cursor: Cursor AI agent support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bb60548347264068cc675c6dd6f1283512e57aff7903e3c51f1dd70373809976')

prepare() {
    cd "$srcdir/EnsoAI-$pkgver"
    sed -i '/"name":/a\  "homepage": "https://github.com/J3n5en/EnsoAI",' package.json
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    pnpm install --frozen-lockfile
}

build() {
    cd "$srcdir/EnsoAI-$pkgver"
    export NODE_ENV=production
    pnpm build:linux
}

package() {
    cd "$srcdir/EnsoAI-$pkgver"
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    if [ -d "dist/linux-unpacked/resources" ]; then
        cp -r dist/linux-unpacked/resources "$pkgdir/usr/lib/$pkgname/"
    fi
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/sh
exec electron39 /usr/lib/ensoai/resources/app.asar "$@"
EOF
    chmod +x "$pkgdir/usr/bin/$pkgname"
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=EnsoAI
Comment=Multiple AI Agents, Parallel Workflow
Exec=$pkgname %U
Icon=$pkgname
Type=Application
Categories=Development;Utility;IDE;
Terminal=false
StartupWMClass=EnsoAI
StartupWMClass=enso-ai
EOF
    if [ -f "build/icon.png" ]; then
        install -Dm644 build/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
    elif [ -f "resources/icon.png" ]; then
        install -Dm644 resources/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
    fi
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
