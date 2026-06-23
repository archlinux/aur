# Maintainer: kasish <kasishgadadhasu9950@gmail.com>
pkgname=unirun-git
pkgver=0.4.2
pkgrel=1
pkgdesc="Run Anything. Anywhere. — Universal Application Runtime orchestration layer"
arch=('any')
url="https://github.com/KasishStar/UniRun"
license=('MIT')
depends=('python')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KasishStar/UniRun/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"
    local dir=$(find . -maxdepth 2 -name "unirun" -type d -exec test -f "{}/__init__.py" \; -print | head -1)
    [ -z "$dir" ] && { echo "ERROR: unirun package not found"; exit 1; }
    cd "$(dirname "$dir")"

    # Install to site-packages so python3 -m unirun works
    local pyver=$(python3 -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
    local sitepkg="${pkgdir}/usr/lib/python${pyver}/site-packages"
    install -d "${sitepkg}"
    cp -r unirun "${sitepkg}/"

    install -d "${pkgdir}/usr/bin"
    cat <<EOF > "${pkgdir}/usr/bin/unirun"
#!/bin/sh
exec python3 -m unirun "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/unirun"

    install -d "${pkgdir}/usr/share/bash-completion/completions"
    install -m644 completions/unirun.bash "${pkgdir}/usr/share/bash-completion/completions/unirun" 2>/dev/null || true

    install -d "${pkgdir}/usr/share/zsh/site-functions"
    install -m644 completions/unirun.zsh "${pkgdir}/usr/share/zsh/site-functions/_unirun" 2>/dev/null || true
}
