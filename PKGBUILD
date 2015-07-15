# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=brickv
pkgver=2.2.5
pkgrel=1
pkgdesc="brick viewer is a testing/flashing tool for tinkerforge brick(let)s"
url="http://www.tinkerforge.com/"
license=("GPL2")
arch=('i686' 'x86_64' 'armv7h')
depends=('pyqwt' 'python2-pyserial' 'brickd' 'python-pyqt4' 'python2-setuptools')
optdepends=('brickd')
source=(https://github.com/Tinkerforge/${pkgname}/archive/v${pkgver}.zip)
md5sums=('d972923d6d68643ac5a111deee38b8b9')

build() {
  cd $srcdir/$pkgname-$pkgver/src/
  find . -type f -name '*py' -exec sed -i 's%/usr/bin/env python%&2%' '{}' \;
  find . -type f -exec sed -i 's%pyuic4%python2-&%' '{}' \;
  find . -type f -exec sed -i 's%system("python %system("python2 %' '{}' \;
  python2 setup.py config
  python2 setup.py build
  cd brickv/plugin_system/plugins
  for i in */build_ui.py; do cd $(dirname $i); python2 ./build_ui.py; cd ..; done
  cd ../..
  python2 ./build_ui.py
}

package() {
  cd $srcdir/$pkgname-$pkgver/src/
  python2 setup.py install --root=$pkgdir --prefix=/usr
}
