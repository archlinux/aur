# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgbase=keystone-liberty
pkgname=('keystone-liberty' 'python2-keystone-liberty')
pkgver=8.0.0.0b1
pkgrel=1
osseries=liberty-1
arch=(any)
url="https://launchpad.net/keystone/"
license=('Apache')
# makedepends=('python2-setuptools' 'python2-sphinx' 'python2-oslosphinx')
makedepends=('python2-setuptools')
pkgdesc="OpenStack Identity"
source=("https://launchpad.net/keystone/liberty/$osseries/+download/keystone-$pkgver.tar.gz"
        "keystone.service")
md5sums=('31523f3b4003aecb13ecafd838fda0e5'
         '4af52db88c8a5ca56ae26aefcd1c4828')

build() {
  cd "keystone-$pkgver"
  /usr/bin/python2 setup.py build
  /usr/bin/python2 setup.py install --root="$srcdir/tmp" --install-data="/" --optimize=1
  cp -R etc/ $srcdir/tmp/
}

package_keystone-liberty() {
  pkgdesc+=" - Daemon"
  depends=('python2-keystone-liberty')
  install=keystone.install
  conflicts=('keystone' 'keystone-havana' 'keystone-icehouse' 'keystone-kilo')
  backup=('etc/keystone/keystone.conf')
  cd tmp
  install -d ${pkgdir}/etc/keystone/
  install -m 644 etc/default_catalog.templates ${pkgdir}/etc/keystone/default_catalog.templates
  install -m 644 etc/keystone.conf.sample ${pkgdir}/etc/keystone/keystone.conf
  install -m 644 etc/keystone-paste.ini ${pkgdir}/etc/keystone/
  install -m 644 etc/logging.conf.sample ${pkgdir}/etc/keystone/logging.conf
  install -m 644 etc/policy.json ${pkgdir}/etc/keystone/
  install -m 644 etc/policy.v3cloudsample.json ${pkgdir}/etc/keystone/
  install -d ${pkgdir}/usr/bin/
  install -m 755 usr/bin/keystone-all ${pkgdir}/usr/bin/
  install -m 755 usr/bin/keystone-manage ${pkgdir}/usr/bin/
  install -d ${pkgdir}/usr/share/man/man1/
  install -D -m 644 ${srcdir}/keystone.service ${pkgdir}/usr/lib/systemd/system/keystone.service
  install -d -m 0770 ${pkgdir}/var/lib/keystone/
  install -d -m 0770 ${pkgdir}/var/log/keystone/
}

package_python2-keystone-liberty() {
  pkgdesc+=" - Python library"
  depends=('python2-pbr>=0.11'
           'python2-webob>=1.2.3'
           'python2-eventlet>=0.17.3'
           'python2-greenlet>=0.3.2'
#           'python2-netaddr'
           'python2-paste-deploy>=1.5.0'
           'python2-paste'
           'python2-routes>=1.12.3'
           'python2-cryptography>=0.8.2'
           'python2-six>=1.9.0'
           'python2-sqlalchemy-openstack'
           'python2-migrate-openstack'
           'python2-stevedore-openstack'
           'python2-passlib'
#           'python2-iso8601'
           'python2-keystoneclient-liberty'
           'python2-keystonemiddleware-liberty'
           'python2-oslo-concurrency-liberty'
           'python2-oslo-config-liberty'
           'python2-oslo-messaging-liberty'
           'python2-oslo-db-liberty'
           'python2-oslo-i18n-liberty'
           'python2-oslo-log-liberty'
           'python2-oslo-middleware-liberty'
           'python2-oslo-policy-liberty'
           'python2-oslo-serialization-liberty'
           'python2-oslo-utils-liberty'
           'python2-oauthlib>=0.6'
           'python2-pysaml2>=2.4.0'
           'python2-dogpile-cache>=0.5.3'
           'python2-jsonschema'
           'python2-pycadf>=0.8.0'
#           'python2-posix_ipc'
           'python2-msgpack>=0.4.0'
           'python2-debtcollector'
           )
  conflicts=('python2-keystone' 'python2-keystone-havana' 'python2-keystone-icehouse' 'python2-keystone-kilo')

  cd tmp
  install -d ${pkgdir}/usr/lib/
  cp -R usr/lib/ ${pkgdir}/usr/
}
