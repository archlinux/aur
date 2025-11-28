# Maintainer: Plat <contact@plat.plus>
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
source=("https://github.com/OpenCortexIDE/cortexide-binaries/releases/download/${pkgver}/CortexIDE-linux-x64-${pkgver}.tar.gz"
        "cortexide.desktop")
sha256sums=('8502aa26aeb5cd6fd9cf81a383cc484da05e0380a5dc866793eb14fb72ff0be3'
            'dfcd78f455daa4e53c2751547f4397e814251310047e7dc73c43ae7ddbf07153')

prepare() {
    mkdir -p "${srcdir}/${pkgname}-${pkgver}"
    tar -xf "CortexIDE-linux-x64-${pkgver}.tar.gz" -C "${srcdir}/${pkgname}-${pkgver}"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install the main application to /opt/cortexide
    install -d "${pkgdir}/opt/cortexide"
    cp -R ./* "${pkgdir}/opt/cortexide/"

    # Fix permissions for executables
    chmod +x "${pkgdir}/opt/cortexide/cortexide"
    chmod +x "${pkgdir}/opt/cortexide/bin/cortexide"
    chmod +x "${pkgdir}/opt/cortexide/bin/cortexide-tunnel"
    chmod 4755 "${pkgdir}/opt/cortexide/chrome-sandbox"

    # Link the CLI tools to /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/cortexide/bin/cortexide" "${pkgdir}/usr/bin/cortexide"
    ln -s "/opt/cortexide/bin/cortexide-tunnel" "${pkgdir}/usr/bin/cortexide-tunnel"

    # Install the desktop entry
    install -Dm644 "${srcdir}/cortexide.desktop" "${pkgdir}/usr/share/applications/cortexide.desktop"

    # Install icon in multiple standard sizes for better compatibility
    local _icon="${pkgdir}/opt/cortexide/resources/app/resources/linux/code.png"
    
    if [ -f "${_icon}" ]; then
        install -Dm644 "${_icon}" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/cortexide.png"
        install -Dm644 "${_icon}" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/cortexide.png"
        install -Dm644 "${_icon}" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/cortexide.png"
    else
        echo "WARNING: Icon not found at ${_icon}"
    fi
}
