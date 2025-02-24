# Maintainer: taotieren <admin@taotieren.com>

pkgname=bgscripttool-git
pkgver=r9.c53fe9d
pkgrel=2
pkgdesc="Intel BIOS Guard Script Tool"
arch=(any)
url="https://github.com/platomav/BGScriptTool"
license=('LicenseRef-custom')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    python
)
makedepends=(
    git
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=(
)
backup=()
options=('!strip' '!debug')
install=
source=("${pkgname}::git+${url}.git"
    "pyproject.toml")
sha256sums=('SKIP'
    '9ba407ef544d542ab0cb3204b89af6216a215e9b44b9d1f1968b243d4d6ab99f')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}
build() {
    mv ${srcdir}/pyproject.toml "${srcdir}/${pkgname}"
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}/"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
