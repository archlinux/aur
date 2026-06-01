# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=fileoptimizer-bin
_pkgname=fileoptimizer

# manual-hint: FileOptimizer ships only on SourceForge, whose files listing
# and best_release.json are now Cloudflare-gated (curl gets a challenge page).
# Every downstream packager (Scoop, Chocolatey) scrapes that same listing, so
# none exposes a Cloudflare-free authoritative feed. If latestver() ever emits
# a bare MAJOR.MINOR (chocolatey mirror lagging upstream), read the build
# number from https://sourceforge.net/projects/nikkhokkho/files/FileOptimizer/
# in a browser (curl is challenged) and set pkgver to MAJOR.MINOR.BUILD.
pkgver=17.10.2857

# No Cloudflare-free authoritative source exists, so combine two:
#   * Chocolatey's community feed re-publishes the full MAJOR.MINOR.BUILD over a
#     non-Cloudflare API — the only machine-readable source for the build number.
#   * The upstream FlatPress product page (not Cloudflare-gated) is authoritative
#     for the newest MAJOR.MINOR.
# When chocolatey's minor matches upstream's, the mirror is current → return the
# full version. When upstream is strictly newer, chocolatey is stale/frozen →
# return the bare MAJOR.MINOR so check-updates reports asset-missing (loud) rather
# than silently trusting a frozen mirror. See manual-hint for the build number.
latestver() {
    local choco upstream_mm choco_mm newer_mm
    choco=$(curl -fsSL "https://community.chocolatey.org/api/v2/FindPackagesById()?id='fileoptimizer'" \
        | grep -oE '<d:Version>[0-9]+\.[0-9]+\.[0-9]+</d:Version>' \
        | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | sort -V | tail -1)
    upstream_mm=$(curl -fsSL "https://nikkhokkho.sourceforge.io/?page=FileOptimizer" \
        | grep -aoE '[0-9]+\.[0-9]+ - 20[0-9]{2}/[0-9]{2}/[0-9]{2}' \
        | head -1 | grep -oE '^[0-9]+\.[0-9]+')
    if [ -z "$choco" ]; then
        [ -n "$upstream_mm" ] && printf '%s\n' "$upstream_mm"
        return
    fi
    choco_mm=${choco%.*}
    newer_mm=$(printf '%s\n%s\n' "$choco_mm" "$upstream_mm" | sort -V | tail -1)
    if [ -n "$upstream_mm" ] && [ "$newer_mm" != "$choco_mm" ]; then
        printf '%s\n' "$upstream_mm"
    else
        printf '%s\n' "$choco"
    fi
}

pkgrel=5
pkgdesc="Lossless file size optimizer supporting multiple formats"
arch=('x86_64')
url="https://nikkhokkho.sourceforge.io/?page=FileOptimizer"
license=('AGPL-3.0-only OR AGPL-3.0-or-later')
depends=('wine' 'wine-mono' 'wine-gecko')
makedepends=('icoutils' 'imagemagick')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# downloads.sourceforge.net is now Cloudflare-gated; the master mirror serves
# the file directly. ?viasf=1 marks the request as SourceForge-originated.
source=("$_pkgname-$pkgver.7z.exe::https://master.dl.sourceforge.net/project/nikkhokkho/FileOptimizer/${pkgver}/FileOptimizerFull.7z.exe?viasf=1"
        "$_pkgname.desktop")
sha256sums=('5fe38b7848fc5dac00aa063ce67cdd956c43913420cef8851aed846182ff3dce'
            'a84498b533c5acff60d98cd413df3c63f4408fddd9eb235e6c25c58931655ff5')
options=(!strip !debug)

package() {
    install -dm755 "$pkgdir/opt/$_pkgname"

    install -Dm755 FileOptimizer64.exe "$pkgdir/opt/$_pkgname/FileOptimizer64.exe"
    install -Dm755 WebView2Loader.dll "$pkgdir/opt/$_pkgname/WebView2Loader.dll"

    cp -r Plugins64 "$pkgdir/opt/$_pkgname/"

    install -Dm644 FileOptimizer.chm "$pkgdir/opt/$_pkgname/FileOptimizer.chm"

    install -Dm644 *.po -t "$pkgdir/opt/$_pkgname/"

    # Extract icon from executable
    wrestool -x -t 14 FileOptimizer64.exe -o FileOptimizer.ico
    
    # Convert ico to png files
    magick FileOptimizer.ico fileoptimizer.png
    
    # The above command creates files like fileoptimizer-0.png, fileoptimizer-1.png, etc.
    # We need to identify which file corresponds to which size

    # Create a directory to store the icon files
    mkdir -p icons
    
    # Move the generated PNG files to the icons directory
    mv fileoptimizer-*.png icons/
    
    # Install icons to appropriate directories based on their size
    for icon in icons/fileoptimizer-*.png; do
        size=$(identify -format "%wx%h" "$icon" | cut -d 'x' -f 1)
        install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png"
    done
    
    # Set the desktop file to use the installed icon
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

    # Create the wrapper script
    install -Dm755 /dev/null "$pkgdir/usr/bin/$_pkgname"
    cat << 'EOF' > "$pkgdir/usr/bin/$_pkgname"
#!/bin/bash
set -e

export WINEARCH=win64
export WINEDEBUG=-all

USER_CONFIG_DIR="$HOME/.config/fileoptimizer"
INSTALL_DIR="/opt/fileoptimizer"

# Create user config directory if it doesn't exist
mkdir -p "$USER_CONFIG_DIR"

# Create symlinks for program files if they don't exist
# This allows the app to be run from the user's config directory
# while the actual files remain in the system directory
create_symlink() {
    local source="$1"
    local target="$2"
    if [ ! -e "$source" ]; then
        echo "Warning: Source file $source does not exist" >&2
        return 1
    fi
    if [ ! -e "$target" ]; then
        ln -sf "$source" "$target"
    fi
}

# Check if installation directory exists
if [ ! -d "$INSTALL_DIR" ]; then
    echo "Error: Installation directory $INSTALL_DIR not found" >&2
    exit 1
fi

# Create necessary symlinks
create_symlink "$INSTALL_DIR/FileOptimizer64.exe" "$USER_CONFIG_DIR/FileOptimizer64.exe" || exit 1
create_symlink "$INSTALL_DIR/WebView2Loader.dll" "$USER_CONFIG_DIR/WebView2Loader.dll" || exit 1
create_symlink "$INSTALL_DIR/Plugins64" "$USER_CONFIG_DIR/Plugins64" || exit 1
create_symlink "$INSTALL_DIR/FileOptimizer.chm" "$USER_CONFIG_DIR/FileOptimizer.chm" || exit 1

# Create default config if it doesn't exist (disable auto-updater)
if [ ! -f "$USER_CONFIG_DIR/FileOptimizer64.ini" ]; then
    printf '[Options]\nCheckForUpdates=0\n' > "$USER_CONFIG_DIR/FileOptimizer64.ini"
fi

# Change to the config directory
cd "$USER_CONFIG_DIR" || { echo "Error: Cannot change to $USER_CONFIG_DIR" >&2; exit 1; }

# Run FileOptimizer with Wine, passing all arguments directly
wine "$USER_CONFIG_DIR/FileOptimizer64.exe" "$@"
EOF

}
