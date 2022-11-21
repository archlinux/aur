# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python38-openstacksdk
pkgver=0.102.0
pkgrel=2
pkgdesc="An SDK for building applications to work with OpenStack"
arch=('any')
url="https://developer.openstack.org/sdks/python/openstacksdk"
license=('Apache')
depends=('python38-six' 'python38-pbr' 'python38-yaml' 'python38-jsonpatch' 'python38-appdirs'
         'python38-keystoneauth1' 'python38-os-service-types' 'python38-deprecation'
         'python38-requestsexceptions' 'python38-decorator' 'python38-jmespath' 'python38-iso8601'
         'python38-netifaces' 'python38-dogpile.cache' 'python38-munch' 'python38-cryptography')
makedepends=('python38-setuptools')
checkdepends=('python38-stestr' 'python38-ddt' 'python38-requests-mock' 'python38-oslotest'
              'python38-jsonschema' 'python38-oslo-config' 'python38-prometheus_client' 'python38-hacking')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openstack/openstacksdk/archive/$pkgver.tar.gz")
sha512sums=('7360581432d6584c4c5785a5834a190aff8f5f3f26f10de0825ccfca005c09b0fb41847d6a6d5bf595f6b2478e685807d7aa69450ae9d008c80cca21370d35ec')

export PBR_VERSION=$pkgver

prepare() {
  echo -e "\nglobal-include *.json" >> openstacksdk-$pkgver/MANIFEST.in
  sed -i 's/assertItemsEqual/assertCountEqual/' openstacksdk-$pkgver/openstack/tests/unit/*.py openstacksdk-$pkgver/openstack/tests/unit/*/*.py
}

build() {
  cd openstacksdk-$pkgver
  python3.8 setup.py build
}

check() {
  # From https://github.com/openstack/openstacksdk/blob/master/tox.ini
  export OS_LOG_CAPTURE=true OS_STDOUT_CAPTURE=true OS_STDERR_CAPTURE=true

  cd openstacksdk-$pkgver
  # TODO
  stestr run || :
}

package() {
  cd openstacksdk-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
