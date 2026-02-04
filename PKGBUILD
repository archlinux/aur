# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-shippinglabel
_name=${pkgname#python-}
pkgver=2.3.0
pkgrel=2
pkgdesc="Utilities for handling Python packages"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url='https://shippinglabel.readthedocs.io/'
depends=(
    python
    python-apeye
    python-dist-meta
    python-dom-toml
    python-domdf-python-tools
    python-packaging
    python-platformdirs
    python-typing_extensions
)
makedepends=(
    git
    python-build
    python-installer
    python-wheel
    python-setuptools
    python-hatchling
    python-hatch-requirements-txt
)
license=('MIT')
source=("${_name}::git+https://github.com/domdfcoding/shippinglabel.git#tag=v$pkgver")
sha512sums=('45d25d5e62bc041dc86d9971aafe3ee6489fe7af10884e44359e52e0c15111186367ab2bbad8b4dc4fd90ef24974759dfa51bbbeff3bd60b7cb8296d0d294c19')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
    cd "${srcdir}/${_name}"
    sed \
    -e 's/^requires = \[.*/requires = \[ "setuptools", "wheel" \]/' \
    -i pyproject.toml
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
