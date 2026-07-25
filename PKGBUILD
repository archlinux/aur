# Maintainer: MotherSphere <mothersphere.colony@gmail.com>
pkgname=colony-bin
_pkgname=colony
pkgver=0.9.1
pkgrel=1
pkgdesc="Application launcher for the Project-Colony ecosystem (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Project-Colony/Colony"
license=('MIT')
depends=(
    'gcc-libs'
    'openssl'
    'xz'
    'gtk3'
    'xdotool'
    'dbus'
    'vulkan-icd-loader'
)
provides=('colony')
conflicts=('colony' 'colony-git')
source=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/colony-linux"
        "${_pkgname}-icon-${pkgver}.png::https://raw.githubusercontent.com/Project-Colony/Colony/v${pkgver}/assets/icons/icon.png")
noextract=("${_pkgname}-${pkgver}")
# Split sums so the release automation can update the binary's hash with a
# simple line-anchored sed without touching the (stable) icon hash.
_binsha='d76de6926bfa5a8cb282179487d29a38e88c7f50a590e8d249fa5fbf57570ed5'
_iconsha='b2a6ae79e9cea7718d0457f9e2623d3a62a2fc4978f4ff0ef5457c1b865b3af4'
sha256sums=("${_binsha}" "${_iconsha}")

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

    # The hicolor icon the desktop entry has referenced all along.
    install -Dm644 "${srcdir}/${_pkgname}-icon-${pkgver}.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

    # Desktop entry so GNOME/KDE/rofi/wofi launchers pick up Colony.
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/colony.desktop" <<'EOF'
[Desktop Entry]
Name=Colony
GenericName=Application Launcher
Comment=Application launcher for the Project-Colony ecosystem
Exec=colony
Icon=colony
Terminal=false
Type=Application
Categories=Utility;System;
Keywords=launcher;apps;project-colony;
StartupNotify=true
EOF
}
