# Maintainer: Mufaro <contact@mufaro.dev>
# Refactored by: Voxis Forge <ai-mentor@internal>

pkgname=antigravity-bin-hardened
pkgver=1.11.2
_buildid=6251250307170304
pkgrel=11
pkgdesc="Google Antigravity Agentic Development Platform (Pre-built Binary). Hardened version with strict permissions and verified dependencies."
arch=('x86_64')
url="https://antigravity.google/"
license=('Proprietary')
install=$pkgname.install
depends=(
    'alsa-lib'
    'at-spi2-atk'
    'atk'
    'cairo'
    'cups'
    'curl'
    'dbus'
    'expat'
    'glib2'
    'gtk3'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'nss'
    'pango'
    'xdg-utils'
    'ca-certificates'
)
optdepends=(
    'apparmor: Mandatory Access Control (MAC) security framework'
    'firejail: Application sandboxing for enhanced isolation'
    'bubblewrap: Lightweight application sandboxing'
)
# !strip: Prevent stripping of signed binaries (breaks Electron)
# !emptydirs: Keep empty directories if they are needed
options=('!strip' '!emptydirs')
source=(
    "https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/${pkgver}-${_buildid}/linux-x64/Antigravity.tar.gz"
    "antigravity.desktop"
    "antigravity-url-handler.desktop"
    "antigravity.apparmor"
)
sha256sums=('d1b1115ae76c275c376ea660e1e4d2dc20eb3e72d6a206b096505b944a5f64b7'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    # 1. Preparation
    # --------------------------------------------------------------------------
    msg2 "Locating extracted directory..."
    local _extracted_dir
    _extracted_dir=$(find "$srcdir" -maxdepth 1 -type d -name "Antigravity*" | head -n 1)

    if [ -z "$_extracted_dir" ]; then
        error "Could not find extracted directory 'Antigravity*'."
        return 1
    fi

    # 2. Installation to /opt
    # --------------------------------------------------------------------------
    msg2 "Installing to /opt/antigravity..."
    install -d "$pkgdir/opt/antigravity"
    cp -r "$_extracted_dir"/* "$pkgdir/opt/antigravity/"

    # 3. Hardening Protocol (Voxis Standard)
    # --------------------------------------------------------------------------
    msg2 "Applying hardening protocols..."

    # A. Base Permissions: 
    # Directories -> 755 (rwxr-xr-x)
    # Files       -> 644 (rw-r--r--)
    find "$pkgdir/opt/antigravity" -type d -exec chmod 755 {} +
    find "$pkgdir/opt/antigravity" -type f -exec chmod 644 {} +

    # B. Executables:
    # Main binary -> 755
    if [ -f "$pkgdir/opt/antigravity/Antigravity" ]; then
        chmod 755 "$pkgdir/opt/antigravity/Antigravity"
    elif [ -f "$pkgdir/opt/antigravity/antigravity" ]; then
        chmod 755 "$pkgdir/opt/antigravity/antigravity"
    fi

    # C. Chrome Sandbox (Critical for Electron Security):
    # Must be 4755 (SUID root) if it exists
    if [ -f "$pkgdir/opt/antigravity/chrome-sandbox" ]; then
        msg2 "Securing chrome-sandbox..."
        chmod 4755 "$pkgdir/opt/antigravity/chrome-sandbox"
    fi

    # 4. System Integration
    # --------------------------------------------------------------------------
    msg2 "Creating system links and assets..."

    # Binary Symlink
    install -d "$pkgdir/usr/bin"
    if [ -f "$pkgdir/opt/antigravity/Antigravity" ]; then
        ln -s "/opt/antigravity/Antigravity" "$pkgdir/usr/bin/antigravity"
    elif [ -f "$pkgdir/opt/antigravity/antigravity" ]; then
        ln -s "/opt/antigravity/antigravity" "$pkgdir/usr/bin/antigravity"
    fi

    # Icon
    install -d "$pkgdir/usr/share/pixmaps"
    local _icon_path="$pkgdir/opt/antigravity/resources/app/resources/linux/code.png"
    
    if [ -f "$_icon_path" ]; then
        ln -s "/opt/antigravity/resources/app/resources/linux/code.png" "$pkgdir/usr/share/pixmaps/antigravity.png"
    else
        # Fallback search
        local _found_icon
        _found_icon=$(find "$pkgdir/opt/antigravity" -name "*.png" | head -n 1)
        if [ -n "$_found_icon" ]; then
            local _rel_path=${_found_icon#$pkgdir}
            ln -s "$_rel_path" "$pkgdir/usr/share/pixmaps/antigravity.png"
        fi
    fi

    # Desktop Integration
    install -Dm644 antigravity.desktop "$pkgdir/usr/share/applications/antigravity.desktop"
    install -Dm644 antigravity-url-handler.desktop "$pkgdir/usr/share/applications/antigravity-url-handler.desktop"

    # AppArmor Profile (Optional Security Enhancement)
    install -Dm644 antigravity.apparmor "$pkgdir/usr/share/apparmor/antigravity.apparmor"

    # License
    if [ -f "$srcdir/LICENSE" ]; then
        install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
