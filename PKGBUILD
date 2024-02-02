pkgname=python-radexreader
pkgver=1.2.4
pkgrel=1
pkgdesc="Reader for the RADEX RD1212 and ONE Geiger counters"
arch=('any')
url='https://github.com/luigifab/python-radexreader'
license=('GPL2')
depends=('python-pyusb' 'python-pyserial')
makedepends=('python-setuptools')
source=("https://github.com/luigifab/python-radexreader/archive/v${pkgver}/python-radexreader-${pkgver}.tar.gz")
md5sums=("b49e82f2944d0cd5613730b8bdb4ae35")

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's/python3-radexreader /python3-radexreader-zst /g' src/radexreader.py
  sed -i 's/\#\!\/usr\/bin\/python3/\#/g' src/radexreader/__init__.py
}

build() {
  cd "$pkgname-$pkgver/src"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver/src"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  mkdir -p "$pkgdir/usr/bin/"
  install -pm 755 radexreader.py "$pkgdir/usr/bin/"

  mkdir -p "$pkgdir/usr/share/doc/$pkgname/"
  install -pm 644 ../README.md "$pkgdir/usr/share/doc/$pkgname/"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  install -pm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/"

  mkdir -p "$pkgdir/usr/share/man/man1/" "$pkgdir/usr/share/man/fr/man1/"
  install -pm 644 ../debian/radexreader.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -pm 644 ../debian/radexreader.fr.1 "$pkgdir/usr/share/man/fr/man1/$pkgname.1"

  mkdir -p "$pkgdir/usr/lib/udev/rules.d/"
  install -pm 644 ../debian/udev "$pkgdir/usr/lib/udev/rules.d/60-$pkgname.rules"
}