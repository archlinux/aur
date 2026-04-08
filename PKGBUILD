# Maintainer: Alex Macocian <amacocian@yahoo.com>
pkgname=hyprchat
pkgver=0.2.6
pkgrel=1
pkgdesc="Lightweight AI chat panel for Hyprland built with QuickShell"
arch=('x86_64')
url="https://github.com/AlexMacocian/hyprchat"
license=('MIT')
depends=(
    'quickshell'
    'gnome-keyring'
    'libsecret'
    'openssl'
    'inotify-tools'
    'kitty'
)
makedepends=('dotnet-sdk>=10')
optdepends=(
    'github-cli: for GitHub Copilot device flow login'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AlexMacocian/hyprchat/archive/v${pkgver}.tar.gz")
sha256sums=('6d01f2815cdace42019863a4aac2275c35b0db9450b3b8b0d7686be217b1f6db')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/src/hyprchat-backend"
    dotnet publish -c Release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install NativeAOT backend binary
    install -Dm755 src/hyprchat-backend/Publish/HyprChat.Backend \
        "${pkgdir}/usr/lib/${pkgname}/HyprChat.Backend"

    # Install QuickShell config files
    install -dm755 "${pkgdir}/usr/share/quickshell/${pkgname}"
    cp -r src/hyprchat-ui/*.qml src/hyprchat-ui/qmldir "${pkgdir}/usr/share/quickshell/${pkgname}/"

    # Install docs
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r Documentation/* "${pkgdir}/usr/share/doc/${pkgname}/"

    # Install license
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/hyprchat" << 'EOF'
#!/bin/bash
exec quickshell -p /usr/share/quickshell/hyprchat/shell.qml "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/hyprchat"
}
