# Maintainer: taotieren <admin@taotieren.com>

pkgname=tinyget-git
_name=${pkgname%-git}
pkgver=r34.d0593e8
pkgrel=1
epoch=
pkgdesc="A cross-distro package management tool."
arch=('any')
# url="https://pypi.org/project/tinyget"
url="https://gitee.com/tinylab/tinyget"
license=(Apache-2.0)
groups=()
provides=(${_name})
conflicts=(${_name})
_pydeps=(
    click
    requests
    rich
    trogon)
depends=(
    python
    "${_pydeps[@]/#/python-}")
_pymakedeps=(
    orjson
    build
    installer
    wheel
    setuptools)
makedepends=(git
    "${_pymakedeps[@]/#/python-}")
checkdepends=(python-pytest)
options=('!strip')
# source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
source=(${_name}::git+$url.git)
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
