pkgname=cortexide-bin
pkgver=1.99.30.0.2
pkgrel=1
pkgdesc="CortexIDE - Open-source AI code editor (Cursor alternative). Binary release."
arch=('x86_64')
url="https://opencortexide.com"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libxkbfile' 'glibc')
provides=('cortexide')
conflicts=('cortexide')
options=('!strip')
install=$pkgname.install
source=("https://github.com/OpenCortexIDE/cortexide-binaries/releases/download/${pkgver}/CortexIDE-linux-x64-${pkgver}.tar.gz"
        "cortexide.desktop"
        "cortexide-bin.sh")
sha256sums=('8502aa26aeb5cd6fd9cf81a383cc484da05e0380a5dc866793eb14fb72ff0be3'
            '8df48a32c432512ff9ca60a9d47a91ddab32b7dffd39f122ae6482e71bfb155d'
            '0f86f23788bb6b87049f6eab607a4f7c62e19802394a4f80a8706ed7310ac7b2')

prepare() {
    mkdir -p "${srcdir}/CortexIDE"
    tar -xf "CortexIDE-linux-x64-${pkgver}.tar.gz" -C "${srcdir}/CortexIDE"
}

package() {
    # Install to /opt/cortexide (not /opt/cortexide-bin to match wrapper script)
    install -d "${pkgdir}/opt/cortexide"
    
    # Copy application files WITHOUT overwriting existing installation
    # Use specific directories instead of cp -R .*
    cp -r "${srcdir}/CortexIDE/"* "${pkgdir}/opt/cortexide/"

    # Fix permissions for executables
    chmod +x "${pkgdir}/opt/cortexide/cortexide"
    chmod +x "${pkgdir}/opt/cortexide/bin/cortexide"
    chmod +x "${pkgdir}/opt/cortexide/bin/cortexide-tunnel"
    chmod 4755 "${pkgdir}/opt/cortexide/chrome-sandbox"

    # Install launcher script
    install -Dm755 "${srcdir}/cortexide-bin.sh" "${pkgdir}/usr/bin/cortexide"

    # Install the desktop entry
    install -Dm644 "${srcdir}/cortexide.desktop" "${pkgdir}/usr/share/applications/cortexide.desktop"

    # Install icon in standard location
    local _icon="${pkgdir}/opt/cortexide/resources/app/resources/linux/code.png"
    if [ -f "${_icon}" ]; then
        install -Dm644 "${_icon}" "${pkgdir}/usr/share/pixmaps/cortexide.png"
    else
        echo "WARNING: Icon not found at ${_icon}"
    fi

    # Install license
    install -Dm644 "${srcdir}/CortexIDE/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
