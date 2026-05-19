# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>

_base=uuid-utils
pkgname=python-${_base}
pkgver=0.16.0
pkgrel=1
pkgdesc="Drop-in replacement for Python UUID with bindings in Rust"
arch=('x86_64')
url="https://github.com/aminalaee/${_base}"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc' 'python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-maturin')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
b2sums=('71f49ae946299bc4f0eb0e4b8a3eb53fd485d58809f8af8e0595d8c7eddee42aa6e8f25aa387e9c90c44b99d3dc16ac99fa820f0b3605bbdf9930f5228316b04')

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
