# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-troveclient' 'python2-troveclient')
pkgver='2.15.0'
pkgrel='1'
pkgdesc='Client library for OpenStack DBaaS API'
arch=('any')
url="http://docs.openstack.org/developer/${pkgname}"
license=('Apache')
makedepends=('git' 'python-pbr' 'python2-pbr'
             'python-prettytable' 'python2-prettytable'
             'python-requests' 'python2-requests'
             'python-oslo-i18n' 'python2-oslo-i18n'
             'python-oslo-utils' 'python2-oslo-utils'
             'python-babel' 'python2-babel'
             'python-keystoneauth1' 'python2-keystoneauth1'
             'python-six' 'python2-six'
             'python-swiftclient' 'python2-swiftclient'
             'python-mistralclient' 'python2-mistralclient'
             'python-openstackclient' 'python2-openstackclient'
             'python-osc-lib' 'python2-osc-lib')
checkdepends=('python-fixtures' 'python2-fixtures'
              'python-oslotest' 'python2-oslotest'
              'python-requests-mock' 'python2-requests-mock'
              'python-testtools' 'python2-testtools'
              'python-mock' 'python2-mock'
              'python-httplib2' 'python2-httplib2'
              'python-crypto' 'python2-crypto')
source=("git+https://git.openstack.org/openstack/${pkgname}#tag=${pkgver}"
        'trove.bash_completion')
sha512sums=('SKIP'
            '53a8603e7add596e847fcfcea9b454168956af581fb48794ab0ac08f6dce1d8c71ef47682e8b974bf184fc19e8473d362c75e9d70cd99d761ca7e113ea1f0ee9')

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

  # Test troveclient.tests.test_v1_shell.ShellTest.test_module_create failing for Python2
  #cd "${srcdir}/${pkgname}-py2"
  #PYTHON=python2 python2 setup.py testr
}

package_python-troveclient() {
  depends=('python-pbr' 'python-six' 'python-requests' 'python-swiftclient'
           'python-mistralclient' 'python-oslo-utils' 'python-oslo-i18n'
           'python-keystoneauth1' 'python-prettytable' 'python-babel')
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D --mode 644 "${srcdir}/trove.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/trove"
}

package_python2-troveclient() {
  depends=('python2-pbr' 'python2-six' 'python2-requests' 'python2-swiftclient'
           'python2-mistralclient' 'python2-oslo-utils' 'python2-oslo-i18n'
           'python2-keystoneauth1' 'python2-prettytable' 'python2-babel')
  cd "${srcdir}/python-troveclient-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/trove{,2}
  install -D --mode 644 "${srcdir}/trove.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/trove2"
  sed -i -e '/^complete/s/trove$/trove2/' -e 's/trove bash-completion/trove2 bash-completion/g' "${pkgdir}/usr/share/bash-completion/completions/trove2"
}

# vim:set ts=2 sw=2 et:
