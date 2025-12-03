# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=uuid-utils
pkgname=python-${_base}
pkgver=0.12.0
pkgrel=1
pkgdesc="Drop-in replacement for Python UUID with bindings in Rust"
arch=('any')
url="https://github.com/aminalaee/${_base}"
license=('BSD-3-Clause')
depends=('python' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-maturin')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
b2sums=('2e7d322a6004ce7d8326aa2ba9fb072118bcc74040a6ed2734e3f2113ba356269d2424b2bab88d846fb6dd603f7c4656ff5b9df64f879dca8028ffc7681467a1')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_base}-${pkgver}"
  python -m installer -d tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
