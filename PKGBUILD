# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litex
pkgname=python-$_pkgname
pkgver=2020.12
pkgrel=1
pkgdesc='Migen/MiSoC based Core/SoC builder that provides the infrastructure to easily create Cores/SoCs'
arch=('any')
url='https://github.com/enjoy-digital/litex'
license=('BSD')
depends=('python-migen' 'python-pyserial' 'python-requests' 'python-pythondata-software-compiler_rt')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-litedram' 'python-liteeth' 'python-liteiclink' 'python-litesdcard' 'yosys'
              'python-pythondata-cpu-vexriscv' 'python-pythondata-cpu-picorv32' 'python-pythondata-cpu-lm32' 'python-pythondata-cpu-mor1kx')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('144a1ef81afcb0e762853a48d1b8d248ad414d159ae6ea659f7b6a6538c75d3cfb38238aea40572ce2a787fb183af10fe63ca4842e7e5b4761817916b8404344')

prepare() {
  # seems like running the tests breaks setup.py install
  cp -r $_pkgname-$pkgver{,-tests}
}

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

check() {
  cd $_pkgname-$pkgver-tests

  pytest -k-test_variants_minerva
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
