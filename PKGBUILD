# Maintainer: RookDash <metzs843@gmail.com>
pkgname=hwsonnet
pkgver=1.0.0
pkgrel=1
pkgdesc="Modern hardware information and monitoring tool for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/Varionetzwerk/hwsonnet"
license=('MIT')

depends=(
    'python>=3.10'
    'python-pyqt6'
    'python-psutil'
)
optdepends=(
    'lm_sensors: hardware temperature and fan speed monitoring'
    'smartmontools: SSD/HDD/NVMe SMART health data'
    'nvidia-utils: NVIDIA GPU utilization and temperature'
    'mesa-utils: OpenGL information (glxinfo)'
    'vulkan-tools: Vulkan information (vulkaninfo)'
    'dmidecode: detailed RAM type/speed and mainboard info (requires root)'
    'pciutils: PCI device listing for GPU fallback'
    'usbutils: USB device info'
    'python-reportlab: PDF export support'
)
makedepends=('git')

source=("git+https://github.com/Varionetzwerk/hwsonnet.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    # Remove dev/test files if any
    rm -rf tests/ .github/ .git/ || true
}

package() {
    cd "$pkgname"

    # Install application files
    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -r main.py src "$pkgdir/usr/share/$pkgname/"

    # Install assets
    if [[ -d assets ]]; then
        install -dm755 "$pkgdir/usr/share/$pkgname/assets"
        cp -r assets/* "$pkgdir/usr/share/$pkgname/assets/"
    fi

    # Install icon
    install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    if [[ -f assets/icon.svg ]]; then
        install -Dm644 assets/icon.svg \
            "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    fi

    # Install desktop entry
    install -Dm644 "$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install license
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi

    # Create executable wrapper
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'WRAPPER'
#!/usr/bin/env bash
exec python3 /usr/share/hwsonnet/main.py "$@"
WRAPPER
    chmod 755 "$pkgdir/usr/bin/$pkgname"
}
