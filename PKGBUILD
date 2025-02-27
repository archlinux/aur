pkgname=python-build123d
pkgdesc="A python CAD programming library"
pkgver=0.9.1
pkgrel=2
arch=('any')
url="https://github.com/gumyr/build123d"
license=('Apache')
depends=('python-ocp>=7.8' 'python-lib3mf>=2.3.1' 'python-typing_extensions' 'python-numpy' 'python-svgpathtools'
    'python-anytree' 'python-ezdxf' 'ipython' 'python-ocpsvg' 'python-trianglesolver')
makedepends=('python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
_name=${pkgname#python-}
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz"
    "upstream_lib3mf.patch")
sha256sums=('8bc179cb65c7e7393191ad7113f13781fabf75892be07060f2bebf95369c093b'
            '4ec436367d0eb1243f7bef351acfd615781258ec04b0aa563b9d0ddf4c368181')

prepare() {
  cd build123d-$pkgver
  patch -Np1 -i ../upstream_lib3mf.patch
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
