pkgname=python-build123d
_build_fragment="tag=v0.13.0"
pkgdesc="A python CAD programming library"
pkgver=0.13.0
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
b2sums=('b07bae5fe99ac1b6b36fe13729f732ac30d4eede513237a206a8eb109545e1c7f2fb4edc992087bac95b4a8c45fbc7c350c82a6cf34a8a59d201a90b11c2a1a3')

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
