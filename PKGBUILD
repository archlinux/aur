# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=snagboot
pkgver=1.0
pkgrel=3
pkgdesc='Generic recovery and reflashing tool for embedded platforms'
arch=(any)
url='https://github.com/bootlin/snagboot'
license=('GPL2')
depends=('dtc>=1.7.0'           # for pylibfdt
         'python>=3.8'
         'python-crccheck>=1.1' # relaxed from 1.3.0 because on the AUR it's not updated
         'python-hid>=1.0.4'    # pulls the required libhidapi
         'python-pyserial>=3.5'
         'python-pyusb>=1.2.1'
         'python-six>=1.16.0'
         'python-tftpy>=0.8.2'
         'python-xmodem>=0.4.6'
         'python-yaml>=6.0'
         'swig>=4.1.1')
makedepends=(python-build python-installer python-wheel)
install=$pkgname.install
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
        $pkgname.sysusers)
b2sums=('e8c0486b42fb31587ec9401ab4dd678d4649025ba943d2d2c8f59dd8da4dacd91e5b8edaa321a447a7fc44d345d2c4f68fc0d5939c31842302c8cdc7e73f2457'
        'f48705e2a98ec318e26a4a1f01bafabbd8ab74622c7209be9cbae34bb0ccc999d6581b0fa5c827ab7a8bd41d6f32d32c4a2ed642342279308362953018843138')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dt "$pkgdir/etc/udev/rules.d" src/snagrecover/80-snagboot.rules
}
