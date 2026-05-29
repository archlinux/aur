# Maintainer: Simon Désaulniers <sim.desaulniers@gmail.com>

# ── Installation prefix ──────────────────────────────────────────────
# Change this variable to set the installation directory.
#   /opt/comfyui        → standard location (recommended for AUR)
#   /var/remise/comfyui → install on a different drive
_prefix="${_prefix:-/opt/comfyui}"
# ──────────────────────────────────────────────────────────────────────

pkgname=comfyui
pkgver=0.21.1
pkgrel=6
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
    'comfyui.install.in'
    'comfyui.sh'
    'comfyui.service'
    'comfyui.sysusers'
    'comfyui.tmpfiles'
)

sha256sums=(
    '36a41e3ec4609e1db22f9173667b041f62180fb3d1e4bf2eee554d4f51ab1e2e'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

options=('!strip')

backup=(
    "etc/comfyui/extra_model_paths.yaml"
    "etc/comfyui/comfyui.conf"
)

build() {
    # Break symlinks so sed does not modify originals in $startdir
    for f in comfyui.sh comfyui.service; do
        cp --remove-destination "$(readlink -f "$srcdir/$f")" "$srcdir/$f"
    done

    # Inject _prefix into runtime source files
    sed -i "s|_PREFIX_|$_prefix|g" \
        "$srcdir/comfyui.sh" \
        "$srcdir/comfyui.service"

    # Generate install scriptlet from template (never modify the .in)
    sed "s|_PREFIX_|$_prefix|g" \
        "$srcdir/comfyui.install.in" > "$startdir/comfyui.install"
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
# Extra model paths for ComfyUI.
# By default, models are stored in the install prefix
# (e.g. $_prefix/models/).
#
# Uncomment and edit below to add additional search paths.
# See $_prefix/extra_model_paths.yaml.example for all options.
#

# Empty placeholder to prevent errors if no paths are added. Remove this line when adding paths.
{}

#comfyui:
#    base_path: /path/to/my/models/
#    is_default: true
#    checkpoints: models/checkpoints/
#    configs: models/configs/
#    loras: models/loras/
#    vae: models/vae/
#    text_encoders: |
#         models/text_encoders/
#         models/clip/
#    diffusion_models: |
#                 models/diffusion_models/
#                 models/unet/
#    clip_vision: models/clip_vision/
#    style_models: models/style_models/
#    embeddings: models/embeddings/
#    diffusers: models/diffusers/
#    vae_approx: models/vae_approx/
#    controlnet: |
#             models/controlnet/
#             models/t2i_adapter/
#    gligen: models/gligen/
#    upscale_models: models/upscale_models/
#    latent_upscale_models: models/latent_upscale_models/
#    hypernetworks: models/hypernetworks/
#    photomaker: models/photomaker/
#    classifiers: models/classifiers/
#    model_patches: models/model_patches/
#    audio_encoders: models/audio_encoders/
#    background_removal: models/background_removal/
#    frame_interpolation: models/frame_interpolation/
#    optical_flow: models/optical_flow/
EOF

    # Environment configuration (protected by pacman backup)
    cat > "$pkgdir/etc/comfyui/comfyui.conf" <<EOF
# ComfyUI environment configuration.
# This file is sourced by the systemd service.
# Uncomment and edit to override default paths.

# Output directory (default: /var/lib/comfyui/output)
#COMFYUI_OUTPUT_DIR=/var/lib/comfyui/output

# Input directory (default: /var/lib/comfyui/input)
#COMFYUI_INPUT_DIR=/var/lib/comfyui/input
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
