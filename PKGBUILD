# Maintainer: Simon <simon@example.com>
# Contributor: Généré pour usage personnel et l'AUR

# ── Emplacement d'installation ────────────────────────────────────────
# Modifier cette variable pour changer le répertoire d'installation.
#   /opt/comfyui        → valeur standard pour l'AUR
#   /var/remise/comfyui → pour installer sur un autre disque
_prefix="/var/remise/comfyui"
# ──────────────────────────────────────────────────────────────────────

# ── Type de GPU ───────────────────────────────────────────────────────
# Commande pip pour installer PyTorch dans le venv.
# Adapter selon votre carte graphique :
#   ROCm (AMD RX 7000+) : torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm7.2
#   CUDA (NVIDIA)       : torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu130
#   CPU seulement       : torch torchvision torchaudio
_torch_pkgs="torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm7.2"
# ──────────────────────────────────────────────────────────────────────

pkgname=comfyui
pkgver=0.20.1
pkgrel=1
pkgdesc="Moteur visuel modulaire pour la génération d'images par diffusion"
arch=('x86_64')
url="https://github.com/Comfy-Org/ComfyUI"
license=('GPL-3.0-only')

depends=(
    'python'
)

makedepends=(
    'python-virtualenv'
)

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

backup=("${_prefix#/}/extra_model_paths.yaml")

build() {
    cd "ComfyUI-$pkgver"

    # Créer un venv isolé (toutes les dépendances dans le venv)
    python -m venv "$srcdir/venv"

    # Installer PyTorch selon le type de GPU configuré
    "$srcdir/venv/bin/pip" install $_torch_pkgs

    # Installer les dépendances de ComfyUI
    "$srcdir/venv/bin/pip" install -r requirements.txt
}

package() {
    # Installer le code source de ComfyUI
    install -dm755 "$pkgdir/$_prefix"
    cp -a "ComfyUI-$pkgver"/. "$pkgdir/$_prefix/"

    # Installer le venv
    cp -a "$srcdir/venv" "$pkgdir/$_prefix/venv"

    # Corriger les chemins absolus dans le venv pour pointer vers $_prefix
    # au lieu de $srcdir
    _fix_venv_paths "$pkgdir/$_prefix/venv"

    # Créer le fichier de configuration par défaut des modèles
    cat > "$pkgdir/$_prefix/extra_model_paths.yaml" <<'EOF'
# Configuration des chemins de modèles pour ComfyUI
# Modifier ce fichier pour pointer vers vos modèles.
comfyui:
    base_path: /var/lib/comfyui/models
    is_default: true
EOF

    # Supprimer les fichiers inutiles en production
    rm -rf "$pkgdir/$_prefix"/{.git,.github,.ci,tests,tests-unit,pytest.ini,.coderabbit.yaml,.gitattributes,.gitignore}

    # Installer le lanceur
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/comfyui" < <(
        sed "s|_PREFIX_|$_prefix|g" "$srcdir/comfyui.sh"
    )

    # Installer le service systemd
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/comfyui.service" < <(
        sed "s|_PREFIX_|$_prefix|g" "$srcdir/comfyui.service"
    )

    # Installer sysusers et tmpfiles
    install -Dm644 "$srcdir/comfyui.sysusers" \
        "$pkgdir/usr/lib/sysusers.d/comfyui.conf"
    install -Dm644 "$srcdir/comfyui.tmpfiles" \
        "$pkgdir/usr/lib/tmpfiles.d/comfyui.conf"
}

_fix_venv_paths() {
    local venv_dir="$1"
    local old_prefix="$srcdir/venv"
    local new_prefix="$_prefix/venv"

    # Corriger pyvenv.cfg
    sed -i "s|$srcdir/venv|$_prefix/venv|g" "$venv_dir/pyvenv.cfg"

    # Corriger les shebangs des scripts
    find "$venv_dir/bin" -type f -exec \
        sed -i "s|$srcdir/venv|$_prefix/venv|g" {} +

    # Corriger les chemins dans les fichiers .pth et .dist-info
    find "$venv_dir" -name '*.pth' -o -name 'RECORD' -o -name 'direct_url.json' | \
        xargs -r sed -i "s|$srcdir|${_prefix%/comfyui}|g" 2>/dev/null || true
}
