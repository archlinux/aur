# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=jsonschema-rs
pkgname=python-${_name}
pkgver=0.32.0
pkgrel=1
pkgdesc="A high-performance JSON Schema validator for Python."
arch=('any')
url='https://github.com/Stranger6667/jsonschema'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('0500cfa019fa58dc1ac52d60592a25d36d4ccbb3a2cf40c8b291ee8d8f7fecc7')
depends=('python' 'gcc-libs' 'glibc')
makedepends=('python-maturin' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-flask' 'python-hypothesis' 'python-pytest')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv

  )
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" crates/jsonschema-py/tests-py
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
