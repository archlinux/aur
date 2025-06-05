_name=build123d
pkgname="python-${_name}-git"
pkgdesc="A python CAD programming library"
pkgver=v0.9.1.r167.08a9014
pkgrel=1
arch=('any')
url="https://github.com/gumyr/build123d"
license=('Apache')
depends=('python-ocp>=7.8' 'python-lib3mf>=2.3.1' 'python-typing_extensions' 'python-numpy' 'python-svgpathtools'
    'python-anytree' 'python-ezdxf' 'ipython' 'python-ocpsvg' 'python-trianglesolver' 'python-sympy')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${_name}::git+https://github.com/gumyr/${_name}#branch=dev")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

#prepare() {
#    cd "${srcdir}/${_name}"
#    patch -Np1 -i ../upstream_lib3mf.patch
#}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
    cd "${srcdir}/${_name}"
    PYTHONPATH="$PWD/build/lib" pytest
}
