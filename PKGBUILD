# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=scad2step
pkgver=0.1.3
pkgrel=1
pkgdesc="Convert an OpenSCAD file to a STEP file from the command line"
arch=('any')
url="https://github.com/etjones/scad2step"
license=('MIT')
depends=('python' 'python-scad123d')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('83158ff86d826f0236ac05f67d4bf9ae5351e7d8392aefc3fce23b7677172776')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${pkgver}"
  rm -rf test-env
  python -m installer --destdir=test-env dist/*.whl
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="${PWD}/test-env/${_site_packages}" pytest -m "not needs_openscad"
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
