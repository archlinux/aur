# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-periphery
pkgname=(python-periphery python2-periphery)
pkgver=1.1.1
pkgrel=2
pkgdesc="A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux"
url="https://github.com/vsergeev/python-periphery"
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/vsergeev/python-periphery/archive/v$pkgver.tar.gz")
sha512sums=('5d453051fa204d17995f15f63305417d9702d3d344d96723bad56014bbcb32355763999ebc121c89816611c265010a76662bc1679652a4a5fbf88e4b8cb45b1a')

prepare() {
  cp -a python-periphery-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/python-periphery-$pkgver
  python setup.py build

  cd "$srcdir"/python-periphery-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/python-periphery-$pkgver
  python setup.py pytest || warning "Tests failed"

  cd "$srcdir"/python-periphery-$pkgver-py2
  python2 setup.py pytest || warning "Tests failed"
}

package_python-periphery() {
  depends=('python')

  cd python-periphery-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-periphery() {
  depends=('python2')

  cd python-periphery-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
