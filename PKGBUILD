# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-x690
_name=${pkgname#python-}
pkgver=1.0.0.post1
pkgrel=3
epoch=
pkgdesc="Pure Python X.690 implementation"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-importlib-metadata
    python-pytest
    # AUR
    python-t61codec
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('3a2a8a4e479079188aa6e847814981286b8f1c19569898fa3fe573ee0ce05349')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    mv tests x690
    install -Dm644 /dev/stdin pytest.ini <<EOF
[pytest]
testpaths = x690/tests
pythonpath = x690
EOF
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
