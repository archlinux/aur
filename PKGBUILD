# Maintainer: Christopher Maltais <christopher.maltais@gmail.com>
pkgname=cloudtolocalllm
pkgver=2.1.1
pkgrel=2
pkgdesc="Multi-tenant streaming LLM management with system tray integration, platform-specific UI logic, and comprehensive Linux packaging"
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
makedepends=(
    'git'
    'cmake'
    'ninja'
    'pkg-config'
    'clang'
    'imagemagick'
    'flutter'  # Build-time dependency only - uses system Flutter installation
)
optdepends=(
    'ollama: Local LLM server for direct desktop connectivity'
    'firefox: Web browser for authentication flow'
    'chromium: Alternative web browser for authentication'
)
provides=('cloudtolocalllm')
conflicts=('cloudtolocalllm-git')
install=cloudtolocalllm.install
source=("git+https://github.com/imrightguy/CloudToLocalLLM.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/CloudToLocalLLM"

    # Verify Flutter is available and get version info
    if ! command -v flutter &> /dev/null; then
        echo "Error: Flutter not found in PATH"
        echo "Please ensure Flutter is installed via 'pacman -S flutter' or from AUR"
        exit 1
    fi

    echo "Found Flutter: $(flutter --version | head -1)"

    # Check Flutter doctor for any critical issues
    echo "Running Flutter doctor..."
    flutter doctor --android-licenses > /dev/null 2>&1 || true
    flutter doctor | grep -E "(✓|✗|!)" || true

    # Apply tray_manager deprecation fix before building
    if [[ -f "scripts/fix_tray_manager_deprecation.sh" ]]; then
        echo "Applying tray_manager deprecation fix..."
        bash scripts/fix_tray_manager_deprecation.sh apply
    else
        echo "Warning: tray_manager deprecation fix script not found"
    fi

    # Clean any previous builds
    flutter clean

    # Ensure we have the latest Flutter dependencies
    echo "Getting Flutter dependencies..."
    flutter pub get
}

build() {
    cd "$srcdir/CloudToLocalLLM"

    # Double-check Flutter availability (should be verified in prepare())
    if ! command -v flutter &> /dev/null; then
        echo "Error: Flutter not found in PATH during build"
        echo "This should have been caught in prepare() - please report this as a bug"
        exit 1
    fi

    # Configure Flutter for Linux desktop
    echo "Configuring Flutter for Linux desktop..."
    flutter config --enable-linux-desktop

    # Verify Linux desktop support is enabled
    if ! flutter config | grep -q "enable-linux-desktop: true"; then
        echo "Warning: Linux desktop support may not be properly enabled"
    fi

    # Generate monochrome system tray icons for Linux desktop integration
    mkdir -p linux/icons

    # Use monochrome tray icons if available, otherwise generate from app icon
    if [[ -f "assets/images/tray_icon_contrast_32.png" ]]; then
        echo "Using existing monochrome tray icons..."
        # Copy existing monochrome icons
        for size in 16 24 32; do
            if [[ -f "assets/images/tray_icon_contrast_${size}.png" ]]; then
                cp "assets/images/tray_icon_contrast_${size}.png" "linux/icons/cloudtolocalllm-${size}.png"
            fi
        done

        # Generate larger sizes from the 32px monochrome icon
        if command -v magick &> /dev/null; then
            for size in 48 64 128; do
                magick "assets/images/tray_icon_contrast_32.png" -resize "${size}x${size}" "linux/icons/cloudtolocalllm-${size}.png"
            done
        elif command -v convert &> /dev/null; then
            for size in 48 64 128; do
                convert "assets/images/tray_icon_contrast_32.png" -resize "${size}x${size}" "linux/icons/cloudtolocalllm-${size}.png"
            done
        else
            echo "Warning: ImageMagick not found. Using base monochrome icon for all sizes."
            for size in 48 64 128; do
                cp "assets/images/tray_icon_contrast_32.png" "linux/icons/cloudtolocalllm-${size}.png"
            done
        fi
    else
        echo "Warning: Monochrome tray icons not found. Generating from app icon."
        # Fallback to app icon if monochrome icons are not available
        if command -v magick &> /dev/null; then
            for size in 16 24 32 48 64 128; do
                magick "assets/images/app_icon.png" -resize "${size}x${size}" "linux/icons/cloudtolocalllm-${size}.png"
            done
        elif command -v convert &> /dev/null; then
            for size in 16 24 32 48 64 128; do
                convert "assets/images/app_icon.png" -resize "${size}x${size}" "linux/icons/cloudtolocalllm-${size}.png"
            done
        else
            echo "Warning: ImageMagick not found. Using original icon for all sizes."
            for size in 16 24 32 48 64 128; do
                cp "assets/images/app_icon.png" "linux/icons/cloudtolocalllm-${size}.png"
            done
        fi
    fi

    # Build the release version with verbose output for debugging
    echo "Building CloudToLocalLLM for Linux..."
    flutter build linux --release --verbose
}

package() {
    cd "$srcdir/CloudToLocalLLM"

    # Install the complete bundle to /usr/share/cloudtolocalllm
    install -dm755 "$pkgdir/usr/share/cloudtolocalllm"
    cp -r "build/linux/x64/release/bundle/"* "$pkgdir/usr/share/cloudtolocalllm/"

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

    # Install desktop entry
    install -Dm644 "aur-package/cloudtolocalllm.desktop" \
        "$pkgdir/usr/share/applications/cloudtolocalllm.desktop"

    # Install application icons in multiple sizes for better desktop integration
    # Use monochrome tray icons for better Linux compatibility
    if [[ -f "assets/images/tray_icon_contrast_32.png" ]]; then
        install -Dm644 "assets/images/tray_icon_contrast_32.png" \
            "$pkgdir/usr/share/pixmaps/cloudtolocalllm.png"
    else
        install -Dm644 "assets/images/app_icon.png" \
            "$pkgdir/usr/share/pixmaps/cloudtolocalllm.png"
    fi

    # Install hicolor icon theme icons (including 24px for system tray)
    for size in 16 24 32 48 64 128; do
        if [[ -f "linux/icons/cloudtolocalllm-${size}.png" ]]; then
            install -Dm644 "linux/icons/cloudtolocalllm-${size}.png" \
                "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/cloudtolocalllm.png"
        fi
    done

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
