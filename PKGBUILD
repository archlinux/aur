# Contributor: a821 <a821 (at nospam) mail de>
# Contributor: dobedobedo <dobe0331 at gmail dot com>

# there're too many bug fixes to cherry-pick cleanly
# so it grabs the last commit from develop branch
_commit=bbc36afa912043aa9caf2b5d46d7acdc25c6f551

pkgname=python-spectral
pkgver=0.23.1.r9.gbbc36af
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
source=("$pkgname::git+https://github.com/spectralpython/spectral.git#commit=$_commit"
        "$pkgname-sample-data::git+https://github.com/spectralpython/sample-data")
sha256sums=('fcd83d4cde0f9902a012d1661f7cb7b9a990f9f24a47065816074e7ab2aaf5dd'
            'SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/-/.r/;s/-/./g'
}

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
