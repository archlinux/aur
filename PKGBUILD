pkgname=zcode-bin
pkgver=2.13.0
pkgrel=1
pkgdesc="ZCode - AI-powered code editor by CodeGeeX"
arch=('x86_64')
url="https://codegeex.cn/"
license=('MIT' 'custom:ZCode')
depends=('zlib' 'hicolor-icon-theme')
makedepends=('asar')
options=('!strip')
source=("ZCode-${pkgver}-linux-x64.AppImage::https://cdn.codegeex.cn/zcode/electron/releases/${pkgver}/ZCode-${pkgver}-linux-x64.AppImage"
        "zcode.desktop"
        "LICENSE")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    # Extract AppImage to get the application files
    chmod +x "${srcdir}/ZCode-${pkgver}-linux-x64.AppImage"
    "${srcdir}/ZCode-${pkgver}-linux-x64.AppImage" --appimage-extract >/dev/null 2>&1 || true

    # Fix missing buffer-crc32 dependency in app.asar
    # yazl (a transitive dependency of the app) requires buffer-crc32
    # but the upstream AppImage packaging omitted it
    asar extract "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/asar-extract"

    # Install buffer-crc32 in a temp dir to avoid the app's workspace: protocol npm entries
    mkdir -p "${srcdir}/npm-tmp"
    (cd "${srcdir}/npm-tmp" && npm init -y >/dev/null 2>&1 && npm install buffer-crc32@1.0.0 >/dev/null 2>&1)

    cp -r "${srcdir}/npm-tmp/node_modules/buffer-crc32" "${srcdir}/asar-extract/node_modules/"
    asar pack "${srcdir}/asar-extract" "${srcdir}/squashfs-root/resources/app.asar"

    rm -rf "${srcdir}/asar-extract" "${srcdir}/npm-tmp"
}

package() {
    # Install extracted application to /opt/zcode
    mkdir -p "${pkgdir}/opt/zcode"
    cp -a "${srcdir}/squashfs-root/"* "${pkgdir}/opt/zcode"
    # Fix directory permissions: AppImage extraction creates 0700 dirs,
    # preventing non-root users from accessing libs, resources, and locales
    find "${pkgdir}/opt/zcode" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/zcode" -type f -exec chmod 644 {} \;
    find "${pkgdir}/opt/zcode" -type f \( -name "*.so" -o -name "*.so.*" \) -exec chmod 755 {} \;
    # Restore exec bit on binaries and scripts
    chmod 755 "${pkgdir}/opt/zcode/zcode" \
             "${pkgdir}/opt/zcode/chrome_crashpad_handler" \
             "${pkgdir}/opt/zcode/chrome-sandbox" \
             "${pkgdir}/opt/zcode/AppRun" 2>/dev/null || true

    # ACP provider binaries (ELF executables bundled in resources)
    chmod 755 "${pkgdir}/opt/zcode/resources/opencode/opencode" \
             "${pkgdir}/opt/zcode/resources/glm/zcode-acp" \
             "${pkgdir}/opt/zcode/resources/tools/ripgrep/rg" 2>/dev/null || true

    # Codex ACP provider binary (ELF executable bundled in node_modules)
    chmod 755 "${pkgdir}/opt/zcode/resources/codex/node_modules/@zed-industries/codex-acp-linux-x64/bin/codex-acp" 2>/dev/null || true

    # Remove duplicated icons (installed system-wide below)
    rm -rf "${pkgdir}/opt/zcode/usr/share/icons"

    # Create launcher script (avoids FUSE and sets library paths correctly)
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'LAUNCHER_EOF'
#!/bin/bash
HERE="/opt/zcode"
export PATH="${HERE}/usr/bin:${HERE}/usr/sbin:${HERE}/usr/games:${HERE}/bin:${HERE}/sbin:${PATH}"
export LD_LIBRARY_PATH="${HERE}/usr/lib:${HERE}/usr/lib/x86_64-linux-gnu:${HERE}/lib:${HERE}/lib/x86_64-linux-gnu:${LD_LIBRARY_PATH}"
export XDG_DATA_DIRS="${HERE}/usr/share:${XDG_DATA_DIRS}"
exec "${HERE}/zcode" --no-sandbox "$@"
LAUNCHER_EOF
    chmod +x "${pkgdir}/usr/bin/${pkgname}"

    # Desktop file with correct Exec path
    install -Dm644 "${srcdir}/zcode.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install icons from the extracted AppImage
    for size in 16 32 48 64 128 256 512 1024; do
        if [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/zcode.png" ]; then
            install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/zcode.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/zcode.png"
        fi
    done

    # Install MIT license for packaging scripts
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
