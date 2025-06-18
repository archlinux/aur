# Maintainer: Christopher Maltais <christopher.maltais@gmail.com>
#
# Pre-built binary package - NO Flutter dependency required!
# This package downloads a pre-built CloudToLocalLLM binary, so users
# don't need to install Flutter or any build dependencies.
#
pkgname=cloudtolocalllm
pkgver=3.5.16
pkgrel=1
pkgdesc="CloudToLocalLLM - Unified Flutter Architecture with Integrated System Tray and Local LLM Management (19MB package)"
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

# Download pre-built binary from GitHub repository
source=(
    "https://raw.githubusercontent.com/imrightguy/CloudToLocalLLM/master/dist/cloudtolocalllm-${pkgver}-x86_64.tar.gz"
)
sha256sums=(
    'd08ae5ccaecf7a207448d97215b5be7b6d24ef6ea6853f1422298d7b7d8120ed'
)

prepare() {
    cd "$srcdir"

    msg "Extracting unified CloudToLocalLLM binary package..."

    # Verify the unified package structure
    local package_file="cloudtolocalllm-${pkgver}-x86_64.tar.gz"

    if [[ ! -f "$package_file" ]]; then
        error "Unified binary package not found: $package_file"
        return 1
    fi

    # Extract the package (already extracted by makepkg)
    # Verify extraction - the unified package extracts to cloudtolocalllm-${pkgver}-x86_64 directory
    if [[ ! -f "cloudtolocalllm-${pkgver}-x86_64/cloudtolocalllm" ]]; then
        error "Main executable not found after extraction"
        return 1
    fi

    # Verify required libraries are present
    if [[ ! -d "cloudtolocalllm-${pkgver}-x86_64/lib" ]]; then
        error "Library directory not found in unified package"
        return 1
    fi

    # Create symlink for version compatibility (static download only)
    if [[ ! -d "cloudtolocalllm-${pkgver}" ]]; then
        ln -sf "cloudtolocalllm-${pkgver}-x86_64" "cloudtolocalllm-${pkgver}"
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

    # Copy all files from the unified package
    cp -r * "$pkgdir/usr/share/cloudtolocalllm/"

    # Make the main executable executable (unified architecture)
    chmod +x "$pkgdir/usr/share/cloudtolocalllm/cloudtolocalllm"

    # Install Flutter application executable in /usr/bin
    install -dm755 "$pkgdir/usr/bin"

    # Create system wrapper script for unified architecture
    cat > "$pkgdir/usr/bin/cloudtolocalllm" << 'EOF'
#!/bin/bash
# CloudToLocalLLM v3.4.0+ unified application system wrapper
cd /usr/share/cloudtolocalllm
exec ./cloudtolocalllm "$@"
EOF
    chmod +x "$pkgdir/usr/bin/cloudtolocalllm"

    # Install desktop entry (create directly since using static download only)
    install -dm755 "$pkgdir/usr/share/applications"
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
