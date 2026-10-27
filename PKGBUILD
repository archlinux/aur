# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=python-scad123d
_pkgname=scad123d
pkgver=0.8.0
pkgrel=1
pkgdesc="Import OpenSCAD files as native build123d BRep geometry, via OpenSCAD's flattened CSG export"
arch=('any')
url="https://github.com/etjones/scad123d"
license=('MIT AND OFL-1.1')
depends=(
  'openscad'
  'python'
  'python-build123d'
  'python-fonttools'
  'python-lark-parser'
  'python-numpy'
  'python-ocp'
  'python-scipy'
  'python-webcolors'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-pytest' 'python-psutil' 'python-rich')
optdepends=(
  'scad2step: scad2step command'
  'python-psutil: scad123d-batch'
  'python-rich: scad123d-batch'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('044c3ef01d2ee9dd334e91731adf94e86a1e84eeb2f968243db74afaa812451e')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  rm -rf test-env
  python -m installer --destdir=test-env dist/*.whl
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  # Same tier as upstream CI: the differential tests need a specific OpenSCAD
  PYTHONPATH="${PWD}/test-env/${_site_packages}" pytest -m "not needs_openscad"
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Owned by the scad2step package, which is the same entry point
  rm "${pkgdir}/usr/bin/scad2step"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 src/solid123d/_fonts/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.LiberationSans"
}
