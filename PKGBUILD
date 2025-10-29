# Maintainer: Wrxn <arch at rnny dot xyz>
pkgname=jackify-bin
_pkgname=Jackify
_appimage_name=com.jackify.app
pkgver=0.1.6.6
pkgrel=1
pkgdesc="Jackify - Simplifying Wabbajack modlist installation and configuration on Linux"
arch=('x86_64')
url="https://github.com/Omni-guides/Jackify"
_rawurl=https://raw.githubusercontent.com/Omni-guides/Jackify
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'pyside6'
    'python-psutil'
    'python-requests'
    'python-tqdm'
    'python-yaml'
    'python-vdf'
    'python-packaging'
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}.AppImage"
    "LICENSE-${pkgver}::${_rawurl}/v${pkgver}/LICENSE"
)
sha256sums=('e012ea866642fe5b689b4ad3cc9a5852f1dd9fa5b35304b8518a3d4d90211412'
            'ba4feaea2dc97aa54d3510d203c9180105cda05ed23d26c5253a75f2869bd069')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null

    find "${srcdir}/squashfs-root/" -type d -name '__pycache__' -exec rm -r {} +
}
package() {
    # Install wrapper script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" <<'EOF'
#!/bin/bash
PYTHON_CMD=""
for cmd in python3 python3.12 python3.11 python3.10; do
    if command -v "$cmd" >/dev/null 2>&1; then
        PYTHON_CMD="$cmd"
        break
    fi
done

if [ -z "$PYTHON_CMD" ]; then
    echo "Error: No Python 3 interpreter found"
    exit 1
fi

# Set up Jackify directory structure in user's home
JACKIFY_HOME="$HOME/Jackify"
mkdir -p "$JACKIFY_HOME"/{temp,logs,cache,engine,.tmp}

# Copy jackify-engine to writable location if needed
ENGINE_SOURCE_DIR="/opt/jackify-engine"
ENGINE_TARGET="$JACKIFY_HOME/jackify-engine/jackify-engine"

# Check if we need to update the engine
UPDATE_ENGINE=false
if [ ! -f "$ENGINE_TARGET" ]; then
    UPDATE_ENGINE=true
elif [ "$ENGINE_SOURCE_DIR/jackify-engine" -nt "$ENGINE_TARGET" ]; then
    UPDATE_ENGINE=true
fi

if [ "$UPDATE_ENGINE" = true ]; then
    echo "Copying jackify-engine to writable location..."
    if [ -d "$ENGINE_SOURCE_DIR" ]; then
        rm -rf "$JACKIFY_HOME/engine"
        cp -r "$ENGINE_SOURCE_DIR" "$JACKIFY_HOME/"
        chmod +x "$ENGINE_TARGET"
        chmod +x "$JACKIFY_HOME/engine/Extractors/linux-x64/"* 2>/dev/null || true
    fi
fi

# Jackify checks for APPDIR in a couple areas, to find the engine in /opt/[...] and so on. Setting it to root to emulate that.
export APPDIR="/"
export PYTHONPATH="/opt:$PYTHONPATH"
export JACKIFY_ENGINE_PATH="$ENGINE_TARGET"
exec "$PYTHON_CMD" -m jackify.frontends.gui "$@"
EOF

    install -d "${pkgdir}/opt/jackify"
    cp -r "${srcdir}/squashfs-root/opt/jackify/"* "${pkgdir}/opt/jackify/"

    # Install jackify-engine
    install -d "${pkgdir}/opt/jackify-engine"
    cp -r "${srcdir}/squashfs-root/opt/jackify-engine/"* "${pkgdir}/opt/jackify-engine/"

    # Fix permissions
    chmod 755 $(find "${pkgdir}/opt/" -type d)
    chmod 644 $(find "${pkgdir}/opt/" -type f)
    chmod +x $(find "${pkgdir}/opt/jackify-engine/Extractors/linux-x64/" -type f 2>/dev/null || true)
    chmod +x $(find "${pkgdir}/opt/jackify/tools/" -type f 2>/dev/null || true)

    # Install icon and desktop file
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${_appimage_name}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

    install -Dm644 "${srcdir}/squashfs-root/${_appimage_name}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

    # Install license
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Remove bundled Python libraries
    rm -rf "${pkgdir}/usr/lib"

    # Remove __pycache__ files
    find "${pkgdir}" -type d -name '__pycache__' -exec rm -r {} +
}
