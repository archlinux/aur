# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=uuid-utils
pkgname=python-${_base}
pkgver=0.14.0
pkgrel=1
pkgdesc="Drop-in replacement for Python UUID with bindings in Rust"
arch=('any')
url="https://github.com/aminalaee/${_base}"
license=('BSD-3-Clause')
depends=('python' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-maturin')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
b2sums=('49cd33b5515a45b295f913e905ae01f0d72f2e3f6b29d24905b87216713c5446bbb62c8e2cd21daab5b1fdaeac2ee3585a8c5b4476f93970b5e267aa06294aaa')

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
