# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>

_base=uuid-utils
pkgname=python-${_base}
pkgver=0.15.0
pkgrel=1
pkgdesc="Drop-in replacement for Python UUID with bindings in Rust"
arch=('x86_64')
url="https://github.com/aminalaee/${_base}"
license=('BSD-3-Clause')
depends=('python' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-maturin')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
b2sums=('4e4601b4c0bf32884447c2f2df07ff844e5fd23429f2ab242c8ddd8ecf84f549481cb6b23a0a88d0a59b634809c4972da3f8671aa6c41f5476c76ba8a671ad19')

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
