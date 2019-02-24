# Maintainer: Andy Botting <andy@andybotting.com>
_module='osprofiler'
pkgname=('python-osprofiler' 'python2-osprofiler')
pkgver='2.6.0'
pkgrel='1'
pkgdesc='Library for cross-project profiling library'
arch=('any')
url="https://docs.openstack.org/developer/${_module}/"
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools'
             'python-six' 'python2-six'
             'python-oslo-utils' 'python2-oslo-utils'
             'python-webob' 'python2-webob'
             'python-requests' 'python2-requests'
             'python-netaddr' 'python2-netaddr'
             'python-oslo-concurrency' 'python2-oslo-concurrency'
             'python-oslo-serialization' 'python2-oslo-serialization'
             'python-prettytable' 'python2-prettytable')
checkdepends=('python-mock' 'python2-mock'
              'python-stestr' 'python2-stestr'
              'python-ddt' 'python2-ddt'
              'python-testrepository' 'python2-testrepository'
              'python-testtools' 'python2-testtools'
              'python-elasticsearch' 'python2-elasticsearch'
              'python-pymongo' 'python2-pymongo'
              'python-redis' 'python2-redis'
              'python-docutils' 'python2-docutils'
              'bandit')
source=("https://github.com/openstack/${_module}/archive/${pkgver}.tar.gz")
sha512sums=('d72256a61ec8f4d486b3d95a318dc653d728172806e97f726194945c042d9a1d9691eb492828d3d599eff59d43bb1f3d22f18868889947387156f3fde4e5bd76')

prepare() {
  # Remove tests for Jaeger client - no package for it available
  rm "${srcdir}/${_module}-${pkgver}/osprofiler/tests/unit/drivers/test_jaeger.py"
  cp -a "${srcdir}/${_module}-${pkgver}"{,-py2}
  export PBR_VERSION=$pkgver
}

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_module}-${pkgver}-py2"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_module}-${pkgver}"
  stestr run

  cd "${srcdir}/${_module}-${pkgver}-py2"
  stestr2 run
}

package_python-osprofiler() {
  depends=('python-six' 'python-oslo-utils' 'python-webob' 'python-requests'
           'python-netaddr' 'python-oslo-concurrency' 'python-oslo-serialization'
           'python-prettytable')
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-osprofiler() {
  depends=('python2-six' 'python2-oslo-utils' 'python2-webob' 'python2-requests'
           'python2-netaddr' 'python2-oslo-concurrency' 'python2-oslo-serialization'
           'python2-prettytable')
  cd "${srcdir}/${_module}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}"/usr/bin/osprofiler{,2}
}

# vim:set ts=2 sw=2 et:
