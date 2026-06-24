# Maintainer: KasishStar <kasishgadadhasu9950@gmail.com>
pkgname=hyprcod
pkgver=0.1.0
pkgrel=1
pkgdesc="TUI Configuration Customizer for Hyprland — edit .conf or .lua with ease"
arch=('any')
url="https://github.com/KasishStar/hyprcod"
license=('MIT')
depends=('python' 'python-textual')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KasishStar/hyprcod/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"
    local dir=$(find . -maxdepth 2 -name "pyproject.toml" -exec dirname {} \; | head -1)
    [ -z "$dir" ] && { echo "ERROR: hyprcod package not found"; exit 1; }
    cd "$dir"

    # Install via pip directly to site-packages
    python -m build --wheel --outdir "${srcdir}/dist"
    python -m installer --prefix="${pkgdir}/usr" "${srcdir}/dist/"*.whl

    # Install completions
    install -d "${pkgdir}/usr/share/bash-completion/completions"
    install -m644 completions/hyprcod.bash "${pkgdir}/usr/share/bash-completion/completions/hyprcod" 2>/dev/null || true
    install -d "${pkgdir}/usr/share/zsh/site-functions"
    install -m644 completions/hyprcod.zsh "${pkgdir}/usr/share/zsh/site-functions/_hyprcod" 2>/dev/null || true
}
