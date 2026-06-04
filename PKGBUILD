# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-typechat-git
_name=${pkgname%-git}
_name=${_name#python-}
pkgver=r410.d493376
pkgrel=3
pkgdesc="TypeChat is a library that makes it easy to build natural language interfaces using types."
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
arch=('any')
url="https://github.com/microsoft/TypeChat"
_pydeps=(
    httpx
    pydantic
    pydantic-core
    typing_extensions
)
depends=(
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    'git'
    'python-hatchling'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=()
license=('MIT')
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')

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
    cd "${srcdir}/${_name}/python"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}/python"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
