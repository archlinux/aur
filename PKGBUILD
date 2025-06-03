# Maintainer: Christopher Maltais <christopher.maltais@gmail.com>
#
# Pre-built binary package - NO Flutter dependency required!
# This package downloads a pre-built CloudToLocalLLM binary, so users
# don't need to install Flutter or any build dependencies.
#
pkgname=cloudtolocalllm
pkgver=3.0.2
pkgrel=1
pkgdesc="Local LLM interface with cloud synchronization and essential tunneling functionality (Unified 126MB package)"
arch=('x86_64')
url="https://sourceforge.net/projects/cloudtolocalllm/"
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

# Unified binary package from SourceForge (no compilation required)
source=(
    "https://sourceforge.net/projects/cloudtolocalllm/files/releases/v${pkgver}/cloudtolocalllm-${pkgver}-x86_64.tar.gz/download"
)
sha256sums=(
    'aa245738361bf3b44dbd98d3d47db5b0d0aaa5a932bc0c06cf3acf66a4a0ab98'  # v3.0.2 unified package checksum (verified from SourceForge)
)

prepare() {
    cd "$srcdir"

    msg "Verifying unified CloudToLocalLLM binary package..."

    # Check if the extracted directory exists (makepkg extracts automatically)
    local extracted_dir="cloudtolocalllm-${pkgver}"
    
    if [[ ! -d "$extracted_dir" ]]; then
        error "Extracted directory not found: $extracted_dir"
        return 1
    fi

    # Verify main executable exists in the extracted directory
    if [[ ! -f "$extracted_dir/cloudtolocalllm" ]]; then
        error "Main executable not found in extracted directory"
        return 1
    fi

    msg "Unified binary package verification completed successfully"
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
    cp -r * "$pkgdir/usr/share/cloudtolocalllm/"

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
    cat > "$pkgdir/usr/bin/cloudtolocalllm" << 'WRAPPER_EOF'
#!/bin/bash
# CloudToLocalLLM v3.0.2 unified wrapper script
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
WRAPPER_EOF
    chmod +x "$pkgdir/usr/bin/cloudtolocalllm"

    # Create applications directory
    install -dm755 "$pkgdir/usr/share/applications"

    # Create desktop entry
    cat > "$pkgdir/usr/share/applications/cloudtolocalllm.desktop" << 'DESKTOP_EOF'
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
DESKTOP_EOF

    # Create a simple icon (placeholder) for desktop integration
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/48x48/apps"

    # Create a minimal placeholder icon
    echo "CloudToLocalLLM Icon Placeholder" > "$pkgdir/usr/share/pixmaps/cloudtolocalllm.png"
    cp "$pkgdir/usr/share/pixmaps/cloudtolocalllm.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/"

    # Install documentation if present in the binary package
    if [[ -f "ENHANCED_ARCHITECTURE.md" ]]; then
        install -Dm644 "ENHANCED_ARCHITECTURE.md" "$pkgdir/usr/share/doc/$pkgname/ENHANCED_ARCHITECTURE.md"
    fi
}
