# Maintainer: a821 <a821 (at nospam) mail de>
# Contributor: dobedobedo <dobe0331 at gmail dot com>

# pin 'sample-data' commit needed for `check()`
_data=b2c0458d18a26b84c4262a09a106bd7cdeb1203d

pkgname=python-spectral
pkgver=0.26
pkgrel=1
pkgdesc="A Python module for hyperspectral image processing."
arch=('any')
depends=('python' 'python-numpy')
makedepends=(
    'git'
    'python-setuptools'
    'python-build'
    'python-installer'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
)
optdepends=(
    'ipython: Required for interactive visualization'
    'pyside6: Required for 3D graphics'
    'python-matplotlib: Required if rendering raster displays or spectral plots'
    'python-opengl: Required for 3D graphics'
    'python-pillow: Required if displaying or saving images'
)
url='https://www.spectralpython.net/'
license=('MIT')
source=("$pkgname::git+https://github.com/spectralpython/spectral.git#tag=$pkgver"
        "$pkgname-sample-data::git+https://github.com/spectralpython/sample-data#commit=$_data")
sha256sums=('b1fdbb4b1768e2709a1957b0713b2f0323f027dc540a196e8d2b5f36b14352b8'
            '19f3128d452bcb40a605620b7c9a7410d7c9553a707aa342f15a118ee8e62e3d')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname"
    export SPECTRAL_DATA="$srcdir/$pkgname-sample-data"
    pytest -m 'not graphics' spectral/tests
}

package() {
    cd "$pkgname"
    python -m installer --dest="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
} 
