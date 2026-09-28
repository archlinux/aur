# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-nanobind-backend
_name=${pkgname#python-}
_tagname=backend-v1.0.0
pkgver=${_tagname#backend-v}
pkgver=${pkgver//-/_}
pkgrel=1
pkgdesc="Compiled nanobind backend for extensions built in split mode"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/wjakob/nanobind"
_pydeps=(

)
depends=(
    'libgcc'
    'libstdc++'
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    'git'
    'cmake'
    'robin-map'
    'python-scikit-build-core'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'nanobind: Tiny and efficient C++/Python bindings'
)
license=('BSD-3-Clause')
source=("${_name}::git+${url}.git#tag=$_tagname")
sha256sums=('e9622fcd814bbad1c5ae6a5678869adcb3445465d91cba1699ce4e126f65ec14')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}/nanobind-backend/"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}/nanobind-backend/"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
