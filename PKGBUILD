# Maintainer: Christopher Maltais <christopher.maltais@gmail.com>
#
# Pre-built binary package - NO Flutter dependency required!
# This package downloads a pre-built CloudToLocalLLM binary, so users
# don't need to install Flutter or any build dependencies.
#
pkgname=cloudtolocalllm
pkgver=3.3.0
pkgrel=1
pkgdesc="CloudToLocalLLM - Multi-App Flutter Architecture with System Tray Integration and Local LLM Management"
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

# NOTE: CloudToLocalLLM v3.2.0+ uses GitHub releases for distribution
# All versions are now distributed via GitHub releases for better reliability
# AUR package downloads pre-built binaries from GitHub release assets

# Download from GitHub releases
source=(
    "cloudtolocalllm-${pkgver}-x86_64.tar.gz::https://github.com/imrightguy/CloudToLocalLLM/releases/download/v${pkgver}/cloudtolocalllm-${pkgver}-x86_64.tar.gz"
    "cloudtolocalllm-${pkgver}-x86_64.tar.gz.sha256::https://github.com/imrightguy/CloudToLocalLLM/releases/download/v${pkgver}/cloudtolocalllm-${pkgver}-x86_64.tar.gz.sha256"
)
sha256sums=(
    'SKIP'  # Will be verified using downloaded checksum file
    'SKIP'  # Checksum file verification
)

prepare() {
    cd "$srcdir"

    msg "Extracting unified CloudToLocalLLM binary package..."

    # Verify checksum using downloaded SHA256 file
    local package_file="cloudtolocalllm-${pkgver}-x86_64.tar.gz"
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
    # Verify extraction - the package extracts to cloudtolocalllm-${pkgver}-x86_64 subdirectory
    if [[ ! -d "cloudtolocalllm-${pkgver}-x86_64/bin" ]]; then
        error "Multi-app binary package structure not found after extraction"
        return 1
    fi

    # Verify main executables exist
    if [[ ! -f "cloudtolocalllm-${pkgver}-x86_64/bin/cloudtolocalllm_main" ]]; then
        error "Main executable not found after extraction"
        return 1
    fi

    msg "Unified binary package extraction completed successfully"
}

build() {
    # No build steps required - using pre-built binary
    echo "Using pre-built binary package - no compilation needed"
}

package() {
    cd "$srcdir/cloudtolocalllm-${pkgver}-x86_64"

    # Install the multi-app CloudToLocalLLM package
    install -dm755 "$pkgdir/usr/share/cloudtolocalllm"

    # Copy all files from the extracted binary package
    cp -r * "$pkgdir/usr/share/cloudtolocalllm/"

    # Install all Flutter applications to /usr/bin
    install -dm755 "$pkgdir/usr/bin"

    # Install main application (primary interface)
    if [[ -f "bin/cloudtolocalllm_main" ]]; then
        install -Dm755 "bin/cloudtolocalllm_main" "$pkgdir/usr/bin/cloudtolocalllm-main"
    fi

    # Install chat application
    if [[ -f "bin/cloudtolocalllm_chat" ]]; then
        install -Dm755 "bin/cloudtolocalllm_chat" "$pkgdir/usr/bin/cloudtolocalllm-chat"
    fi

    # Install tray daemon (core component)
    if [[ -f "bin/cloudtolocalllm_tray" ]]; then
        install -Dm755 "bin/cloudtolocalllm_tray" "$pkgdir/usr/bin/cloudtolocalllm-tray"
    fi

    # Install settings application
    if [[ -f "bin/cloudtolocalllm_settings" ]]; then
        install -Dm755 "bin/cloudtolocalllm_settings" "$pkgdir/usr/bin/cloudtolocalllm-settings"
    fi

    # Create unified wrapper script in /usr/bin
    cat > "$pkgdir/usr/bin/cloudtolocalllm" << 'EOF'
#!/bin/bash
# CloudToLocalLLM v3.3.0 multi-app wrapper script
# Manages tray daemon and launches main Flutter application

# Start tray daemon if available and not already running
if [[ -x "/usr/bin/cloudtolocalllm-tray" ]]; then
    if ! pgrep -f "cloudtolocalllm_tray" > /dev/null; then
        /usr/bin/cloudtolocalllm-tray &
        sleep 1
    fi
else
    echo "Warning: Tray daemon not found. Some functionality may be limited."
fi

# Launch main Flutter application
if [[ -x "/usr/bin/cloudtolocalllm-main" ]]; then
    exec /usr/bin/cloudtolocalllm-main "$@"
else
    echo "Error: Main application not found"
    exit 1
fi
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
