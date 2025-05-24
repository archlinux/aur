# Maintainer: Firebleudark <firebleudark@pm.me>
pkgname=autoinstallpackages
pkgver=4.0
pkgrel=1
pkgdesc="Modern post-installation script for Arch Linux with GUI interface"
arch=('any')
url="https://github.com/Firebleudark/Autoinstallpackages"
license=('GPL3')
depends=('bash' 'python' 'tk' 'sudo' 'pacman')
optdepends=(
    'paru: AUR helper for installing AUR packages (auto-installed if missing)'
    'git: Required for paru installation and ML4W dotfiles'
    'base-devel: Required for building AUR packages'
    'flatpak: Optional Flatpak support'
    'timeshift: System backup and restore'
    'gamemode: Gaming performance optimization'
)
provides=('autoinstallpackages')
conflicts=('autoinstallpackages-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Firebleudark/Autoinstallpackages/archive/v${pkgver}.tar.gz")
sha256sums=('38785951794796800e8f747c8b111613aeef9e26e54c54d22bb2794fea89c374')

package() {
    cd "${srcdir}/Autoinstallpackages-${pkgver}"
    
    # Create directories
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "${pkgdir}/usr/share/applications"
    
    # Install main scripts
    install -Dm755 autoinstallpackages.sh "${pkgdir}/usr/share/${pkgname}/autoinstallpackages.sh"
    install -Dm755 autoinstallpackages_gui.py "${pkgdir}/usr/share/${pkgname}/autoinstallpackages_gui.py"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Create wrapper script in /usr/bin
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/bash
# AutoInstallPackages wrapper script
if [[ $EUID -eq 0 ]]; then
    echo "ERROR: Do not run AutoInstallPackages as root!"
    exit 1
fi
cd /usr/share/autoinstallpackages
exec ./autoinstallpackages.sh "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/${pkgname}"
    
    # Create desktop entry
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << 'EOF'
[Desktop Entry]
Name=AutoInstallPackages
Comment=Modern post-installation script for Arch Linux with GUI
Exec=autoinstallpackages --gui
Icon=system-software-install
Terminal=false
Type=Application
Categories=System;Settings;PackageManager;
Keywords=install;packages;arch;linux;post-installation;gui;
EOF
}
