# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-protoletariat
_name=${pkgname#python-}
pkgver=3.3.9
pkgrel=1
pkgdesc="Python protocol buffers for the rest of us"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/cpcloud/protoletariat"
_pydeps=(
    astunparse
    click
    protobuf 
    pytest
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    'python-poetry'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
optdepends=(
    'python-grpcio-tools: Python protobuf generator for GRPC'
)
license=('Apache-2.0')
source=("${_name}::git+${url}.git#tag=$pkgver")
sha256sums=('972b9088b4f225f1336b8c778ff646ac04d738547be224bfde81907419aff574')

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
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
