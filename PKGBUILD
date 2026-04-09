Maintainer: Skoczi <skoczi_real@gmail.com>
pkgname=csco-launcher-git
pkgver=r1.gabcdef0
pkgrel=1
pkgdesc="Community Launcher for Classic Offensive (CS:CO)"
arch=('x86_64')
url="https://github.com/Skoczi/csco_launcher"
license=('custom:unknown')
depends=(
    'electron'
    'libxss'
    'nss'
)
makedepends=(
    'git'
    'npm'
    'nodejs'
)
provides=('csco-launcher')
conflicts=('csco-launcher')
source=("${pkgname}::git+https://codeberg.org/Skoczi/csco-launcher")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"
    npm install --ignore-scripts
}

build() {
    cd "${pkgname}"
    chmod +x scripts/build.sh
    npm run build

    npm prune --production
}

package() {
    cd "${pkgname}"

    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r dist electron node_modules package.json "${pkgdir}/usr/lib/${pkgname}/"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/csco-launcher" <<EOF
#!/bin/bash
exec electron /usr/lib/${pkgname} "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/csco-launcher"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/csco-launcher.desktop" <<EOF
[Desktop Entry]
Name=Classic Offensive Launcher
Comment=Community Launcher for Classic Offensive (CS:CO)
Exec=csco-launcher %U
Icon=csco-launcher
Type=Application
Categories=Game;
StartupNotify=true
EOF

    if [ -f "src/assets/csco.ico" ]; then
        install -dm755 "${pkgdir}/usr/share/pixmaps"
        install -Dm644 src/assets/csco.ico \
            "${pkgdir}/usr/share/pixmaps/csco-launcher.ico"
    fi
    if [ -f "src/assets/csco.png" ]; then
        install -Dm644 src/assets/csco.png \
            "${pkgdir}/usr/share/pixmaps/csco-launcher.png"
    fi
}

