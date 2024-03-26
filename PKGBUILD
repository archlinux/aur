# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name='flake8-polyfill'
pkgname="python-${_name}"
pkgver=1.0.2
pkgrel=2
pkgdesc="Polyfill package for Flake8 plugins"
url="https://github.com/PyCQA/${_name}"
depends=('flake8')
checkdepends=('python-pytest')
makedepends=(python-build python-installer python-wheel python-setuptools)
license=('LicenseRef-MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
    0001-fix-metadata.patch
    0002-fix-tests.patch
    0003-fix-mock.patch
)
sha256sums=('e44b087597f6da52ec6393a709e7108b2905317d0c0b744cdca6208e670d8eda'
            '8258d609f8da2fcd03a87a9ada781939d1a526f6747daff2ef12231b9a8c7999'
            '7723ba2cae2c187ae0e7f97b4782d7e39803beff6b8799e77f97c575b457ed3e'
            'a7f1f0db437cae2322e3a82afb21b1f67aee152b262fc4fe5ad8afa80d1635af')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  for i in ../*.patch; do
    patch -p1 -i "$i"
  done
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  PYTHONPATH=src:"$PYTHONPATH" python -m pytest tests
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

