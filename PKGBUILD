# Maintainer: liyp <my@liyp.cc>
pkgname=kun
pkgver=0.2.20
pkgrel=1
pkgdesc="AI agent workspace with Code and Write modes - Electron client"
arch=('x86_64')
url="https://github.com/KunAgent/Kun"
license=('custom:PolyForm-Noncommercial-1.0.0')
depends=('electron34')
makedepends=('npm' 'nodejs>=20' 'python')
optdepends=('libxss: screen saver inhibit support'
            'libappindicator-gtk3: system tray support on GTK-based DEs')
replaces=('kun-gui')
conflicts=('kun-gui')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KunAgent/Kun/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2615e45f556f99e5756d986bd214838153f021a3bb46d0bcae3a10ff7fb7a53e')
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
    # Rebuild native modules (node-pty, etc.) against Electron's ABI
    # node-pty has no linux-x64 prebuild, so node-gyp compilation is required
    npx @electron/rebuild -f -v 34 -m node_modules -o node-pty
    # Prune to production dependencies only (must be after vite build and electron-rebuild)
    npm prune --production
    npm --prefix kun prune --production
}

package() {
    cd "${srcdir}/Kun-${pkgver}"

    # Install application to /usr/lib/kun
    install -d "${pkgdir}/usr/lib/${pkgname}"

    # Copy built output
    cp -r out "${pkgdir}/usr/lib/${pkgname}/out"
    # Patch app identity: source has APP_PRODUCT_NAME="Kun" (uppercase), but .desktop
    # file is kun.desktop (lowercase). Wayland app_id is case-sensitive, must match.
    sed -i 's/APP_PRODUCT_NAME="Kun"/APP_PRODUCT_NAME="kun"/' "${pkgdir}/usr/lib/${pkgname}/out/main/index.js"
    # Fix version: upstream package.json says 0.1.0, set to actual release version
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

if [[ -f "${XDG_CONFIG_HOME}/kun-flags.conf" ]]; then
	mapfile -t KUN_USER_FLAGS <<<"$(grep -v '^#' "${XDG_CONFIG_HOME}/kun-flags.conf")"
	echo "User flags:" ${KUN_USER_FLAGS[@]}
fi

# Use native Wayland when available, fallback to X11
export ELECTRON_OZONE_PLATFORM_HINT=${ELECTRON_OZONE_PLATFORM_HINT:-auto}

# Enable Wayland IME switches even when XWayland is active (DISPLAY is set)
# Without this, the source code's condition (WAYLAND_DISPLAY && !DISPLAY) fails
export KUN_LINUX_WAYLAND_IME=${KUN_LINUX_WAYLAND_IME:-1}

# Set IM environment variables for input method support (fcitx5/ibus)
if [[ -z "${GTK_IM_MODULE}" ]]; then
    if [[ -n "${XMODIFIERS}" && "${XMODIFIERS}" == *"fcitx"* ]]; then
        export GTK_IM_MODULE=fcitx
    elif command -v fcitx5 &>/dev/null; then
        export GTK_IM_MODULE=fcitx
        export XMODIFIERS=${XMODIFIERS:-@im=fcitx}
    elif command -v ibus-daemon &>/dev/null; then
        export GTK_IM_MODULE=ibus
        export XMODIFIERS=${XMODIFIERS:-@im=ibus}
    fi
fi

exec -a kun /bin/electron34 /usr/lib/kun/out/main/index.js \
    --name=kun \
    ${KUN_USER_FLAGS[@]} "$@"
LAUNCHER

    # Install desktop file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << 'EOF'
[Desktop Entry]
Name=Kun
Comment=AI agent workspace with Code and Write modes
Exec=kun %U
Icon=kun
Type=Application
Categories=Development;
StartupWMClass=kun
EOF

    # Install icon to hicolor theme (required for KDE Wayland dock icon matching)
    install -Dm644 "src/asset/img/kun.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kun.png"
    # Also keep in pixmaps as fallback
    install -Dm644 "src/asset/img/kun.png" "${pkgdir}/usr/share/pixmaps/kun.png"

    # Install license
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
PolyForm Noncommercial License 1.0.0
https://polyformproject.org/licenses/noncommercial/1.0.0

Copyright (c) Kun Contributors
EOF
}
