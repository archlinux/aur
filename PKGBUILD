# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=uuid-utils
pkgname=python-${_base}
pkgver=0.13.0
pkgrel=1
pkgdesc="Drop-in replacement for Python UUID with bindings in Rust"
arch=('any')
url="https://github.com/aminalaee/${_base}"
license=('BSD-3-Clause')
depends=('python' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-maturin')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
b2sums=('c4190609e60dd3fd69bbc57d3b12c2e7ce7a1e47e110d1fa856dcc25d059475e555850a2cb02846ac2fbea0a7e32c188437f080de91655fcb6e7011562466045')

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
