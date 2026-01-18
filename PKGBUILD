# Maintainer: Pierre <votre_email@exemple.com>
pkgname=gamevox-git
pkgver=1.0.0
pkgrel=4
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

# Define user data directory
USER_DATA_DIR="\$HOME/.local/share/gamevox"
OPT_DIR="/opt/gamevox"

mkdir -p "\$USER_DATA_DIR"
cd "\$USER_DATA_DIR"

# Check if venv exists in user dir
if [ ! -d "venv" ]; then
    echo "First run setup: Creating virtual environment in \$USER_DATA_DIR..."
    python -m venv venv
    source venv/bin/activate
    # Install deps from the system requirements file
    pip install -r "\$OPT_DIR/requirements.txt"
else
    source venv/bin/activate
fi

# Check for Piper in user dir
if [ ! -d "piper_tts" ]; then
    echo "Piper TTS not found. Installing in \$USER_DATA_DIR..."
    mkdir -p piper_tts && cd piper_tts
    wget -q --show-progress https://github.com/rhasspy/piper/releases/download/2023.11.14-2/piper_linux_x86_64.tar.gz
    tar -xf piper_linux_x86_64.tar.gz
    rm piper_linux_x86_64.tar.gz
    wget -q --show-progress -O fr_FR-upmc-medium.onnx https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/upmc/medium/fr_FR-upmc-medium.onnx
    wget -q --show-progress -O fr_FR-upmc-medium.onnx.json https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/upmc/medium/fr_FR-upmc-medium.onnx.json
    cd ..
fi

# Run the app
# We pass the user data dir as an env var or argument if needed, 
# OR we simply run from the user dir so relative paths (like profiles.json) work there.
# But gamevox.py is in /opt/gamevox. We need to run it.
# Important: gamevox.py looks for piper relative to __file__. We might need to symlink or adjust env.

# FIX: We link profiles.json to user dir if it doesn't exist to persist configs
if [ ! -f "profiles.json" ]; then
    echo "{}" > profiles.json
fi

# Create a symlink to piper_tts in the app dir? No, permission denied.
# We must run python script but tell it where to find piper.
# Since we cannot easily modify code arguments without changing code, 
# let's assume we run FROM the user dir, but execute the script at OPT_DIR.
# AND we need to patch gamevox.py to look in current dir OR env var for piper.

# For now, let's copy the main script to user dir? No, updates won't apply.
# Better: We set an environment variable GAMEVOX_DATA_DIR
export GAMEVOX_DATA_DIR="\$USER_DATA_DIR"

exec python "\$OPT_DIR/gamevox.py" "\$@"
EOF

    chmod +x "$pkgdir/usr/bin/gamevox"
    
    # Desktop entry
    install -d "$pkgdir/usr/share/applications"
    install -Dm644 gamevox.desktop "$pkgdir/usr/share/applications/gamevox.desktop"
}
