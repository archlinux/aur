# Maintainer: liyp <my@liyp.cc>
pkgname=kun-gui
pkgver=0.2.10
pkgrel=1
pkgdesc="AI agent workspace with Code and Write modes - Electron client"
arch=('x86_64')
url="https://github.com/KunAgent/Kun"
license=('custom:PolyForm-Noncommercial-1.0.0')
depends=('electron34')
makedepends=('npm' 'nodejs>=20' 'python')
optdepends=('libxss: screen saver inhibit support'
            'libappindicator-gtk3: system tray support on GTK-based DEs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KunAgent/Kun/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d6726e1075098acf7a7f3abf1d2c5ad841e9e420fb42434cc8865d68df373781')
options=('!strip')

prepare() {
    cd "${srcdir}/Kun-${pkgver}"
    # Install main project, skip postinstall (it auto-builds kun and tries electron prebuild)
    npm install --ignore-scripts
    # Install kun runtime dependencies
    npm --prefix kun install
}

build() {
    cd "${srcdir}/Kun-${pkgver}"
    # Build kun runtime (was skipped by --ignore-scripts above)
    npm --prefix kun run build
    # Verify kun runtime was built
    if [ ! -f "kun/dist/cli/serve-entry.js" ]; then
        echo "ERROR: kun runtime build failed - kun/dist/cli/serve-entry.js not found"
        return 1
    fi
    echo "==> kun runtime built successfully"
    # Build Electron app (tsc + vite)
    npx electron-vite build
    # Prune to production dependencies only (must be after vite build which needs devDeps)
    npm prune --production
    npm --prefix kun prune --production
}

package() {
    cd "${srcdir}/Kun-${pkgver}"

    # Install application to /usr/lib/kun-gui
    install -d "${pkgdir}/usr/lib/${pkgname}"

    # Copy built output
    cp -r out "${pkgdir}/usr/lib/${pkgname}/out"
    # Fix version: source package.json says 0.1.0, set to actual release version
    # (CI uses electron-builder's extraMetadata + KUN_APP_VERSION, we patch directly)
    sed -i "s/\"version\": \"[^\"]*\"/\"version\": \"${pkgver}\"/" package.json
    install -Dm644 package.json "${pkgdir}/usr/lib/${pkgname}/package.json"

    # Copy production node_modules
    cp -r node_modules "${pkgdir}/usr/lib/${pkgname}/node_modules"

    # Copy kun runtime + dependencies — only into out/main/
    # The app resolves kun path relative to __dirname (out/main/), root-level copy is unused
    mkdir -p "${pkgdir}/usr/lib/${pkgname}/out/main"
    cp -r kun "${pkgdir}/usr/lib/${pkgname}/out/main/kun"

    # Copy vendor dependencies
    if [ -d "vendor" ]; then
        cp -r vendor "${pkgdir}/usr/lib/${pkgname}/vendor"
    fi

    # Aggressively clean up to reduce package size
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -name "*.map" -delete
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -name "*.ts" -not -name "*.d.ts" -delete
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -name "README*" -delete 2>/dev/null || true
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -name "CHANGELOG*" -delete 2>/dev/null || true
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -name ".package-lock.json" -delete
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -type d -name "test" -exec rm -rf {} + 2>/dev/null || true
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -type d -name "tests" -exec rm -rf {} + 2>/dev/null || true
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -type d -name "example" -exec rm -rf {} + 2>/dev/null || true
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -type d -name "examples" -exec rm -rf {} + 2>/dev/null || true
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -type d -name "doc" -exec rm -rf {} + 2>/dev/null || true
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -type d -name "docs" -exec rm -rf {} + 2>/dev/null || true
    # Remove .d.ts type definitions (not needed at runtime) — saves ~10M+
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -name "*.d.ts" -delete
    # Remove TypeScript compiler (devDependency that survived prune) — saves ~23M
    rm -rf "${pkgdir}/usr/lib/${pkgname}/node_modules/typescript"
    # Remove @types packages (type-only, not needed at runtime) — saves ~4M
    rm -rf "${pkgdir}/usr/lib/${pkgname}/node_modules/@types"
    # Remove @napi-rs/canvas native binary (mermaid server-side canvas; Electron uses browser canvas) — saves ~32M
    rm -rf "${pkgdir}/usr/lib/${pkgname}/node_modules/@napi-rs/canvas-linux-x64-gnu"
    # Clean up out/main/kun/ — remove source, tests, build scripts, and type definitions
    rm -rf "${pkgdir}/usr/lib/${pkgname}/out/main/kun/src"
    rm -rf "${pkgdir}/usr/lib/${pkgname}/out/main/kun/tests"
    rm -rf "${pkgdir}/usr/lib/${pkgname}/out/main/kun/scripts"
    find "${pkgdir}/usr/lib/${pkgname}/out/main/kun" -name "*.d.ts" -delete
    find "${pkgdir}/usr/lib/${pkgname}/out/main/kun" -name "*.d.ts.map" -delete
    find "${pkgdir}/usr/lib/${pkgname}/out/main/kun" -name "*.map" -delete

    # Create launch script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << 'LAUNCHER'
#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

if [[ -f "${XDG_CONFIG_HOME}/kun-gui-flags.conf" ]]; then
	mapfile -t KUN_GUI_USER_FLAGS <<<"$(grep -v '^#' "${XDG_CONFIG_HOME}/kun-gui-flags.conf")"
	echo "User flags:" ${KUN_GUI_USER_FLAGS[@]}
fi

exec -a kun-gui /bin/electron34 /usr/lib/kun-gui/out/main/index.js ${KUN_GUI_USER_FLAGS[@]} "$@"
LAUNCHER

    # Install desktop file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << 'EOF'
[Desktop Entry]
Name=Kun
Comment=AI agent workspace with Code and Write modes
Exec=kun-gui %U
Icon=kun-gui
Type=Application
Categories=Development;
StartupWMClass=kun-gui
EOF

    # Install icon to hicolor theme (required for KDE Wayland dock icon matching)
    install -Dm644 "src/asset/img/kun.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kun-gui.png"
    # Also keep in pixmaps as fallback
    install -Dm644 "src/asset/img/kun.png" "${pkgdir}/usr/share/pixmaps/kun-gui.png"

    # Install license
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
PolyForm Noncommercial License 1.0.0
https://polyformproject.org/licenses/noncommercial/1.0.0

Copyright (c) Kun Contributors
EOF
}
