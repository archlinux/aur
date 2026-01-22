# Maintainer: Josh Dye <jpenguin@duck.com>
pkgname=pycheese
pkgver=1.0.0
pkgrel=1
pkgdesc="A PyQt6 Photo Booth with AI Background replacement (venv isolated)"
arch=('x86_64')
url="https://github.com/tux-peng/PyCheese"
license=('MIT')
depends=('python')
makedepends=('python' 'git') # Added git for downloading source
options=('!strip' '!debug')
# Source directly from the v1.0 tag
source=("git+https://github.com/tux-peng/PyCheese.git#tag=v1.0")
sha256sums=('SKIP')

prepare() {
    # 1. Create the launcher script dynamically
    cat > "$srcdir/pycheese-launcher.sh" <<EOF
#!/bin/bash
exec /opt/pycheese/venv/bin/python /opt/pycheese/pycheese.py "\$@"
EOF

    # 2. Create the Desktop Entry dynamically
    cat > "$srcdir/pycheese.desktop" <<EOF
[Desktop Entry]
Version=1.0
Name=PyCheese
Comment=PyQt6 Photo Booth with Filters
Exec=/usr/bin/pycheese
Icon=camera-photo
Terminal=false
Type=Application
Categories=AudioVideo;Video;Recorder;
EOF
}

package() {
    # Define install paths
    local _opt_dir="$pkgdir/opt/$pkgname"
    local _repo_dir="$srcdir/PyCheese" # Directory where git clones the repo

    # 1. Prepare directory structure
    install -d "$_opt_dir"

    # COPY from the cloned git directory
    if [ -f "$_repo_dir/pycheese.py" ]; then
        install -Dm644 "$_repo_dir/pycheese.py" "$_opt_dir/pycheese.py"
    else
        echo "Error: pycheese.py not found in the repository root!"
        exit 1
    fi

    # 2. Create Virtual Environment inside /opt/pycheese
    msg2 "Creating virtual environment..."
    python -m venv "$_opt_dir/venv"

    # 3. Install dependencies via pip into the package directory
    msg2 "Installing dependencies (opencv, pyqt6, mediapipe)..."
    "$_opt_dir/venv/bin/pip" install \
        --no-cache-dir \
        --ignore-installed \
        "PyQt6" \
        "opencv-python" \
        "mediapipe" \
        "numpy<2"

    # 4. Clean up venv
    find "$_opt_dir" -name "__pycache__" -exec rm -rf {} +

    # 5. Fix permissions
    chmod -R u=rwX,go=rX "$_opt_dir"

    # 6. Install Launcher and Desktop File
    install -Dm755 "pycheese-launcher.sh" "$pkgdir/usr/bin/pycheese"
    install -Dm644 "pycheese.desktop" "$pkgdir/usr/share/applications/pycheese.desktop"
}
