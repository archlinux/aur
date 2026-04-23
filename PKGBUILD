# Maintainer: Vladislav <your@email.com>
pkgname=fluorine-manager-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A native Linux mod manager for Bethesda and other games, built on MO2"
arch=('x86_64')
url="https://github.com/SulfurNitride/Fluorine-Manager"
license=('GPL-3.0-or-later')
depends=('fuse3' 'gtk3')
provides=('fluorine-manager')
conflicts=('fluorine-manager')
options=(!strip)

# The upstream tag appends '-A' to the version number
_tag="${pkgver}-A"

source=("Fluorine-Manager-${pkgver}.zip::https://github.com/SulfurNitride/Fluorine-Manager/releases/download/${_tag}/Fluorine-Manager.zip")
sha256sums=('5d9f74114798ee70fb96d7666ba73344feae168b15c1d65bb89630f7b45cfca8')

package() {
    # The zip extracts to a 'Fluorine-Manager' directory
    cd "$srcdir"

    # Install the entire app bundle to /opt
    install -dm755 "${pkgdir}/opt/fluorine-manager"
    cp -r . "${pkgdir}/opt/fluorine-manager/"

    # Make sure the real executable and the upstream launcher are executable
    chmod 755 "${pkgdir}/opt/fluorine-manager/ModOrganizer-core"
    chmod 755 "${pkgdir}/opt/fluorine-manager/fluorine-manager"

    # Create a wrapper in /usr/bin that replicates the upstream launcher logic
    # but targets the fixed /opt install path instead of doing the sync dance.
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/fluorine-manager" << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

RUN="/opt/fluorine-manager"

# Save the original environment so game launches (Proton/Wine) can restore it.
export FLUORINE_ORIG_LD_LIBRARY_PATH="${LD_LIBRARY_PATH:-}"
export FLUORINE_ORIG_LD_PRELOAD="${LD_PRELOAD:-}"
export FLUORINE_ORIG_PATH="${PATH}"
export FLUORINE_ORIG_XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
export FLUORINE_ORIG_QT_PLUGIN_PATH="${QT_PLUGIN_PATH:-}"

# Steam injects 32-bit gameoverlayrenderer.so via LD_PRELOAD which causes
# "wrong ELF class" errors for 64-bit Qt6 apps. Clear it for our process.
unset LD_PRELOAD

export PATH="${RUN}:${PATH}"

# Use only our bundled libs — avoids conflicts with Steam scout/soldier runtime.
export LD_LIBRARY_PATH="${RUN}/lib"

export MO2_BASE_DIR="${RUN}"
export MO2_PLUGINS_DIR="${RUN}/plugins"
export MO2_DLLS_DIR="${RUN}/dlls"

unset PYTHONPATH PYTHONNOUSERSITE PYTHONHOME MO2_PYTHON_DIR

# Use bundled Qt6 plugins.
export QT_PLUGIN_PATH="${RUN}/qt6plugins"
export QT_QPA_PLATFORM_PLUGIN_PATH="${RUN}/qt6plugins/platforms"

# Raise open file descriptor limit for large modlists with FUSE VFS.
ulimit -n 65536 2>/dev/null

cd "${RUN}"
exec "${RUN}/ModOrganizer-core" "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/fluorine-manager"

    # Install icon
    install -Dm644 "icons/com.fluorine.manager.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.fluorine.manager.png"

    # Install the .desktop file that ships inside the zip,
    # patching Exec= to point to our /usr/bin wrapper.
    install -dm755 "${pkgdir}/usr/share/applications"
    sed "s|^Exec=fluorine-manager|Exec=/usr/bin/fluorine-manager|" \
        "icons/com.fluorine.manager.desktop" \
        > "${pkgdir}/usr/share/applications/com.fluorine.manager.desktop"

    # Install license if present
    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
