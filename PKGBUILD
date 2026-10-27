# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=scad2step-git
_pkgname=scad2step
pkgver=0.1.2.r1.g2e594fc
pkgrel=1
pkgdesc="Convert an OpenSCAD file to a STEP file from the command line (latest git version)"
arch=('any')
url="https://github.com/etjones/scad2step"
license=('MIT')
depends=('python' 'python-scad123d')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-pytest')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}"
  rm -rf test-env
  python -m installer --destdir=test-env dist/*.whl
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="${PWD}/test-env/${_site_packages}" pytest -m "not needs_openscad"
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
