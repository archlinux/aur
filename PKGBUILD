# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=uuid-utils
pkgname=python-${_base}
pkgver=0.14.1
pkgrel=1
pkgdesc="Drop-in replacement for Python UUID with bindings in Rust"
arch=('x86_64')
url="https://github.com/aminalaee/${_base}"
license=('BSD-3-Clause')
depends=('python' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-maturin')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
b2sums=('73d3cf2d0c982e7ff35a02eb25282d324ad87984a95ca226cb6c60dcdb4af283dbda772d8179ecceed1472ea02a05f561c54e3b059808de448c740986dbe2307')

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
