# Maintainer: Alex Macocian <amacocian@yahoo.com>
pkgname=hyprchat
pkgver=0.1.4
pkgrel=1
pkgdesc="Lightweight AI chat panel for Hyprland built with QuickShell"
arch=('any')
url="https://github.com/AlexMacocian/hyprchat"
license=('MIT')
depends=(
    'quickshell'
    'nodejs'
    'gnome-keyring'
    'libsecret'
    'openssl'
    'inotify-tools'
    'kitty'
    'curl'
)
makedepends=('npm')
optdepends=(
    'github-cli: for GitHub Copilot device flow login'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AlexMacocian/hyprchat/archive/v${pkgver}.tar.gz")
sha256sums=('9e2267a77e38112225ad6c5d6ddbc8a87f43db1ab4d633dc6da512184e92ecc0')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install scraper dependencies
    cd src/scraper
    npm install --production
    cd ../..

    # Install QuickShell config files
    install -dm755 "${pkgdir}/usr/share/quickshell/${pkgname}"
    cp -r src/*.qml src/qmldir "${pkgdir}/usr/share/quickshell/${pkgname}/"
    cp -r src/scraper "${pkgdir}/usr/share/quickshell/${pkgname}/"

    # Install docs
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r Documentation/* "${pkgdir}/usr/share/doc/${pkgname}/"

    # Install license
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/hyprchat" << 'EOF'
#!/bin/bash
exec quickshell -p /usr/share/quickshell/hyprchat "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/hyprchat"
}
