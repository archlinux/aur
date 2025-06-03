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

# Unified binary package from SourceForge (no compilation required)
source=(
    "https://sourceforge.net/projects/cloudtolocalllm/files/releases/v${pkgver}/cloudtolocalllm-${pkgver}-x86_64.tar.gz/download"
)
sha256sums=(
    '89580ece63ad63076d4ce5c0760ef0c10b1616e2ca324309c5818e61ef1edd24'  # v3.0.2 unified package checksum (verified from SourceForge)
)

prepare() {
    cd "$srcdir"

    msg "Extracting unified CloudToLocalLLM binary package..."

    # The SourceForge download creates a file without the /download suffix
    local package_file="cloudtolocalllm-${pkgver}-x86_64.tar.gz"

    if [[ ! -f "$package_file" ]]; then
        error "Unified binary package not found: $package_file"
        return 1
    fi

    # Extract the package
    tar -xzf "$package_file" || {
        error "Failed to extract unified binary package"
        return 1
    }

    # Verify extraction - the package should contain the application files directly
    if [[ ! -f "cloudtolocalllm" ]]; then
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
    cd "$srcdir"

    # Install the unified CloudToLocalLLM application
    install -dm755 "$pkgdir/usr/share/cloudtolocalllm"

    # Copy all files from the extracted binary package
    # The package extracts directly to srcdir, not to a subdirectory
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
EOF
    chmod +x "$pkgdir/usr/bin/cloudtolocalllm"

    # Install desktop entry from the current directory (copied from aur-package)
    cd "$srcdir"
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
