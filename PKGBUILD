# Maintainer: Simon <simon@example.com>

# ── Installation prefix ──────────────────────────────────────────────
# Change this variable to set the installation directory.
#   /opt/comfyui        → standard location (recommended for AUR)
#   /var/remise/comfyui → install on a different drive
_prefix="/opt/comfyui"
# ──────────────────────────────────────────────────────────────────────

# ── GPU type ─────────────────────────────────────────────────────────
# pip command to install PyTorch in the venv.
# Adjust for your GPU:
#   ROCm (AMD RX 7000+) : torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm7.2
#   CUDA (NVIDIA)       : torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu130
#   CPU only            : torch torchvision torchaudio
_torch_pkgs="torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm7.2"
# ──────────────────────────────────────────────────────────────────────

pkgname=comfyui
pkgver=0.20.1
pkgrel=1
pkgdesc="The most powerful and modular diffusion model GUI, api and backend with a graph/nodes interface"
arch=('x86_64')
url="https://github.com/Comfy-Org/ComfyUI"
license=('GPL-3.0-only')
install=comfyui.install

depends=(
    'python'
)

makedepends=()

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Comfy-Org/ComfyUI/archive/refs/tags/v$pkgver.tar.gz"
    'comfyui.sh'
    'comfyui.service'
    'comfyui.sysusers'
    'comfyui.tmpfiles'
)

