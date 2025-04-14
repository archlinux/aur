# Contributor: a821 <a821 (at nospam) mail de>
# Contributor: dobedobedo <dobe0331 at gmail dot com>

# pin 'sample-data' commit needed for `check()`
_data=b2c0458d18a26b84c4262a09a106bd7cdeb1203d

pkgname=python-spectral
pkgver=0.24
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
optdepends=('python-pillow: Required if displaying or saving images'
            'python-wxpython: Required if calling view_cube or view_nd'
            'python-matplotlib: Required if rendering raster displays or spectral plots'
            'ipython: Required for interactive, non-blocking GUI windows'
            'python-opengl: Required if calling view_cube or view_nd'
           )
url='https://www.spectralpython.net/'
license=('MIT')
source=("$pkgname::git+https://github.com/spectralpython/spectral.git#tag=$pkgver"
        "$pkgname-sample-data::git+https://github.com/spectralpython/sample-data#commit=$_data")
sha256sums=('11f3aafc70fb29f41e0b2cbe23200f3483fb25ae3abc06e8c4214c89eddac2f4'
            '19f3128d452bcb40a605620b7c9a7410d7c9553a707aa342f15a118ee8e62e3d')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname"
    python -m installer --dest="$srcdir/temp" dist/*.whl
    local _site=$(python -c 'import site;print(site.getsitepackages()[0])')
    cd ..
    export PYTHONPATH="$srcdir/temp/$_site"
    SPECTRAL_DATA=$pkgname-sample-data python -m spectral.tests.run
}

package() {
    cd "$pkgname"
    python -m installer --dest="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
} 
