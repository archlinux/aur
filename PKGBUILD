# Contributor: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
 
pkgname=gaiaui-amd
pkgver=0.13.0
pkgrel=1
pkgdesc="Open-source solution for quick setup and execution of generative AI applications on local AMD Ryzen AI hardware"
arch=('x86_64')
url="https://github.com/amd/gaia"
license=('MIT')
source=("https://github.com/amd/gaia/releases/download/v${pkgver}/gaia-linux-setup.deb")
sha256sums=('c68b0e23dc82c6857c26d6eef84bad2fc4ef1d5f10c77187524651654cddb0b0')

depends=(
    'gtk3' 'glib2'
)

optdepends=(
    'lemonade-server' 'vulkan-radeon'
)

package() {
    cd "${srcdir}"
    ar x "${srcdir}/gaia-linux-setup.deb"
    tar --zstd -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"

    echo "=== Reorganizing structure to /opt/gaia ==="
    mkdir -p "${pkgdir}/opt/gaia"

    if [ -d "${pkgdir}/usr" ]; then
        if [ -d "${pkgdir}/usr/bin" ]; then
            mv "${pkgdir}/usr/bin" "${pkgdir}/opt/gaia/"
        fi
        if [ -d "${pkgdir}/usr/lib" ]; then
            mv "${pkgdir}/usr/lib" "${pkgdir}/opt/gaia/"
        fi
        if [ -d "${pkgdir}/usr/share" ]; then
            mv "${pkgdir}/usr/share" "${pkgdir}/opt/gaia/"
        fi
        rmdir "${pkgdir}/usr" 2>/dev/null || true
    fi

    mkdir -p "${pkgdir}/usr/bin"
    if [ -f "${pkgdir}/opt/gaia/bin/gaiaui" ]; then
        ln -s "/opt/gaia/bin/gaiaui" "${pkgdir}/usr/bin/gaiaui"
    fi

    if [ -f "${pkgdir}/opt/gaia/share/applications/gaiaui.desktop" ]; then
        mkdir -p "${pkgdir}/usr/share/applications"
        cp "${pkgdir}/opt/gaia/share/applications/gaiaui.desktop" "${pkgdir}/usr/share/applications/"
        sed -i 's|^Exec=.*|Exec=/opt/gaia/bin/gaiaui|g' "${pkgdir}/usr/share/applications/gaiaui.desktop"
        
        if [ -f "${pkgdir}/opt/gaia/share/pixmaps/gaiaui.png" ]; then
            mkdir -p "${pkgdir}/usr/share/pixmaps"
            cp "${pkgdir}/opt/gaia/share/pixmaps/gaiaui.png" "${pkgdir}/usr/share/pixmaps/"
            sed -i 's|^Icon=.*|Icon=gaiaui|g' "${pkgdir}/usr/share/applications/gaiaui.desktop"
        fi
        
        if ! grep -q "^Icon=" "${pkgdir}/usr/share/applications/gaiaui.desktop"; then
            echo "Icon=gaiaui" >> "${pkgdir}/usr/share/applications/gaiaui.desktop"
        fi
    fi

    find "${pkgdir}/opt/gaia" -type f \( -name "gaia-ui" -o -name "gaiaui" -o -name "*.so" -o -name "chrome-sandbox" -o -name "chrome_crashpad_handler" \) -exec chmod 755 {} \; 2>/dev/null || true
    chmod 644 "${pkgdir}/usr/share/applications/gaiaui.desktop" 2>/dev/null || true
}

post_install() {
    echo "Installation completed. Run 'gaiaui' to start the interface."
    echo "Full application files are located at: /opt/gaia"
}
