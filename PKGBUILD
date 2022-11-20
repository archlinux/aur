# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-os-client-config
pkgver=2.1.0
pkgrel=7
arch=('any')
pkgdesc='OpenStack Client Configuation Library'
url='https://github.com/openstack/os-client-config'
license=('Apache')
depends=('python38-openstacksdk')
makedepends=('python38-setuptools')
checkdepends=('python38-stestr' 'python38-oslotest' 'python38-jsonschema'
              'python38-glanceclient')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openstack/os-client-config/archive/$pkgver.tar.gz")
sha512sums=('f019b5fa44a587bf853a931c9ee86a7e83c5f0d0319f2d5f75cfd34ce947f9961a7905e80df0c06f8234c9e36dc13bfcf039264243b57dd76874bfb3fd55d7bd')

export PBR_VERSION=$pkgver

prepare() {
  # FS#54781
  # https://bugs.launchpad.net/os-client-config/+bug/1707019
  sed -i "/^packages =/i package_data = os_client_config = *.json */*.json" os-client-config-$pkgver/setup.cfg

  sed -i 's/assertItemsEqual/assertCountEqual/' os-client-config-$pkgver/os_client_config/tests/test_config.py
}

build() {
  cd os-client-config-$pkgver
  python3.8 setup.py build
}

check() {
  cd os-client-config-$pkgver
  stestr run
}

package() {
  cd os-client-config-$pkgver
  python setup.py install --root "$pkgdir" --optimize=1
}
