# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litex
pkgname=python-$_pkgname
pkgver=2020.08
pkgrel=4
pkgdesc='Migen/MiSoC based Core/SoC builder that provides the infrastructure to easily create Cores/SoCs'
arch=('any')
url='https://github.com/enjoy-digital/litex'
license=('BSD')
depends=('python-migen' 'python-pyserial' 'python-requests' 'python-pythondata-software-compiler_rt')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-litedram' 'python-liteeth' 'python-liteiclink' 'python-litesdcard' 'yosys'
              'python-pythondata-cpu-vexriscv' 'python-pythondata-cpu-picorv32' 'python-pythondata-cpu-lm32' 'python-pythondata-cpu-mor1kx')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('cf31408805947f13ae149b861e37882b809aadc8444a9a4dca0d63787721902188914e286feb3d911ff8d9893c4e51a97c00c32ea8126a71348b1ed5ae7c8552')

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
