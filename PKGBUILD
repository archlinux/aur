pkgname=python-build123d
_build_fragment="tag=v0.11.1"
pkgdesc="A python CAD programming library"
pkgver=0.11.1
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
#_name=${pkgname#python-}
source=("git+https://github.com/gumyr/build123d#${_build_fragment}")
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
b2sums=('9c820374bcc69f9c25c4cffd310d5d8fa881c971fb6da3f163226e6a8fd97ec078deeb608aa4eb9cba4753600a7408cf3f047df68dc0dd421e108d4c8c47d50d')

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
