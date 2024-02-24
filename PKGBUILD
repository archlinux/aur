# Maintainer: Benoît Allard <benoit.allard@gmx.de>
_name=python-betterproto
pkgname="$_name-git"
pkgver=r403.5666393
pkgrel=1
pkgdesc="Clean, modern, Python 3.6+ code generator & library for Protobuf 3 and async gRPC"
arch=('any')
url="https://github.com/danielgtaylor/python-betterproto"
license=('MIT')
makedepends=(git python-build python-installer python-wheel "python-poetry" "python-pytest" "python-pytest-asyncio" "python-grpcio-tools")
depends=("python-grpclib" "python-jinja" "python-dateutil" "python-isort")
optdepends=(
    "python-black: support for protoc -- python_betterproto_out"
)
source=("git+https://github.com/danielgtaylor/${_name}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

_check() {
    cd $_name
    export PYTHONPATH=src
    python -m tests.generate -v
    python -m pytest tests/
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
}
