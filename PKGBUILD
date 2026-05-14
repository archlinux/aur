# Maintainer: Hikari <kauaojulio10@gmail.com>
pkgname=mechclick
pkgver=1.0.0
pkgrel=1
pkgdesc="Mechanical keyboard sound simulator for Wayland (read-only evdev + PipeWire)"
arch=('any')
url="https://github.com/HikariLucky/mechclick"
license=('MIT')
depends=('python>=3.10' 'python-evdev' 'python-numpy' 'python-sounddevice' 'python-soundfile' 'pipewire')
makedepends=('git' 'python-setuptools' 'python-wheel')
optdepends=('wpctl: PipeWire volume control'
            'pactl: PulseAudio control'
            'fish: shell integration for PATH')
source=("git+$url.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    # Remove build artifacts if present
    rm -rf dist build *.egg-info 2>/dev/null || true
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    
    # Install Python package wheel
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install sound profiles
    if [ -d "sounds" ]; then
        install -dm755 "$pkgdir/usr/local/share/mechclick/sounds"
        cp -r sounds/* "$pkgdir/usr/local/share/mechclick/sounds/"
    fi
    
    # Install documentation
    if [ -f "README.md" ]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/mechclick/README.md"
    fi
    if [ -f "ARCHITECTURE.md" ]; then
        install -Dm644 ARCHITECTURE.md "$pkgdir/usr/share/doc/mechclick/ARCHITECTURE.md"
    fi
    if [ -f "docs/ARCHITECTURE.md" ]; then
        install -Dm644 docs/ARCHITECTURE.md "$pkgdir/usr/share/doc/mechclick/ARCHITECTURE.md"
    fi
    
    # Install desktop entry if present
    if [ -f "packaging/klickity.desktop" ]; then
        install -Dm644 packaging/klickity.desktop "$pkgdir/usr/share/applications/klickity.desktop"
    fi
}
