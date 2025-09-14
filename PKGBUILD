# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-phonemizer-fork
_name=${pkgname#python-}
pkgver=3.3.2
pkgrel=3
epoch=
pkgdesc="Simple text to phones converter for multiple languages"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname%-fork})
conflicts=(${pkgname%-fork})
depends=(
    python
    python-joblib
    python-typing_extensions
    # AUR
    python-dlinfo
    python-segments
)
makedepends=(
    python-hatchling
    python-build
    python-installer
    python-wheel
    python-setuptools
)
checkdepends=()
optdepends=()
options=('!strip' '!debug')
_name=${_name//-/_}
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('10e16e827d0443b087062e21b55e805c00989cf1343b2e81e734cae5f6c0cf69')

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
