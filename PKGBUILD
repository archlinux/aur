# Maintainer: Christopher Maltais <christopher.maltais@gmail.com>
#
# Pre-built binary package - NO Flutter dependency required!
# This package downloads a pre-built CloudToLocalLLM binary, so users
# don't need to install Flutter or any build dependencies.
#
pkgname=cloudtolocalllm
pkgver=2.1.1
pkgrel=5
pkgdesc="Multi-tenant streaming LLM management with system tray integration (pre-built binary)"
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
source=(
    "https://github.com/imrightguy/CloudToLocalLLM/archive/v$pkgver.tar.gz"
    "cloudtolocalllm-$pkgver-x86_64.tar.gz::https://cloudtolocalllm.online/cloudtolocalllm-$pkgver-x86_64.tar.gz"
)
sha256sums=(
    'SKIP'  # Source archive checksum
    'SKIP'  # Binary package checksum
)

prepare() {
    cd "$srcdir"

    # Extract the pre-built binary package
    if [[ -f "cloudtolocalllm-$pkgver-x86_64.tar.gz" ]]; then
        echo "Extracting pre-built binary package..."
        tar -xzf "cloudtolocalllm-$pkgver-x86_64.tar.gz" || {
            echo "Error: Failed to extract binary package"
            exit 1
        }
    else
        echo "Error: Pre-built binary package not found"
        exit 1
    fi

    echo "Pre-built binary package extracted successfully"
}

build() {
    # No build steps required - using pre-built binary
    echo "Using pre-built binary package - no compilation needed"
}

package() {
    cd "$srcdir"

    # Install the pre-built binary to /usr/share/cloudtolocalllm
    install -dm755 "$pkgdir/usr/share/cloudtolocalllm"

    # Copy the pre-built application files
    if [[ -d "cloudtolocalllm-$pkgver-x86_64" ]]; then
        cp -r "cloudtolocalllm-$pkgver-x86_64/"* "$pkgdir/usr/share/cloudtolocalllm/"
    else
        echo "Error: Pre-built binary directory not found"
        exit 1
    fi

    # Make the binary executable
    chmod +x "$pkgdir/usr/share/cloudtolocalllm/cloudtolocalllm"

    # Create wrapper script in /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/cloudtolocalllm" << 'EOF'
#!/bin/bash
# CloudToLocalLLM wrapper script with system tray integration
cd /usr/share/cloudtolocalllm
exec ./cloudtolocalllm "$@"
EOF
    chmod +x "$pkgdir/usr/bin/cloudtolocalllm"

    # Install desktop entry and other files from source
    cd "$srcdir/CloudToLocalLLM-$pkgver"
    install -Dm644 "aur-package/cloudtolocalllm.desktop" \
        "$pkgdir/usr/share/applications/cloudtolocalllm.desktop"

    # Install application icons for desktop integration
    # Use the main app icon for pixmaps (fallback icon)
    install -Dm644 "assets/images/app_icon.png" \
        "$pkgdir/usr/share/pixmaps/cloudtolocalllm.png"

    # Install the main app icon for hicolor theme (most common size)
    install -Dm644 "assets/images/app_icon.png" \
        "$pkgdir/usr/share/icons/hicolor/48x48/apps/cloudtolocalllm.png"

    # Install documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    if [[ -f "CHANGELOG.md" ]]; then
        install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    fi

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install man page if it exists
    if [[ -f "docs/cloudtolocalllm.1" ]]; then
        install -Dm644 "docs/cloudtolocalllm.1" "$pkgdir/usr/share/man/man1/cloudtolocalllm.1"
        gzip -9 "$pkgdir/usr/share/man/man1/cloudtolocalllm.1"
    fi
}
