# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-galois
_name=${pkgname#python-}
pkgver=0.3.10
pkgrel=1
pkgdesc="A performant NumPy extension for Galois fields and their applications"
arch=(any)
url=https://github.com/mhostetter/galois
license=(MIT)
depends=(
    python-numpy
    python-numba
    python-typing_extensions
)
makedepends=(
    python-build
    python-installer
    python-setuptools-scm
    python-wheel
)
checkdepends=(
    python-pytest
    python-pytest-benchmark
)
source=(
    $_name-$pkgver.tar.gz::https://github.com/mhostetter/$_name/archive/refs/tags/v$pkgver.tar.gz
    numpy-2.patch::https://patch-diff.githubusercontent.com/raw/mhostetter/galois/pull/550.patch
    numpy-2-more-fixes.patch::https://github.com/mhostetter/galois/compare/numpy-2.0...iyanmv:galois:numpy-2.0.patch
)
b2sums=('9f507ed690ef4c54e2eb4692ee5889ff12cb4a67aef90a4c71a3a2e85fa88cd90c1821478bda53b397b1d107db2d6a57a8eb698c2824f8d52562e1622c4a699b'
        'a4c302671740a3b7eac9e6be3dd6bdc718d4f228bd2ffc9aa462eab73be2ee06042f0aad3c2d13a25960a1ac4fd30c8a09ffb9f71037a42c6b2b696536917374'
        'ab0cd1546020b68659e6f1f47868d010298043e498907fc0dc083622ae80f68458ea38a944049c647ed89315c36eabcdbfb0f1b29c30ae0b9ab1c34241f7a66e')

prepare() {
    patch -N -p1 -d $_name-$pkgver -i ../numpy-2.patch
    patch -N -p1 -d $_name-$pkgver -i ../numpy-2-more-fixes.patch
}

build() {
    cd $_name-$pkgver
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m build --wheel --no-isolation
}

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd $_name-$pkgver
    python -m installer --destdir=test_dir dist/*.whl
    PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" pytest
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
