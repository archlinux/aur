# Maintainer: Your Name <your.email@example.com>
pkgname=ensoai
pkgver=0.2.25
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
sha256sums=('15507ef940a9a837a0cbe33de1f95f1e1cb12ddc1a66ad4f5f762493b95f69f3')

prepare() {
    cd "$srcdir/EnsoAI-$pkgver"

    # Add homepage to package.json for electron-builder
    sed -i '/"name":/a\  "homepage": "https://github.com/J3n5en/EnsoAI",' package.json

    # Install dependencies
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    pnpm install --frozen-lockfile
}

build() {
    cd "$srcdir/EnsoAI-$pkgver"

    # Build the application
    export NODE_ENV=production
    pnpm build:linux
}

package() {
    cd "$srcdir/EnsoAI-$pkgver"

    # Install application resources
    install -dm755 "$pkgdir/usr/lib/$pkgname"

    # Copy app.asar and resources
    if [ -d "dist/linux-unpacked/resources" ]; then
        cp -r dist/linux-unpacked/resources "$pkgdir/usr/lib/$pkgname/"
    fi

    # Create launcher script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/sh
exec electron39 /usr/lib/ensoai/resources/app.asar "$@"
EOF
    chmod +x "$pkgdir/usr/bin/$pkgname"

    # Install desktop file
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
EOF

    # Install icon (adjust path if needed)
    if [ -f "build/icon.png" ]; then
        install -Dm644 build/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
    elif [ -f "resources/icon.png" ]; then
        install -Dm644 resources/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
    fi

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
