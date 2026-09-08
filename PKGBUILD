# Maintainer: taotieren <admin@taotieren.com>

pkgbase=python-fcetool-git
pkgname=python-fcetool-git
_name=${pkgname%-git}
_name=${_name#python-}
pkgver=1.0.6.r0.gff7d9d6
pkgrel=1
pkgdesc="Extract specific files from remote ROM.ZIP archives without downloading the complete ROM"
arch=(any)
url="https://github.com/fcetool/fcetool"
license=('MIT')
groups=()
provides=(${_name} ${pkgname%-git})
conflicts=(${_name} ${pkgname%-git})
replaces=()
_pydeps=(
    aiohttp
    pyzstd
)
depends=(
    python
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    git
    python-build
    python-installer
    python-wheel
    python-setuptools
)
checkdepends=()
optdepends=()
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')
options=()

pkgver() {
    cd "${srcdir}/${_name}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
