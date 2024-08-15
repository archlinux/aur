# Maintainer: yznnyz <yzniu1@gmail.com>


modulename=csiread
pkgname=python-$modulename
pkgver=1.4.0
pkgrel=2
pkgdesc='A fast channel state information parser for Intel, Atheros, Nexmon, ESP32 and PicoScenes in Python.'
arch=('any')
url="https://github.com/citysu/csiread/"
license=('MIT')
depends=('python' 'cython' 'python-numpy')
makedepends=('python-setuptools' 'python-wheel' 'unzip')
source=("${pkgname}-${pkgver}.zip::https://github.com/citysu/csiread/archive/refs/tags/v${pkgver}.zip"
        "https://raw.githubusercontent.com/citysu/csiread/master/LICENSE.md")
md5sums=('a74b3aa3269902092fae13176ec89a1a'
         '6f56dd182bd6079686774e1dc6eecdf4')


package() {
  cd ${srcdir}
  unzip -o ${pkgname}-${pkgver}.zip
  cd ./${modulename}-${pkgver}
  sed -i "s/np.int_t/long/g" ./csiread/_csiread.pxd
  sed -i '163,230d' ./csiread/_csiread.pxd
  sed -i "s/np.complex_/np.complex128/g" ./csiread/_csiread.pyx
  sed -i '834,1269d' ./csiread/_csiread.pyx
  sed -i "s/from .core import (Intel, Atheros, Nexmon, AtherosPull10, NexmonPull46,/from .core import (Intel, Atheros, AtherosPull10,/g" ./csiread/__init__.py
  sed -i "s/NexmonPull256, ESP32, Picoscenes)/ESP32, Picoscenes)/g" ./csiread/__init__.py
  sed -i '707,791d' ./csiread/core.py
  sed -i '501,684d' ./csiread/core.py
  python setup.py sdist bdist_wheel
  python -m installer --destdir="$pkgdir" ./dist/*.whl
  cd ..
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
