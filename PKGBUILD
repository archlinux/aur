# Maintainer: Christopher Arndt <chris at chrisarndt.de>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>

pkgname=adafruit-ampy
pkgver=1.1.0
pkgrel=2
pkgdesc='Utility to interact with a CircuitPython or MicroPython board over a serial connection'
url='https://github.com/scientifichackers/ampy'
arch=(any)
license=(MIT)
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=(python-click python-pyserial python-dotenv)
provides=(python-ampy ampy)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        'adafruit-ampy-regex.patch'
        'adafruit-ampy-setup.patch')
sha256sums=('f4cba36f564096f2aafd173f7fbabb845365cc3bb3f41c37541edf98b58d3976'
            '2020be0e4514442a2f79aca5e294f887cd283d0b4398124a87406146b47abb47'
            '9353674a6685230c59d3333a21336a04dfd9c6c495a38da8453cd38aad9f7214')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -N -r - -i "$srcdir"/adafruit-ampy-regex.patch
  patch -p1 -N -r - -i "$srcdir"/adafruit-ampy-setup.patch
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  # install documentation
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  # install license
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
