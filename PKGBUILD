# Maintainer: dobedobedo <dobe0331 at gmail dot com>
_pkgname='spectral'
pkgname=("python-$_pkgname")
pkgver=0.23.1
pkgrel=1
pkgdesc="A Python module for hyperspectral image processing."
arch=('x86_64')
depends=('python'
         'python-numpy'
	    )
makedepends=('python-setuptools'
             'python-pytest')
optdepends=('python-pillow: Required if displaying or saving images'
            'python-wxpython: Required if calling view_cube or view_nd'
            'python-matplotlib: Required if rendering raster displays or spectral plots'
            'ipython: Required for interactive, non-blocking GUI windows'
            'python-opengl: Required if calling view_cube or view_nd'
           )
url='http://www.spectralpython.net/'
license=('MIT')
source=("https://github.com/spectralpython/spectral/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ec04aa16a85a436358a39ce8c872b2c29d2f7f6d542e6cbe11505f9b686e171c')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver/"
    # Change the call due to API change in Python 3.10
    find -name "*.py*" -exec sed -i 's/collections.Callable/collections.abc.Callable/' '{}' \;
}

build() {
    cd "$srcdir/$_pkgname-$pkgver/"
    python setup.py build
}

check(){
    cd "$srcdir/$_pkgname-$pkgver/"
    # Download sample dataset
    rm -Rf ./spectral_data
    git clone https://github.com/spectralpython/sample-data.git ./spectral_data
    SPECTRAL_DATA=./spectral_data python -m spectral.tests.run
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
} 
