# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=fileoptimizer-bin
_pkgname=fileoptimizer

# This is only the initial version
# The pkgver() function below will always fetch the latest version
pkgver=17.10.2857

# Always fetch the latest version
pkgver() {
    curl -sL "https://sourceforge.net/projects/nikkhokkho/best_release.json" | \
    jq -r '.release.filename' | \
    sed -n 's|.*/\([0-9.]*\)/.*|\1|p'
}

pkgrel=1
pkgdesc="Lossless file size optimizer supporting multiple formats"
arch=('x86_64')
url="https://nikkhokkho.sourceforge.io/?page=FileOptimizer"
license=('AGPL-3.0-only or AGPL-3.0-or-later')
depends=('wine' 'wine-mono')
makedepends=('p7zip' 'jq' 'curl' 'icoutils' 'imagemagick')  # Added icoutils and imagemagick
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$_pkgname-$pkgver.7z.exe::https://sourceforge.net/projects/nikkhokkho/files/FileOptimizer/${pkgver}/FileOptimizerFull.7z.exe/download"
        "$_pkgname.desktop")
sha256sums=('5fe38b7848fc5dac00aa063ce67cdd956c43913420cef8851aed846182ff3dce'
            'a84498b533c5acff60d98cd413df3c63f4408fddd9eb235e6c25c58931655ff5')
options=(!strip)

prepare() {
    7z x -y "$_pkgname-$pkgver.7z.exe"
}

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

# Create empty config file if it doesn't exist
touch "$USER_CONFIG_DIR/FileOptimizer64.ini"

# Change to the config directory
cd "$USER_CONFIG_DIR" || { echo "Error: Cannot change to $USER_CONFIG_DIR" >&2; exit 1; }

# Run FileOptimizer with Wine, passing all arguments directly
wine "$USER_CONFIG_DIR/FileOptimizer64.exe" "$@"
EOF

}
