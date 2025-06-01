# Maintainer: Christopher Maltais <christopher.maltais@gmail.com>
pkgname=cloudtolocalllm
pkgver=2.0.0.r97202bc
pkgrel=1
pkgdesc="CloudToLocalLLM - Local LLM Management with Monochrome System Tray Icons and Enhanced Linux Desktop Integration"
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
)
makedepends=(
    'git'
    'cmake'
    'ninja'
    'pkg-config'
    'clang'
    'imagemagick'
)
optdepends=(
    'ollama: Local LLM server for direct connectivity'
)
provides=('cloudtolocalllm')
conflicts=('cloudtolocalllm-git')
source=("git+https://github.com/imrightguy/CloudToLocalLLM.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/CloudToLocalLLM"
    printf "2.0.0.r%s" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/CloudToLocalLLM"
    
    # Ensure we have the latest Flutter dependencies
    flutter pub get
    
    # Clean any previous builds
    flutter clean
}

build() {
    cd "$srcdir/CloudToLocalLLM"

    # Check if Flutter is available in PATH
    if ! command -v flutter &> /dev/null; then
        echo "Flutter not found in PATH. Please install Flutter manually."
        echo "You can install Flutter from: https://docs.flutter.dev/get-started/install/linux"
        exit 1
    fi

    # Generate icon sizes for Linux desktop integration
    mkdir -p linux/icons
    if command -v magick &> /dev/null; then
        for size in 16 32 48 64 128; do
            magick "assets/images/app_icon.png" -resize "${size}x${size}" "linux/icons/cloudtolocalllm-${size}.png"
        done
    elif command -v convert &> /dev/null; then
        for size in 16 32 48 64 128; do
            convert "assets/images/app_icon.png" -resize "${size}x${size}" "linux/icons/cloudtolocalllm-${size}.png"
        done
    else
        echo "Warning: ImageMagick not found. Using original icon for all sizes."
        for size in 16 32 48 64 128; do
            cp "assets/images/app_icon.png" "linux/icons/cloudtolocalllm-${size}.png"
        done
    fi

    # Configure Flutter for Linux desktop
    flutter config --enable-linux-desktop

    # Build the release version
    flutter build linux --release
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
# CloudToLocalLLM wrapper script
cd /usr/share/cloudtolocalllm
exec ./cloudtolocalllm "$@"
EOF
    chmod +x "$pkgdir/usr/bin/cloudtolocalllm"

    # Install desktop entry
    install -Dm644 "aur-package/cloudtolocalllm.desktop" \
        "$pkgdir/usr/share/applications/cloudtolocalllm.desktop"

    # Install application icons in multiple sizes for better desktop integration
    install -Dm644 "assets/images/app_icon.png" \
        "$pkgdir/usr/share/pixmaps/cloudtolocalllm.png"

    # Install hicolor icon theme icons
    for size in 16 32 48 64 128; do
        install -Dm644 "linux/icons/cloudtolocalllm-${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/cloudtolocalllm.png"
    done

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
