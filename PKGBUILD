# Maintainer: DonutsDelivery
pkgname=simple-code-gui
pkgver=1.3.39
pkgrel=1
pkgdesc="Multi-backend AI coding assistant GUI supporting Claude Code, Gemini CLI, Codex, OpenCode, and Aider"
arch=('x86_64')
url="https://github.com/DonutsDelivery/simple-code-gui"
license=('custom:PolyForm-Noncommercial-1.0.0')
depends=('electron' 'nodejs')
makedepends=('npm' 'git')
source=("git+https://github.com/DonutsDelivery/simple-code-gui.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    npm install
    npm run build
}

package() {
    cd "$srcdir/$pkgname"

    # Install app files
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r dist/* "$pkgdir/usr/lib/$pkgname/"
    cp -r node_modules "$pkgdir/usr/lib/$pkgname/"
    cp package.json "$pkgdir/usr/lib/$pkgname/"

    # Install icon
    install -Dm644 resources/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm644 resources/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

    # Install desktop file
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Simple Code GUI
Comment=Multi-backend AI coding assistant GUI
Exec=electron /usr/lib/$pkgname/main/index.js
Icon=$pkgname
Terminal=false
Type=Application
Categories=Development;IDE;
Keywords=claude;terminal;ai;code;gemini;aider;codex;
StartupWMClass=simple-code-gui
EOF

    # Install launcher script
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/bash
exec electron /usr/lib/$pkgname/main/index.js "\$@"
EOF
}
