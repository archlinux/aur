# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-blacksheep
_name=${pkgname#python-}
pkgver=2.2.0
pkgrel=1
epoch=
pkgdesc="Fast web framework for Python asyncio"
arch=($CARCH)
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    glibc
    python
    python-setuptools
    python-certifi
    python-dateutil
    python-httptools
    python-itsdangerous
    python-jinja
    python-pydantic
    python-pyjwt
    #AUR
    python-essentials
    python-essentials-openapi
    python-guardpost
    python-rodi
)
makedepends=(
    cython
    flake8
    mypy
    python-black
    python-flake8-black
    python-hatchling
    python-build
    python-installer
    python-wheel
    #     python-setuptools
)
checkdepends=(
    python-pytest
    python-pytest-asyncio
    python-pytest-cov
)
optdepends=()
options=()
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('bb9ffac004c0a6f94c5c3dc804f95fbc3b69070bd186e2e6e36e5a77a332076d')

build() {
    cd "${srcdir}/${_name}-${pkgver}"

    cython blacksheep/url.pyx
    cython blacksheep/exceptions.pyx
    cython blacksheep/headers.pyx
    cython blacksheep/cookies.pyx
    cython blacksheep/contents.pyx
    cython blacksheep/messages.pyx
    cython blacksheep/scribe.pyx
    cython blacksheep/baseapp.pyx
    python setup.py build_ext --inplace

    #     make buildext
    #     make annotate
    #     make build
    python -m build --wheel --no-isolation

}

package() {
    cd "${srcdir}/${_name}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl
}
