# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='uhi'
pkgname="python-${_pkgname}"
pkgver='0.3.3'
pkgrel=2
pkgdesc="Contains the code for the PlottableHistogram Protocol, to be used in type checking libraries wanting to conform to the protocol."
arch=('any')
url='https://github.com/scikit-hep/uhi'
license=('MIT')
depends=('python-numpy' 'python-typing_extensions' 'root')
makedepends=('git' 'python-build' 'python-installer' 'python-hatch-vcs' 'python-hatchling')
checkdepends=('python-pytest' 'python-boost-histogram' 'python-importlib-metadata')
source=("${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
