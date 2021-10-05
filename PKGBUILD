# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-shade
pkgver=1.33.0
pkgrel=1
pkgdesc='Simple client library for interacting with OpenStack clouds'
arch=('any')
url='http://docs.openstack.org/shade/'
license=('Apache')
depends=('python-pbr' 'python-jmespath'
         'python-jsonpatch' 'python-os-client-config'
         'python-requestsexceptions' 'python-six' 'python-keystoneauth1'
         'python-netifaces' 'python-novaclient' 'python-keystoneclient'
         'python-cinderclient' 'python-neutronclient' 'python-ironicclient'
         'python-designateclient' 'python-dogpile.cache')
checkdepends=('python-dogpile.cache' 'python-future' 'python-fixtures'
              'python-mock' 'python-subunit' 'python-requests-mock'
              'python-testtools' 'python-stestr' 'python-oslotest')
source=("https://github.com/openstack/shade/archive/$pkgver.tar.gz")
sha512sums=('dda29a5cbe41a2dc1641accdca66d80fd2afb58855ae3a9d99fb11a5b3407fa3afe7b5a8dc04150526050ff968f117202150330133a894553a51844a375f8c1f')

export PBR_VERSION=$pkgver

prepare() {
  # Fix test function name
  cd shade-$pkgver
  sed -i 's/assertItemsEqual/assertCountEqual/g' shade/tests/unit/*.py
  rm shade/tests/unit/test_caching.py
}   
    
build() {
  cd shade-$pkgver
  # Fix TypeError: a bytes-like object is required, not 'str' for Python 3
  sed -i 's/base64.b64encode(user_data)/base64.b64encode(user_data.encode())/g' shade/tests/unit/test_create_server.py
  python setup.py build
}

check() {
  cd shade-$pkgver
  stestr run
}

package(){
  cd shade-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
