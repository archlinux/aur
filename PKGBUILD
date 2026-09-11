# Maintainer: local build
# Unofficial Linux port of the WorkBuddy AI international (workbuddy.ai) macOS client.
# Conversion toolchain vendored from the MIT-licensed workbuddy-linux community
# project (see LICENSE.port-tool). Not affiliated with Tencent. See DISCLAIMER.

pkgname=workbuddy-international-bin
_pkgver=5.5.2.37849279
_build=910352f0
_electronver=37.10.3
pkgver=${_pkgver}_${_build}
pkgrel=1
pkgdesc="AI Agent for everyday office work (international edition, unofficial Linux port)"
arch=('x86_64')
url="https://www.workbuddy.ai"
license=('custom')
depends=('libsecret' 'libappindicator-gtk3' 'nss' 'alsa-lib' 'gtk3' 'libxss')
makedepends=('nodejs' 'npm' 'p7zip' 'unzip' 'python' 'imagemagick')
optdepends=('nodejs-lts: frontend skills'
            'gnome-shell-extension-appindicator: tray icon support')
options=(!strip !debug)

# The international edition publishes no Linux package; the macOS x64 DMG is the
# canonical source. Version and DMG sha256 are published by the official update
# API:  curl 'https://www.workbuddy.ai/v2/update?platform=workbuddy-darwin-x64'
# The Electron runtime version matches the one bundled in the DMG.
_dmg="WorkBuddy-darwin-x64-${_pkgver}-${_build}.dmg"
_electronzip="electron-v${_electronver}-linux-x64.zip"
source=("${_dmg}::https://codebuddy-1328495429.cos.accelerate.myqcloud.com/workbuddy/saas/darwin-x64/WorkBuddy-darwin-x64-${_pkgver}-${_build}.dmg"
        "${_electronzip}::https://github.com/electron/electron/releases/download/v${_electronver}/${_electronzip}"
        "workbuddy-international.desktop")
sha256sums=('722065401d9e8fc0b49147662198e132f62e18df0ce03baee23336caf1687006'
            'c0b4edd6bd9858cda4cf7ab299e69a2d3ecd2e5fcca78507bc0851ba35614660'
            '6fcbfa4cba8e730e603b68fcca484c7963aacdaf56a3f6c5c47ff320a5189e85')

prepare() {
    # Extract the .app bundle out of the DMG
    rm -rf "${srcdir}/dmg"
    mkdir -p "${srcdir}/dmg"
    7z x -o"${srcdir}/dmg" "${srcdir}/${_dmg}" -y >/dev/null
}

build() {
    # Run the vendored conversion toolchain: use the pre-seeded Linux Electron
    # runtime, rebuild native modules for Linux, apply runtime patches
    # (anchor-tolerant; 5.5.x needs almost none of them).
    export WORKBUDDY_APP_ID="WorkBuddy AI"
    export WORKBUDDY_APP_DISPLAY_NAME="WorkBuddy AI (International)"
    export WORKBUDDY_INSTALL_DIR="${srcdir}/workbuddy-app"
    export WORKBUDDY_ELECTRON_ZIP="${srcdir}/${_electronzip}"
    local app_bundle
    app_bundle="$(find "${srcdir}/dmg" -maxdepth 2 -name "*.app" -type d | head -1)"
    bash "${startdir}/install.sh" "${app_bundle}"
}

package() {
    install -dm755 "${pkgdir}/opt/workbuddy-international"
    cp -a "${srcdir}/workbuddy-app/." "${pkgdir}/opt/workbuddy-international/"

    # The helper desktop file written by install.sh embeds the build-time
    # srcdir in Exec=; point it at the final install location instead.
    sed -i "s|${srcdir}/workbuddy-app|/opt/workbuddy-international|g" \
        "${pkgdir}/opt/workbuddy-international/.workbuddy-linux/WorkBuddy AI.desktop" 2>/dev/null || true

    # Desktop entry: named exactly after the app's Wayland app_id ("WorkBuddy AI")
    # so the task manager associates windows with this entry and its icon.
    install -Dm644 "${startdir}/workbuddy-international.desktop" \
        "${pkgdir}/usr/share/applications/WorkBuddy AI.desktop"

    # Icons: theme-integrated hicolor entry plus pixmaps fallback
    install -Dm644 "${srcdir}/workbuddy-app/.workbuddy-linux/workbuddy.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/workbuddy-international.png"
    install -Dm644 "${srcdir}/workbuddy-app/.workbuddy-linux/workbuddy.png" \
        "${pkgdir}/usr/share/pixmaps/workbuddy-international.png"

    # Launcher
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/workbuddy-international" <<'EOF'
#!/usr/bin/env bash
exec /opt/workbuddy-international/start.sh "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/workbuddy-international"

    # Licenses / notices
    install -Dm644 "${startdir}/LICENSE.port-tool" \
        "${pkgdir}/usr/share/licenses/workbuddy-international/LICENSE.port-tool"
    install -Dm644 "${startdir}/DISCLAIMER" \
        "${pkgdir}/usr/share/licenses/workbuddy-international/DISCLAIMER"
}
