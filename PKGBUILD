# Maintainer: Andy Botting <andy@andybotting.com>

_module='shade'
pkgname=('python-shade' 'python2-shade')
pkgver='1.19.0'
pkgrel='2'
pkgdesc='Simple client library for interacting with OpenStack clouds'
arch=('any')
url="http://docs.openstack.org/infra/${_module}"
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-pbr' 'python2-pbr'
              'python-munch' 'python2-munch'
              'python2-decorator' 'python-decorator'
              'python-jmespath' 'python2-jmespath'
              'python-jsonpatch' 'python2-jsonpatch'
              'python2-ipaddress' 'python2-futures'
              'python-os-client-config' 'python2-os-client-config'
              'python-requestsexceptions' 'python2-requestsexceptions'
              'python-six' 'python2-six'
              'python-keystoneauth1' 'python2-keystoneauth1'
              'python-netifaces' 'python2-netifaces'
              'python-novaclient' 'python2-novaclient'
              'python-keystoneclient' 'python2-keystoneclient'
              'python-cinderclient' 'python2-cinderclient'
              'python-neutronclient' 'python2-neutronclient'
              'python-ironicclient' 'python2-ironicclient'
              'python-designateclient' 'python2-designateclient'
              'python-dogpile.cache' 'python2-dogpile.cache'
              'python-fixtures' 'python2-fixtures'
              'python-mock' 'python2-mock'
              'python-subunit' 'python2-subunit'
              'python-requests-mock' 'python2-requests-mock'
              'python-testtools' 'python2-testtools'
              'python-oslotest' 'python2-oslotest')
source=("git+https://git.openstack.org/openstack-infra/${_module}#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cp -a "${srcdir}/${_module}"{,-py2}
}   
    
build() {
  cd "${srcdir}/${_module}"
  # Fix test function name for Python 3
  sed -i 's/assertItemsEqual/assertCountEqual/g' shade/tests/unit/*.py
  python setup.py build

  cd "${srcdir}/${_module}-py2"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_module}"
  python setup.py testr

  cd "${srcdir}/${_module}-py2"
  PYTHON=python2 python2 setup.py testr
}

package_python-shade(){
  depends=('python-pbr' 'python2-decorator' 'python-jmespath'
           'python-jsonpatch' 'python-os-client-config'
           'python-requestsexceptions' 'python-six' 'python-keystoneauth1'
           'python-netifaces' 'python-novaclient' 'python-keystoneclient'
           'python-cinderclient' 'python-neutronclient' 'python-ironicclient'
           'python-designateclient' 'python-dogpile.cache')
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-shade() {
  depends=('python2-pbr' 'python2-decorator' 'python2-jmespath'
           'python2-jsonpatch' 'python2-ipaddress' 'python2-os-client-config'
           'python2-requestsexceptions' 'python2-six' 'python2-futures'
           'python2-keystoneauth1' 'python2-netifaces' 'python2-novaclient'
           'python2-keystoneclient' 'python2-cinderclient'
           'python2-neutronclient' 'python2-ironicclient'
           'python2-designateclient' 'python2-dogpile.cache')
  cd "${srcdir}/${_module}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/shade-inventory{,2}
}

# vim:set ts=2 sw=2 et:
