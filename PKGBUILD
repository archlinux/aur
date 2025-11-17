# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-blacksheep
_name=${pkgname#python-}
pkgver=2.4.5
pkgrel=1
epoch=
pkgdesc="Fast web framework for Python asyncio"
arch=($CARCH)
# url="https://pypi.org/project/${_name}"
url="https://github.com/Neoteroi/BlackSheep"
license=(MIT)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    glibc
    python
    python-certifi
    #     python-dateutil
    python-h11
    python-httptools
    python-itsdangerous
    python-jinja
    python-pydantic
    python-pyjwt
    #AUR
    python-essentials
    python-essentials-openapi
    python-guardpost
    python-opentelemetry-api
    python-opentelemetry-sdk
    python-rodi
)
makedepends=(
    git
    cython
    flake8
    mypy
    python-black
    python-flake8-black
    python-hatchling
    python-build
    python-installer
    python-wheel
    python-setuptools
)
checkdepends=(
    python-pytest
    python-pytest-asyncio
    python-pytest-cov
)
optdepends=()
options=()
# source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
source=("${_name}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('c250fed4c9908f2447ac03ae7abca223df9e61a80bf9554dcd1daf69af66cfac')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"

    sed -i 's/{self.name)}/{self.name}/g' blacksheep/cookies.pyx
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
    cd "${srcdir}/${_name}"

    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
