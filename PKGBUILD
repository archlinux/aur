# Maintainer: dobedobedo <dobe0331 at gmail dot com>
_pkgname='spectral'
pkgname=("python-$_pkgname")
pkgver=0.22.4
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
sha256sums=('b208ffd1042e32fd2276a35e098e3df26a5f6ff1310b829e97d222c66645a9af')
_source_url="https://files.pythonhosted.org/packages/c5/e0/ca7aef565547c1efa6ced9a8509d51ee427a19b4f242c4ddef299a13b3ad"
source=("$_source_url/$_pkgname-$pkgver.tar.gz")

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
