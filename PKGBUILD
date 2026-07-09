pkgname=python-build123d-git
_build_fragment="branch=dev"
pkgdesc="A python CAD programming library -- latest from git"
pkgver=0.11.1.r2
pkgrel=1
arch=('any')
url="https://github.com/gumyr/build123d"
license=('Apache-2.0')
depends=(
python-ocp
python-ocp_gordon
python-lib3mf
python-typing_extensions
python-numpy
python-scikit-learn
python-scipy
python-svgpathtools
python-sympy
python-anytree
python-ezdxf
ipython
python-ocpsvg
python-trianglesolver
python-webcolors
)
makedepends=(
git
python-setuptools-scm
python-build
python-installer
python-wheel
)
checkdepends=(
gnu-free-fonts
python-pytest
)

provides=(python-build123d)
conflicts=(python-build123d)

source=("git+https://github.com/gumyr/build123d#${_build_fragment}")
b2sums=('SKIP')

pkgver() {
  cd build123d
  git describe --tags | rev | cut -d- -f2- | rev | sed 's/-/.r/' | sed 's/^v//'
}

prepare() {
  cd build123d
}

build() {
  cd build123d
  python -m build --wheel --no-isolation
}

package() {
  cd build123d
  python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
  python -m venv --without-pip --system-site-packages --clear venv
  source venv/bin/activate
  python -m installer build123d/dist/*.whl

  cd build123d/tests
  python -m pytest .

  deactivate
}
