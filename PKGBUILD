# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="packaging"
pkgname="rustpython-${_pypiname}"
pkgver=26.3
pkgrel=1
pkgdesc="Core utilities for Python packages"
arch=(
  'any'
)
url="https://github.com/pypa/${_pypiname}"
_url="https://github.com/pypa/${_pypiname}"
license=(
  'Apache-2.0 OR BSD-2-Clause'
)
depends=(
  'rustpython'
)
# checkdepends=(
#   'rustpython-pytest'
#   'rustpython-pretend'
#   'rustpython-tomli-w'
#   'rustpython-hypothesis'
# )
makedepends=(
  'git'
  'rustpython-build'
  'rustpython-flit-core'
  'rustpython-installer'
)
replaces=(
  "${pkgname}-bootstrap"
)
_pkgsrc="python-${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git#tag=${pkgver}?signed"
)
sha256sums=('5ea0acedf3b15c0679ac4ea4412e17796e0ea22a728c0145d197b5716ae493f2')
validpgpkeys=(
  '2FDEC9863E5E14C7BC429F27B9D0E45146A241E8' # Henry Schreiner <hschrein@cern.ch>
)

build() {
  cd "${srcdir}/${_pkgsrc}"
  rustpython -m build --wheel --no-isolation --skip-dependency-check
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   RUSTPYTHONPATH=src pytest-rustpython
# }

package() {
  local rustpython_site_packages="$(rustpython -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  rustpython -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 README* -t "${pkgdir}/usr/share/doc/${pkgname}"

  install -vd "${pkgdir}/usr/share/licenses"
  ln -vsf "${rustpython_site_packages}/${_pypiname//-/_}-${pkgver}.dist-info/licenses" \
    "${pkgdir}/usr/share/licenses/${pkgname}"
}
