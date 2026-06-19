pkgname=zcode-bin
pkgver=3.1.2
pkgrel=1
pkgdesc="ZCode - AI-powered code editor by ZAI"
arch=('x86_64')
url="https://github.com/Anyi-qaq/Zcode-bin"
license=('custom:ZCode')
depends=('gtk3' 'nss' 'libnotify' 'libxss' 'libxtst' 'xdg-utils' 'libsecret' 'hicolor-icon-theme')
options=('!strip')
install=zcode-bin.install
source=("zcode-${pkgver}-linux-x64.deb::https://cdn.codegeex.cn/zcode/electron/releases/${pkgver}/ZCode-${pkgver}-linux-x64.deb"
        "zcode-bin.install"
        "LICENSE")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    # Extract data.tar.xz from the .deb (ar archive)
    ar x "${srcdir}/zcode-${pkgver}-linux-x64.deb" data.tar.xz

    # Install all files from the deb into pkgdir
    tar xf data.tar.xz -C "${pkgdir}"

    # Fix permissions
    find "${pkgdir}/opt/ZCode" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/ZCode" -type f -exec chmod 644 {} \;

    # Restore exec bits on binaries and shared libs
    chmod 755 "${pkgdir}/opt/ZCode/zcode"
    chmod 755 "${pkgdir}/opt/ZCode/chrome-sandbox"
    chmod 755 "${pkgdir}/opt/ZCode/chrome_crashpad_handler"
    chmod 755 "${pkgdir}/opt/ZCode/lib"*.so 2>/dev/null || true
    chmod 755 "${pkgdir}/opt/ZCode/resources/glm/zcode.cjs" 2>/dev/null || true

    # Launcher script (backward compatible with old zcode-bin name)
    mkdir -p "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'LAUNCHER'
#!/bin/bash
exec /opt/ZCode/zcode "$@"
LAUNCHER
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # License
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
