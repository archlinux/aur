# Maintainer: Simon Désaulniers <sim.desaulniers@gmail.com>

# ── Installation prefix ──────────────────────────────────────────────
# Change this variable to set the installation directory.
#   /opt/comfyui        → standard location (recommended for AUR)
#   /var/remise/comfyui → install on a different drive
_prefix="/opt/comfyui"
# ──────────────────────────────────────────────────────────────────────

pkgname=comfyui
pkgver=0.20.1
pkgrel=4
pkgdesc="The most powerful and modular diffusion model GUI, api and backend with a graph/nodes interface"
arch=('x86_64')
url="https://github.com/Comfy-Org/ComfyUI"
license=('GPL-3.0-only')
install=comfyui.install

depends=(
    'python'
    'pciutils'
)

makedepends=()

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Comfy-Org/ComfyUI/archive/refs/tags/v$pkgver.tar.gz"
    'comfyui.install'
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
    'SKIP'
)

options=('!strip')

backup=("etc/comfyui/extra_model_paths.yaml")

build() {
    # Break symlinks so sed does not modify originals in $startdir
    for f in comfyui.install comfyui.sh comfyui.service; do
        cp --remove-destination "$(readlink -f "$srcdir/$f")" "$srcdir/$f"
    done

    # Inject _prefix into source files
    sed -i "s|_PREFIX_|$_prefix|g" \
        "$srcdir/comfyui.install" \
        "$srcdir/comfyui.sh" \
        "$srcdir/comfyui.service"

    # Swap the .install for pacman, saving the template
    cp "$startdir/comfyui.install" "$srcdir/comfyui.install.tpl"
    cp "$srcdir/comfyui.install" "$startdir/comfyui.install"
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
