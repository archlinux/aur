# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-dom-toml
_name=${pkgname#python-}
pkgver=2.4.0b1
pkgrel=1
pkgdesc="Dom's tools for Tom's Obvious, Minimal Language"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url='https://dom-toml.readthedocs.io/en/latest/'
depends=(
    python
    python-domdf-python-tools
    python-toml
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'python-flit-core'
)
license=('MIT')
source=("${_name}::git+https://github.com/domdfcoding/dom_toml.git#tag=v$pkgver")
sha512sums=('01cbd5a644901c9e0646c8369f72c5a07ad1520e7b527204de0ae9804f2cd1197d0344b7614609c014aa70c1a0c5c433aae36031e6269cd3aa2a2eb0332f2efc')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
    cd "${srcdir}/${_name}"
    sed -i 's/"\([a-zA-Z0-9_.-]*\)[<>=!~][^"]*"/"\1"/g' pyproject.toml
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
