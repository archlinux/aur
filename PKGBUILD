# Maintainer: Christopher Maltais <christopher.maltais@gmail.com>
#
# Pre-built binary package - NO Flutter dependency required!
# This package downloads a pre-built CloudToLocalLLM binary, so users
# don't need to install Flutter or any build dependencies.
#
pkgname=cloudtolocalllm
pkgver=3.1.3
pkgrel=1
pkgdesc="CloudToLocalLLM - Enhanced Architecture with System Tray Integration and Local LLM Management (Unified 145MB package)"
arch=('x86_64')
url="https://github.com/imrightguy/CloudToLocalLLM"
license=('MIT')
depends=(
    'libayatana-appindicator'
    'gtk3'
    'glib2'
    'cairo'
    'pango'
    'gdk-pixbuf2'
    'atk'
    'at-spi2-atk'
    'dbus'
    'xdg-utils'
    'hicolor-icon-theme'
    'python'  # For tray daemon
    'wmctrl'  # For window management
)
makedepends=()
optdepends=(
    'ollama: Local LLM server for direct desktop connectivity'
    'firefox: Web browser for authentication flow'
    'chromium: Alternative web browser for authentication'
)
provides=('cloudtolocalllm')
conflicts=('cloudtolocalllm-git')
install=cloudtolocalllm.install

# NOTE: CloudToLocalLLM v3.1.3 uses new versioning strategy
# GitHub releases are only created for major versions (x.0.0)
# Minor/patch versions use build increments without GitHub releases
# For v3.1.3, using v3.0.3 binaries as base (compatible core functionality)

# Using v3.0.3 binaries with v3.1.3 metadata (versioning strategy implementation)
source=(
    "cloudtolocalllm-3.0.3-x86_64.tar.gz::https://github.com/imrightguy/CloudToLocalLLM/releases/download/v3.0.3/cloudtolocalllm-3.0.3-x86_64.tar.gz"
    "cloudtolocalllm-3.0.3-x86_64.tar.gz.sha256::https://github.com/imrightguy/CloudToLocalLLM/releases/download/v3.0.3/cloudtolocalllm-3.0.3-x86_64.tar.gz.sha256"
)
sha256sums=(
    '4fcef8f2e38a2408c83a52feffa8b9d98af221bbbaf3dd8fdda13338bd29e636'  # v3.0.3 unified package checksum
    'SKIP'  # Checksum file verification
)

prepare() {
    cd "$srcdir"

    msg "Extracting unified CloudToLocalLLM binary package..."

    # Verify checksum using downloaded SHA256 file
    local package_file="cloudtolocalllm-3.0.3-x86_64.tar.gz"
    local checksum_file="${package_file}.sha256"

    if [[ ! -f "$package_file" ]]; then
        error "Unified binary package not found: $package_file"
        return 1
    fi

    # Verify integrity using the downloaded checksum file
    if [[ -f "$checksum_file" ]]; then
        msg "Verifying package integrity..."
        if ! sha256sum -c "$checksum_file"; then
            error "Package integrity verification failed"
            return 1
        fi
        msg "Package integrity verified successfully"
    fi

    # Extract the package (already extracted by makepkg)
    # Verify extraction - the package extracts to cloudtolocalllm-3.0.3 subdirectory
    if [[ ! -f "cloudtolocalllm-3.0.3/cloudtolocalllm" ]]; then
        error "Main executable not found after extraction"
        return 1
    fi

    # Create symlink for version compatibility
    if [[ ! -d "cloudtolocalllm-${pkgver}" ]]; then
        ln -sf "cloudtolocalllm-3.0.3" "cloudtolocalllm-${pkgver}"
    fi

    msg "Unified binary package extraction completed successfully"
}

build() {
    # No build steps required - using pre-built binary
    echo "Using pre-built binary package - no compilation needed"
}

package() {
    cd "$srcdir/cloudtolocalllm-${pkgver}"

    # Install the unified CloudToLocalLLM application
    install -dm755 "$pkgdir/usr/share/cloudtolocalllm"

    # Copy all files from the extracted binary package
    # The package extracts to a subdirectory
    cp -r * "$pkgdir/usr/share/cloudtolocalllm/" 2>/dev/null || {
        # If that fails, try copying specific files
        for file in cloudtolocalllm data lib VERSION PACKAGE_INFO.txt; do
            if [[ -e "$file" ]]; then
                cp -r "$file" "$pkgdir/usr/share/cloudtolocalllm/"
            fi
        done
    }

    # Make the Flutter binary executable
    chmod +x "$pkgdir/usr/share/cloudtolocalllm/cloudtolocalllm"

    # Install essential tray daemon (core component) if present
    install -dm755 "$pkgdir/usr/bin"
    if [[ -f "cloudtolocalllm-enhanced-tray" ]]; then
        install -Dm755 "cloudtolocalllm-enhanced-tray" "$pkgdir/usr/bin/cloudtolocalllm-tray"
    fi

    # Install settings application if present
    if [[ -f "cloudtolocalllm-settings" ]]; then
        install -Dm755 "cloudtolocalllm-settings" "$pkgdir/usr/bin/cloudtolocalllm-settings"
    fi

    # Create unified wrapper script in /usr/bin
    cat > "$pkgdir/usr/bin/cloudtolocalllm" << 'EOF'
#!/bin/bash
# CloudToLocalLLM v3.0.3 unified wrapper script
# Manages essential tray daemon and Flutter application

cd /usr/share/cloudtolocalllm

# Start essential tray daemon (core tunneling functionality)
if [[ -x "/usr/bin/cloudtolocalllm-tray" ]]; then
    # Start tray daemon if not already running
    if ! pgrep -f "cloudtolocalllm-enhanced-tray" > /dev/null; then
        /usr/bin/cloudtolocalllm-tray --daemon &
        sleep 1
    fi
else
    echo "Warning: Essential tray daemon not found. Some functionality may be limited."
fi

# Launch main Flutter application
exec ./cloudtolocalllm "$@"
EOF
    chmod +x "$pkgdir/usr/bin/cloudtolocalllm"

    # Install desktop entry from the aur-package directory
    cd "$srcdir/.."
    if [[ -f "cloudtolocalllm.desktop" ]]; then
        install -Dm644 "cloudtolocalllm.desktop" \
            "$pkgdir/usr/share/applications/cloudtolocalllm.desktop"
    else
        # Create a basic desktop entry if not found
        cat > "$pkgdir/usr/share/applications/cloudtolocalllm.desktop" << 'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=CloudToLocalLLM
GenericName=Multi-tenant Streaming LLM Management
Comment=Multi-tenant streaming LLM management with system tray integration
Exec=cloudtolocalllm
Icon=cloudtolocalllm
Terminal=false
Categories=Network;
Keywords=LLM;AI;Ollama;Chat;Machine Learning;
StartupNotify=true
EOF
    fi

    # Create a simple icon (placeholder) for desktop integration
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/48x48/apps"

    # Create a simple text-based icon if no icon file is found
    if [[ ! -f "$pkgdir/usr/share/pixmaps/cloudtolocalllm.png" ]]; then
        # Create a minimal placeholder icon
        echo "CloudToLocalLLM Icon Placeholder" > "$pkgdir/usr/share/pixmaps/cloudtolocalllm.png"
        cp "$pkgdir/usr/share/pixmaps/cloudtolocalllm.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
    fi

    # Install documentation if present in the binary package
    if [[ -f "PACKAGE_INFO.txt" ]]; then
        install -Dm644 "PACKAGE_INFO.txt" "$pkgdir/usr/share/doc/$pkgname/PACKAGE_INFO.txt"
    fi
}
