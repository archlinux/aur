# Maintainer: kasish <kasishgadadhasu9950@gmail.com>
pkgname=unirun-git
pkgver=0.4.0
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
    local dir=$(find . -maxdepth 2 -name "pyproject.toml" -exec dirname {} \; | head -1)
    [ -z "$dir" ] && { echo "ERROR: pyproject.toml not found"; exit 1; }
    cd "$dir"

    install -d "${pkgdir}/usr/lib/unirun"
    cp -r unirun "${pkgdir}/usr/lib/unirun/"
    cp pyproject.toml "${pkgdir}/usr/lib/unirun/"

    install -d "${pkgdir}/usr/bin"
    cat <<EOF > "${pkgdir}/usr/bin/unirun"
#!/bin/sh
exec python3 -m unirun "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/unirun"

    install -d "${pkgdir}/usr/share/bash-completion/completions"
    install -m644 completions/unirun.bash "${pkgdir}/usr/share/bash-completion/completions/unirun"

    install -d "${pkgdir}/usr/share/zsh/site-functions"
    install -m644 completions/unirun.zsh "${pkgdir}/usr/share/zsh/site-functions/_unirun"
}
