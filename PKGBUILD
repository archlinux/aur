# Maintainer: taotieren <admin@taotieren.com>

pkgname=tinyget-git
_name=${pkgname%-git}
pkgver=r118.39b1533
pkgrel=1
epoch=
pkgdesc="A cross-distro package management tool."
arch=('any')
# url="https://pypi.org/project/tinyget"
url="https://gitee.com/tinylab/tinyget"
license=(GPL-2.0-or-later)
groups=()
provides=(${_name})
conflicts=(${_name})
_pydeps=(
    click
    grpcio
    requests
    rich
    protobuf
    trogon
)
depends=(
    bash
    python
    "${_pydeps[@]/#/python-}")
_pymakedeps=(
    black
    hatchling
    orjson
    build
    installer
    wheel
    setuptools
)
makedepends=(
    flake8
    git
    gettext
    "${_pymakedeps[@]/#/python-}")
optdepends=('vim: Default change to software source editor')
checkdepends=(python-pytest)
options=('!strip')
# source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
source=(${_name}::git+$url.git)
noextract=()
sha256sums=('SKIP')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
    cd "${srcdir}/${_name}"
    git switch ospp-2024
}

pkgver() {
    cd "${srcdir}/${_name}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "${srcdir}/${_name}"
    flake8 ./${_name} --count --show-source --statistics
    black ./${_name} --check --verbose .
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_name}"
    #     pytest
    PYTHONPATH=. pytest -k 'not test_cli'
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
