# Maintainer: Nagy Roland <roliboy@protonmail.com>

# NOTE: the current python-cipheycore and python-cipheydists packages in the AUR are outdated and fail to build.
# until the situation gets resolved, these two packages will be included in this PKGBUILD.

pkgname=ciphey

pkgver=5.14.0
_pkgver_cipheycore=0.3.2
_pkgver_cipheydists=0.3.35

pkgrel=2
pkgdesc='Automated decryption tool'
arch=('any')
url='https://github.com/Ciphey/Ciphey'
license=('MIT')
depends=(
    'flake8'
    'python'
    'python-appdirs'
    'python-base58' #aur
    'python-base91' #aur
#    'python-cipheycore' #aur #temporarily included in this PKGBUILD
#    'python-cipheydists' #aur #temporarily included in this PKGBUILD
    'python-click'
    'python-mock'
    'python-pyaml'
    'python-pybase62' #aur
    'python-pylint'
    'python-pywhat' #aur
    'python-rich'
    'python-typing_inspect'
)
makedepends=(
    'python-setuptools'
    'python-dephell'
    'python-poetry' #for python-cipheycore
    'boost' #for python-cipheycore
    'swig' #for python-cipheycore
    'cmake' #for python-cipheycore
)
provides=('ciphey')
source=(
    "$pkgname.tar.gz::https://github.com/Ciphey/Ciphey/archive/refs/tags/$pkgver.tar.gz"
    "cipheycore.tar.gz::https://github.com/Ciphey/CipheyCore/archive/refs/tags/v$_pkgver_cipheycore.tar.gz"
    "cipheydists.tar.gz::https://files.pythonhosted.org/packages/source/c/cipheydists/cipheydists-$_pkgver_cipheydists.tar.gz"
)
sha256sums=(
    '42fd5ea5b462ab37cb2e6aed41c254e7ed44bb190fed9a3918e6bdd56d86e10f'
    'd05b4c15077b56121e96c1b934ae2d49f14004834a9b8fbc1bdc76782cd66253'
    '3436fde3f57df732e1a65fb03a565a564dd9d0c8d130c2e94f8b852e6a199a88'
)

prepare() {
    cd "Ciphey-$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
    #cipheycore
    cd "$srcdir/CipheyCore-$_pkgver_cipheycore"
    mkdir build && cd build
    cmake .. -DCIPHEY_CORE_TEST=OFF -DCMAKE_BUILD_TYPE=Release
    cmake --build .
    python -m poetry build
    cd dist
    tar xf "cipheycore-$_pkgver_cipheycore.tar.gz"
    cd "cipheycore-$_pkgver_cipheycore"
    python setup.py build

    #cipheydists
    cd "$srcdir/cipheydists-$_pkgver_cipheydists"
    python setup.py build

    #ciphey
    cd "$srcdir/Ciphey-$pkgver"
    python setup.py build
}

package() {
    #cipheycore
    cd "$srcdir/CipheyCore-$_pkgver_cipheycore/build/dist/cipheycore-$_pkgver_cipheycore"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 "$srcdir/CipheyCore-$_pkgver_cipheycore/LICENSE" "$pkgdir/usr/share/licenses/python-cipheycore/LICENSE"

    #cipheydists
    cd "$srcdir/cipheydists-$_pkgver_cipheydists"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-cipheydists/LICENSE"

    #ciphey
    cd "$srcdir/Ciphey-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
