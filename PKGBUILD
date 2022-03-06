# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='uhi'
pkgname="python-${_pkgname}"
pkgver='0.3.1'
pkgrel=1
pkgdesc="Contains the code for the PlottableHistogram Protocol, to be used in type checking libraries wanting to conform to the protocol."
arch=('any')
url='https://github.com/scikit-hep/uhi'
license=('MIT')
depends=('python-numpy' 'python-typing_extensions' 'root')
makedepends=('git' 'python-setuptools' 'python-dephell')
checkdepends=('python-pytest' 'python-boost-histogram' 'python-importlib-metadata')
source=("${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # tests rely on egg-info metadata
  python setup.py bdist_egg
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cp -r src/"${_pkgname}".egg-info build/lib/
  PYTHONPATH="${PWD}/build/lib:${PWD}" pytest
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --skip-build --root="${pkgdir}/" --optimize=1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
