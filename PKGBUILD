# Maintainer: DonutsDelivery
pkgname=simple-claude-gui
pkgver=1.3.15
pkgrel=1
pkgdesc="Desktop app for managing multiple Claude Code sessions across projects"
arch=('x86_64')
url="https://github.com/DonutsDelivery/simple-claude-gui"
license=('MIT')
depends=('electron' 'nodejs')
makedepends=('npm' 'git')
source=("git+https://github.com/DonutsDelivery/simple-claude-gui.git")
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

    # Install desktop file
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Simple Claude GUI
Comment=Multi-session Claude Code terminal manager
Exec=electron /usr/lib/$pkgname/main/index.js
Icon=$pkgname
Terminal=false
Type=Application
Categories=Development;IDE;
Keywords=claude;terminal;ai;code;
EOF

    # Install launcher script
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/bash
exec electron /usr/lib/$pkgname/main/index.js "\$@"
EOF
}
