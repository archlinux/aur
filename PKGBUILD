# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Co-Maintainer: Erik Fleckstein <erik at tinkerforge dot com>
# Contributor: tafli
# Contributor: maat

pkgname=brickv
pkgver=2.4.22
pkgrel=2
pkgdesc="testing/flashing tool for tinkerforge brick(let)s"
url="http://www.tinkerforge.com/"
license=("GPL2")
arch=('any')
depends=('python-pyserial' 'python-pyqt5' 'python-pytz' 'python-tzlocal')
optdepends=('brickd: local device support')
makedepends=('python-setuptools')
source=(https://github.com/Tinkerforge/${pkgname}/archive/v${pkgver}.zip
        0001-red-Handle-service-provider-country-codes-missing-in.patch)
sha256sums=('c09b27e10d2f3bce40d3fb6a3aa8a4bbde51d0b3a6fdc54ce41fca41869f7a72'
            'ccedb2964a304cb332fb96e705a4b6e4ab5b40623b019495b42d4ecb817c6dd1')

prepare() {
  patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/0001-red-Handle-service-provider-country-codes-missing-in.patch"
}

build() {
  cd $srcdir/$pkgname-$pkgver/src
  python build_src.py
}

package() {
  cd $srcdir/$pkgname-$pkgver/src
  python setup.py install --root=$pkgdir --prefix=/usr
  install -Dm755 $srcdir/$pkgname-$pkgver/src/build_data/linux/brickv/usr/share/applications/brickv.desktop $pkgdir/usr/share/applications/brickv.desktop
  install -Dm644 $srcdir/$pkgname-$pkgver/src/build_data/linux/brickv/usr/share/pixmaps/brickv-icon.png $pkgdir/usr/share/pixmaps/brickv-icon.png
  install -Dm644 $srcdir/$pkgname-$pkgver/src/build_data/linux/brickv/lib/udev/rules.d/99-tinkerforge-brickv.rules $pkgdir/usr/lib/udev/rules.d/99-tinkerforge-brickv.rules
}
