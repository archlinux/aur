# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=uhi
pkgname="python-${_pkgname}"
pkgver=0.5.0
pkgrel=3
pkgdesc="Contains the code for the PlottableHistogram Protocol, to be used in type checking libraries wanting to conform to the protocol."
arch=('any')
url='https://github.com/scikit-hep/uhi'
license=('MIT')
depends=('python' 'python-fastjsonschema' 'python-numpy' 'root')
makedepends=('git' 'python-build' 'python-installer' 'python-hatch-vcs' 'python-hatchling')
checkdepends=('python-pytest' 'python-boost-histogram')
source=("${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}")
sha256sums=('5416b9f159c52db513efd9b8018809be7b0ea797da439dc970587b40eeba7dd0')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${pkgver}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
