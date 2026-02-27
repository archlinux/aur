pkgname=python-build123d
pkgdesc="A python CAD programming library"
pkgver=0.10.0
pkgrel=0
arch=('any')
url="https://github.com/gumyr/build123d"
license=('Apache')
depends=('python-ocp>=7.8' 'python-ocp_gordon' 'python-lib3mf>=2.3.1' 'python-typing_extensions' 'python-numpy' 'python-svgpathtools'
    'python-anytree' 'python-ezdxf' 'ipython' 'python-ocpsvg' 'python-trianglesolver')
makedepends=('python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('73ded38ddca8ebb95e7dd078ac3d7aacc8ca42fce8f1d176f1040e35fba4f608')

prepare() {
    cd build123d-$pkgver
    find . -type f -name "*.py" -exec sed -i \
        -e 's/Vertex_s/Vertex/g' \
        -e 's/Edge_s/Edge/g' \
        -e 's/Wire_s/Wire/g' \
        -e 's/Face_s/Face/g' \
        -e 's/Shell_s/Shell/g' \
        -e 's/Solid_s/Solid/g' \
        -e 's/Compound_s/Compound/g' \
        -e 's/OuterWire/OuterWire_s/g' \
        {} +
}

build() {
    cd build123d-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd build123d-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
    cd build123d-$pkgver
    PYTHONPATH="$PWD/build/lib" pytest
}
