# Maintainer: dobedobedo <dobe0331 at gmail dot com>
_pkgname='spectral'
pkgname=("python-$_pkgname")
pkgver=r550.1b25497
pkgrel=1
pkgdesc="A Python module for hyperspectral image processing."
arch=('x86_64')
depends=('python'
         'python-numpy'
	    )
makedepends=('git' 
             'python-setuptools'
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
source=("${_pkgname}::git+https://github.com/spectralpython/spectral.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    # Change the call due to API change in Python 3.10
    find -name "*.py*" -exec sed -i 's/collections.Callable/collections.abc.Callable/' '{}' \;
}

build() {
    cd "$srcdir/$_pkgname"
    python setup.py build
}

check(){
    cd "$srcdir/$_pkgname"
    # Download sample dataset
    rm -Rf ./spectral_data
    git clone https://github.com/spectralpython/sample-data.git ./spectral_data
    SPECTRAL_DATA=./spectral_data python -m spectral.tests.run
}

package() {
    cd "$srcdir/$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
} 
