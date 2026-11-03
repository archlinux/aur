# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-phonemizer
_name=${pkgname#python-}
pkgver=3.6.0
pkgrel=1
epoch=
pkgdesc="Simple text to phones converter for multiple languages"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-joblib
    python-pytest
    python-typing_extensions
    # AUR
    python-dlinfo
    python-segments
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
checkdepends=()
optdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('9808c897773a23def58d89e1a3ac3506f56e8d04ee806d3ee80214880e2c9261')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    mv test phonemizer
    install -Dm644 /dev/stdin pytest.ini <<EOF
[pytest]
testpaths = phonemizer/test
pythonpath = phonemizer
EOF
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
