# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-neutronclient' 'python2-neutronclient')
pkgver='6.12.0'
pkgrel='1'
pkgdesc='Python client library for Neutron'
arch=('any')
url="https://docs.openstack.org/developer/${pkgname}/"
license=('Apache')
makedepends=('git' 'python-pbr' 'python2-pbr'
             'python-cliff' 'python2-cliff'
             'python-debtcollector' 'python2-debtcollector'
             'python-iso8601' 'python2-iso8601'
             'python-netaddr' 'python2-netaddr'
             'python-osc-lib' 'python2-osc-lib'
             'python-oslo-i18n' 'python2-oslo-i18n'
             'python-oslo-log' 'python2-oslo-log'
             'python-oslo-serialization' 'python2-oslo-serialization'
             'python-oslo-utils' 'python2-oslo-utils'
             'python-os-client-config' 'python2-os-client-config'
             'python-keystoneauth1' 'python2-keystoneauth1'
             'python-keystoneclient' 'python2-keystoneclient'
             'python-requests' 'python2-requests'
             'python-six' 'python2-six'
             'python-babel' 'python2-babel')
checkdepends=('python-mock' 'python2-mock'
              'python-oslotest' 'python2-oslotest'
              'python-osprofiler' 'python2-osprofiler'
              'python-openstackclient' 'python2-openstackclient'
              'python-requests-mock' 'python2-requests-mock'
              'python-testtools' 'python2-testtools'
              'python-tempest')
source=("https://github.com/openstack/${pkgname}/archive/${pkgver}.tar.gz"
        'skip-failing-py37-tests.patch')
sha512sums=('c3e49591c2fcea24a1de8316b5ca331eaf794654128532917561e95787d7a2b56b666e3865fa4064fd4363de410615c9f538e8206a673f1683070d20d3d16d90'
            '20e04c08e3eb37dc9f841ddeb276a26a4283de94d9aa803e6017f8f03b5771234e107743d8e839e4c51e392fccf6c812ebd695f5eabb849555f379c82a6f7dac')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i '/simplejson/d' requirements.txt
  patch -p1 -i "${srcdir}/skip-failing-py37-tests.patch"
  cp -a "${srcdir}/${pkgname}-${pkgver}"{,-py2}
  export PBR_VERSION=$pkgver
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${pkgname}-${pkgver}-py2"
  python2 setup.py build
}


check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  stestr run

  cd "${srcdir}/${pkgname}-${pkgver}-py2"
  PYTHON=python2 stestr2 run
}

package_python-neutronclient() {
  depends=('python-pbr' 'python-cliff' 'python-debtcollector' 'python-iso8601'
           'python-netaddr' 'python-osc-lib' 'python-oslo-log'
           'python-oslo-i18n' 'python-oslo-serialization' 'python-oslo-utils'
           'python-os-client-config' 'python-keystoneauth1'
           'python-keystoneclient' 'python-requests'
           'python-six' 'python-babel')
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D --mode 644 "tools/neutron.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/neutron"
}

package_python2-neutronclient() {
  depends=('python2-pbr' 'python2-cliff' 'python2-debtcollector' 'python2-iso8601'
           'python2-netaddr' 'python2-osc-lib' 'python-oslo-log'
           'python2-oslo-i18n' 'python2-oslo-serialization' 'python2-oslo-utils'
           'python2-os-client-config' 'python2-keystoneauth1'
           'python2-keystoneclient' 'python2-requests'
           'python2-six' 'python2-babel')
  cd "${srcdir}/python-neutronclient-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/neutron{,2}
  install -D --mode 644 "tools/neutron.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/neutron2"
  sed -i -e '/^complete/s/neutron$/neutron2/' -e 's/neutron bash-completion/neutron2 bash-completion/g' "${pkgdir}/usr/share/bash-completion/completions/neutron2"
}

# vim:set ts=2 sw=2 et:
