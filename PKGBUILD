# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-neutronclient' 'python2-neutronclient')
pkgver='6.7.0'
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
             'python-oslo-log' 'python2-oslo-log'
             'python-oslo-i18n' 'python2-oslo-i18n'
             'python-oslo-serialization' 'python2-oslo-serialization'
             'python-oslo-utils' 'python2-oslo-utils'
             'python-os-client-config' 'python2-os-client-config'
             'python-keystoneauth1' 'python2-keystoneauth1'
             'python-keystoneclient' 'python2-keystoneclient'
             'python-requests' 'python2-requests'
             'python-six' 'python2-six'
             'python-babel' 'python2-babel')
checkdepends=('python-pbr' 'python2-pbr'
              'python-mock' 'python2-mock'
              'python-requests-mock' 'python2-requests-mock'
              'python-testtools' 'python2-testtools'
              'python-oslotest' 'python2-oslotest'
              'python-osprofiler' 'python2-osprofiler'
              'python-tempest')
source=("git+https://git.openstack.org/openstack/${pkgname}#tag=${pkgver}")
sha512sums=('SKIP')

prepare() {
  sed -i '/simplejson/d' "${srcdir}/${pkgname}/requirements.txt"
  cp -a "${srcdir}/${pkgname}"{,-py2}
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build

  cd "${srcdir}/${pkgname}-py2"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${pkgname}"
  python setup.py testr

  cd "${srcdir}/${pkgname}-py2"
  PYTHON=python2 python2 setup.py testr
}

package_python-neutronclient() {
  depends=('python-pbr' 'python-cliff' 'python-debtcollector' 'python-iso8601'
           'python-netaddr' 'python-osc-lib' 'python-oslo-log'
           'python-oslo-i18n' 'python-oslo-serialization' 'python-oslo-utils'
           'python-os-client-config' 'python-keystoneauth1'
           'python-keystoneclient' 'python-requests'
           'python-six' 'python-babel')
  cd "${srcdir}/${pkgname}"
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
  cd "${srcdir}/python-neutronclient-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/neutron{,2}
  install -D --mode 644 "tools/neutron.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/neutron2"
  sed -i -e '/^complete/s/neutron$/neutron2/' -e 's/neutron bash-completion/neutron2 bash-completion/g' "${pkgdir}/usr/share/bash-completion/completions/neutron2"
}

# vim:set ts=2 sw=2 et:
