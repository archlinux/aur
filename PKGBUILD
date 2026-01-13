# Maintainer: Pierre <votre_email@exemple.com>
pkgname=gamevox-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A smart screen reader for Linux gaming (Wayland/Hyprland) with local neural TTS."
arch=('any')
url="https://github.com/Djkawada/GameReader"
license=('MIT')
depends=('python' 'tesseract' 'tesseract-data-fra' 'grim' 'slurp' 'libpulse' 'libevdev')
makedepends=('git' 'python-setuptools')
optdepends=('piper-tts: for local neural voice (recommended, installed manually or via script)')
provides=('gamevox')
conflicts=('gamevox')
source=("git+https://github.com/Djkawada/GameReader.git")
md5sums=('SKIP')

pkgver() {
    cd "GameReader"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "GameReader"
    
    # Install application files to /opt/gamevox
    install -d "$pkgdir/opt/gamevox"
    cp -r * "$pkgdir/opt/gamevox/"
    
    # Remove venv and temp files if copied
    rm -rf "$pkgdir/opt/gamevox/venv"
    rm -rf "$pkgdir/opt/gamevox/__pycache__"
    rm -rf "$pkgdir/opt/gamevox/piper_tts" # Piper is too big for the package, user installs it
    
    # Create a startup script in /usr/bin
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/gamevox" <<EOF
#!/bin/bash
cd /opt/gamevox
# Check if venv exists, if not warn user or use system python
if [ ! -d "venv" ]; then
    echo "First run setup: Creating virtual environment..."
    python -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
else
    source venv/bin/activate
fi

# Check for Piper
if [ ! -d "piper_tts" ]; then
    echo "Piper TTS not found. Installing..."
    mkdir -p piper_tts && cd piper_tts
    wget -q --show-progress https://github.com/rhasspy/piper/releases/download/2023.11.14-2/piper_linux_x86_64.tar.gz
    tar -xf piper_linux_x86_64.tar.gz
    rm piper_linux_x86_64.tar.gz
    wget -q --show-progress -O fr_FR-upmc-medium.onnx https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/upmc/medium/fr_FR-upmc-medium.onnx
    wget -q --show-progress -O fr_FR-upmc-medium.onnx.json https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/upmc/medium/fr_FR-upmc-medium.onnx.json
    cd ..
fi

# Run with sudo if needed for controller access, or ask user to set udev rules
# For simplicity in this package, we run directly, assuming user handles permissions or sudo
exec python gamevox.py "\$@"
EOF

    chmod +x "$pkgdir/usr/bin/gamevox"
    
    # Desktop entry
    install -d "$pkgdir/usr/share/applications"
    install -Dm644 gamevox.desktop "$pkgdir/usr/share/applications/gamevox.desktop"
}
