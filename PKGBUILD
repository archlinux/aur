# Maintainer: Falko Galperin <dr (dot) asasteghof (at) gmail (dot) com>
# Maintainer: qubeck <qubeck [AT] disroot [DOT] org>

pkgname=python-ctypesgen
_name=${pkgname#python-}
pkgver=1.1.1
pkgrel=2
pkgdesc='Generate Python ctypes wrappers from C header files'
arch=(any)
url='https://github.com/ctypesgen/ctypesgen'
license=(BSD-2-Clause)
depends=(
  gcc
  python
)
makedepends=(
  help2man
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-toml
  python-wheel
)
checkdepends=(python-pytest)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz"
        'ctypedescs-backports.patch')
sha256sums=('deaa2d64a95d90196a2e8a689cf9b952be6f3366f81e835245354bf9dbac92f6'
            '0d4b74c4aa3514715fa365b5dd7c9c8a4b0b53e160d1c6f1ba9bc3c8123bf238')

prepare() {
  cd "${_name}-${pkgver}"

  patch -Np1 -i ../ctypedescs-backports.patch
}

build() {
  cd "${_name}-${pkgver}"

  mkdir .man
  ln -sfn ../run.py .man/${_name}
  help2man \
    --name="${pkgdesc}" \
    --section=1 \
    --no-info \
    --output="${_name}.1" \
    ".man/${_name}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-${pkgver}"

  pytest tests/testsuite.py
}

package() {
  cd "${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm644 "${_name}.1" \
    -t "${pkgdir}/usr/share/man/man1"
}
