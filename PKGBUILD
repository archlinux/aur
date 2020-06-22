# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-neutronclient
pkgver=7.2.0
pkgrel=1
pkgdesc='Python client library for Neutron'
arch=('any')
url="https://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-pbr' 'python-cliff' 'python-debtcollector' 'python-iso8601'
         'python-netaddr' 'python-osc-lib' 'python-oslo-log'
         'python-oslo-i18n' 'python-oslo-serialization' 'python-oslo-utils'
         'python-os-client-config' 'python-keystoneauth1'
         'python-keystoneclient' 'python-requests'
         'python-six' 'python-babel')
checkdepends=('python-mock' 'python-oslotest' 'python-osprofiler'
              'python-openstackclient' 'python-requests-mock'
              'python-testtools' 'python-tempest')
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz"
        'skip-failing-py37-tests.patch')
sha512sums=('ba7776421c1102ff057fcf2017eb76cb3a15fb8946b509281d893906aa4685da164bf846a5ebe7a25d1546b3fc4ab6ca10a2c02cd1d39f4595aee8b611360fe6'
            'b1dde9fe60d8e47335984f350b01116d3d477aa7108790ca14ffc5d6e7f11180f202e2b59985ce05e4dff788f167c7a094361b5e823f5038d70a955b5ad84b2e')

export PBR_VERSION=$pkgver

prepare() {
  cd $pkgname-$pkgver
  sed -i '/simplejson/d' requirements.txt
  patch -p1 -i "${srcdir}/skip-failing-py37-tests.patch"
}

build() {
  cd $pkgname-$pkgver
  python setup.py build
}


check() {
  cd $pkgname-$pkgver
  stestr run
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D --mode 644 "tools/neutron.bash_completion" $pkgdir/usr/share/bash-completion/completions/neutron
}

# vim:set ts=2 sw=2 et:
