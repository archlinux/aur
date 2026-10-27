# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=python-scad123d-git
_pkgname=scad123d
pkgver=0.9.0.r0.g611f524
pkgrel=1
pkgdesc="Import OpenSCAD files as native build123d BRep geometry, via OpenSCAD's flattened CSG export (latest git version)"
arch=('any')
url="https://github.com/etjones/scad123d"
license=('MIT AND OFL-1.1')
# build123d 0.13 needs OCCT 8, so this can't be installed until
# python-build123d and python-ocp catch up in the AUR
depends=(
  'openscad'
  'python'
  'python-build123d>=0.13.0'
  'python-fonttools'
  'python-lark-parser'
  'python-numpy'
  'python-ocp'
  'python-scipy'
  'python-webcolors'
)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-pytest' 'python-psutil' 'python-rich')
optdepends=(
  'scad2step: scad2step command'
  'python-psutil: scad123d-batch'
  'python-rich: scad123d-batch'
)
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")
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
  # Same tier as upstream CI: the differential tests need a specific OpenSCAD
  PYTHONPATH="${PWD}/test-env/${_site_packages}" pytest -m "not needs_openscad"
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Owned by the scad2step package, which is the same entry point
  rm "${pkgdir}/usr/bin/scad2step"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 src/solid123d/_fonts/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.LiberationSans"
}