sha256sums=(
    '58b5336002b0b2350ac50f17997e8468562bfd4da61fc3361ec28993acfc0165'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

options=('!strip')

backup=("etc/comfyui/extra_model_paths.yaml")

build() {
    # Inject _prefix and _torch_pkgs into the launcher and service file
    sed -i "s|_PREFIX_|$_prefix|g" \
        "$srcdir/comfyui.sh" \
        "$srcdir/comfyui.service"

    sed -i "s|_TORCH_PKGS_|$_torch_pkgs|g" \
        "$srcdir/comfyui.sh"

    # Generate the .install script with the correct values baked in
    cat > "$srcdir/comfyui.install" <<EOF
_comfyui_setup() {
    local pip="$_prefix/venv/bin/pip"
    export PIP_CACHE_DIR="$_prefix/.pip-cache"

    # Check if PyTorch is already installed and functional
    if "$_prefix/venv/bin/python" -c "import torch" 2>/dev/null; then
        echo ":: PyTorch already installed, skipping download."
    else
        echo ":: Installing PyTorch and dependencies in the venv..."
        echo ":: This may take a while (several GB to download)."

        if ! "\$pip" install $_torch_pkgs; then
            echo ""
            echo ":: ERROR: PyTorch installation failed."
            echo ":: Pip cache preserved at $_prefix/.pip-cache for retry."
            echo ":: To retry, run:"
            echo "::   sudo PIP_CACHE_DIR=$_prefix/.pip-cache $_prefix/venv/bin/pip install $_torch_pkgs"
            echo "::   sudo PIP_CACHE_DIR=$_prefix/.pip-cache $_prefix/venv/bin/pip install -r $_prefix/requirements.txt"
            echo "::   sudo chown -R comfy:comfy $_prefix"
            return 1
        fi
    fi

    echo ":: Installing ComfyUI dependencies..."
    if ! "\$pip" install -r "$_prefix/requirements.txt"; then
        echo ""
        echo ":: ERROR: ComfyUI dependencies installation failed."
        echo ":: Pip cache preserved at $_prefix/.pip-cache for retry."
        echo ":: To retry, run:"
        echo "::   sudo PIP_CACHE_DIR=$_prefix/.pip-cache $_prefix/venv/bin/pip install -r $_prefix/requirements.txt"
        echo "::   sudo chown -R comfy:comfy $_prefix"
        return 1
    fi

    # Cleanup pip cache on success
    rm -rf "$_prefix/.pip-cache"

    echo ":: Setting ownership to comfy:comfy..."
    chown -R comfy:comfy "$_prefix"

    return 0
}

post_install() {
    echo ":: Creating system user comfy..."
    systemd-sysusers comfyui.conf

    echo ":: Creating data directories..."
    systemd-tmpfiles --create comfyui.conf 2>/dev/null || true

    if [ -d "$_prefix/venv" ] && "$_prefix/venv/bin/python" --version >/dev/null 2>&1; then
        echo ":: Existing Python venv found, reusing it."
    else
        echo ":: Creating Python virtual environment..."
        rm -rf "$_prefix/venv"
        python -m venv "$_prefix/venv"
    fi

    if _comfyui_setup; then
        echo ""
        echo ":: ComfyUI installed successfully."
        echo ":: Run 'comfyui' to start, or enable the systemd service:"
        echo "::   systemctl enable --now comfyui"
        echo "::"
        echo ":: Edit /etc/comfyui/extra_model_paths.yaml to configure model paths."
    fi
}

post_upgrade() {
    systemd-sysusers comfyui.conf

    if [ ! -d "$_prefix/venv" ]; then
        echo ":: Creating Python virtual environment..."
        python -m venv "$_prefix/venv"
    fi

    export PIP_CACHE_DIR="$_prefix/.pip-cache"

    echo ":: Upgrading PyTorch and dependencies in the venv..."

    if ! "$_prefix/venv/bin/pip" install --upgrade $_torch_pkgs; then
        echo ""
        echo ":: ERROR: PyTorch upgrade failed."
        echo ":: Pip cache preserved at $_prefix/.pip-cache for retry."
        echo ":: To retry, run:"
        echo "::   sudo PIP_CACHE_DIR=$_prefix/.pip-cache $_prefix/venv/bin/pip install --upgrade $_torch_pkgs"
        echo "::   sudo PIP_CACHE_DIR=$_prefix/.pip-cache $_prefix/venv/bin/pip install --upgrade -r $_prefix/requirements.txt"
        echo "::   sudo chown -R comfy:comfy $_prefix"
        return 1
    fi

    if ! "$_prefix/venv/bin/pip" install --upgrade -r "$_prefix/requirements.txt"; then
        echo ""
        echo ":: ERROR: ComfyUI dependencies upgrade failed."
        echo ":: Pip cache preserved at $_prefix/.pip-cache for retry."
        echo ":: To retry, run:"
        echo "::   sudo PIP_CACHE_DIR=$_prefix/.pip-cache $_prefix/venv/bin/pip install --upgrade -r $_prefix/requirements.txt"
        echo "::   sudo chown -R comfy:comfy $_prefix"
        return 1
    fi

    rm -rf "$_prefix/.pip-cache"

    echo ":: Setting ownership to comfy:comfy..."
    chown -R comfy:comfy "$_prefix"

    echo ":: ComfyUI upgraded successfully."
}

pre_remove() {
    rm -rf "$_prefix/.pip-cache"

    echo ":: The Python venv at $_prefix/venv has been preserved."
    echo ":: If you reinstall comfyui, dependencies will not be re-downloaded."
    echo ":: To free disk space, remove it manually:"
    echo "::   sudo rm -rf $_prefix"
    echo "::"
    echo ":: Data in /var/lib/comfyui/ has also been preserved."
}
EOF
}

package() {
    # Install ComfyUI source code
    install -dm755 "$pkgdir/$_prefix"
    cp -a "ComfyUI-$pkgver"/. "$pkgdir/$_prefix/"

    # Remove files not needed in production
    rm -rf "$pkgdir/$_prefix"/{.git,.github,.ci,tests,tests-unit,pytest.ini,.coderabbit.yaml,.gitattributes,.gitignore}

    # Model paths configuration in /etc (protected by pacman backup)
    install -dm755 "$pkgdir/etc/comfyui"
    cat > "$pkgdir/etc/comfyui/extra_model_paths.yaml" <<EOF
# Model paths configuration for ComfyUI.
# Edit this file to point to your models directory.
# See $_prefix/extra_model_paths.yaml.example for all options.
comfyui:
    base_path: /var/lib/comfyui/models
    is_default: true
EOF

    # Install the generated .install script
    install -Dm644 "$srcdir/comfyui.install" "$startdir/comfyui.install"

    # Install launcher
    install -Dm755 "$srcdir/comfyui.sh" "$pkgdir/usr/bin/comfyui"

    # Install systemd service
    install -Dm644 "$srcdir/comfyui.service" \
        "$pkgdir/usr/lib/systemd/system/comfyui.service"

    # Install sysusers and tmpfiles
    install -Dm644 "$srcdir/comfyui.sysusers" \
        "$pkgdir/usr/lib/sysusers.d/comfyui.conf"
    install -Dm644 "$srcdir/comfyui.tmpfiles" \
        "$pkgdir/usr/lib/tmpfiles.d/comfyui.conf"
}
