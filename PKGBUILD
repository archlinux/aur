# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=pathpy3
pkgname=python-$_name
pkgver=3.0.0a2
pkgrel=2
pkgdesc="pathpy: path data analysis"
arch=('any')
url="https://www.pathpy.net"
license=(AGPL)
depends=('python>=3.8'
         'python-numpy>=1.17.0'
	 'python-scipy>=1.3.1'
	 'python-tqdm>=4.36.1'
         'python-intervaltree>=3.0.2')
makedepends=('python-installer' 'python-wheel')
conflicts=('python-pathpy2')


source=("pathpy-$pkgver.tar.gz::https://github.com/pathpy/pathpy/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(7edc85415136574d7e27e9510c21013d4ed55aa8b001302422d52e5ba373fcae)
build() {
    cd "pathpy-$pkgver"
    # assuming python 3.8 or later, so we can replace singledispatchmethod with functools
    for file in $(grep -r 'from singledispatchmethod import singledispatchmethod' ./ | cut -d: -f1); do
	echo "Fixing $file"
    	sed -i 's/from singledispatchmethod/from functools/' "$file"
    done

    # remove deprecated sphinx calls for documentation creation (not used)
    for file in $(grep -r 'add_stylesheet' ./ | cut -d: -f1); do
	echo "Fixing $file"
    	sed -i 's/add_stylesheet/add_css_file/' "$file"
    done
    for file in $(grep -r 'add_javascript' ./ | cut -d: -f1); do
	echo "Fixing $file"
    	sed -i 's/add_javascript/add_js_file/' "$file"
    done

    python -m build --wheel --no-isolation -x
}
package() {
    cd "pathpy-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
