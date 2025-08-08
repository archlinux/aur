pkgname=python-radexreader
pkgver=1.3.0
pkgrel=1
pkgdesc="Reader for the RADEX RD1212 and ONE Geiger counters"
arch=('any')
url='https://github.com/luigifab/python-radexreader'
license=('GPL2')
depends=('python-pyusb' 'python-pyserial')
makedepends=('python-setuptools')
source=("https://github.com/luigifab/python-radexreader/archive/v${pkgver}/python-radexreader-${pkgver}.tar.gz")
sha256sums=("6002e6a422a7a7d21c0043dd9fd4bbf0e52c220b3534864ea7d36135d2240068")

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's/radexreader-local /python3-radexreader-zst /g' src/radexreader-cli.py
  sed -i 's/\#\!\/usr\/bin\/python3/\#/g' src/radexreader/__init__.py
}

build() {
  cd "$pkgname-$pkgver/src"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver/src"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dpm 755 radexreader-cli.py "$pkgdir/usr/bin/radexreader"

  install -Dpm 644 ../data/radexreader.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dpm 644 ../data/radexreader.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dpm 644 ../data/radexreader.fr.1 "$pkgdir/usr/share/man/fr/man1/$pkgname.1"

  install -Dpm 644 ../scripts/debian/python3-radexreader.udev "$pkgdir/usr/lib/udev/rules.d/60-$pkgname.rules"

  install -Dpm 644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dpm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}