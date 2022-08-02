# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Dan Foreman-Mackey

pkgname='python-emcee-git'
_basename="${pkgname%-git}"
_distname="${_basename#python-}"
pkgver=3.1.2.dev3+g9e407ee
pkgrel=1
pkgdesc='The Python ensemble sampling toolkit for affine-invariant MCMC'
arch=('any')
url="https://pypi.org/project/${_distname}"
_repourl="https://github.com/dfm/${_distname}"
license=('MIT')
depends=('python-numpy')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-h5py'
  'python-pytest'
  'python-scipy'
)
optdepends=(
  'python-h5py'
  'python-scipy'
)
source=("${_basename}::git+${_repourl}.git")
b2sums=('SKIP')

pkgver() {
  cd "${_basename}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*\)-g/dev\1+g/;s/-/./g;s/^v//')"
}

build() {
  cd "${_basename}"
  python -m build --wheel --no-isolation
}

check() {
  #python -c 'import emcee; emcee.test()'
  cd "${_basename}"
  pytest -v || warning 'Tests failed'
}

package() {
  cd "${_basename}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
