# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgbase=keystone-icehouse
pkgname=('keystone-icehouse' 'python2-keystone-icehouse')
pkgver=2014.1.3
pkgrel=1
arch=(any)
url="https://launchpad.net/keystone/"
license=('Apache')
makedepends=('python2-setuptools' 'python2-sphinx' 'python2-oslosphinx')
pkgdesc="OpenStack Identity"
depends=('python2' 'python2-setuptools')
source=("https://launchpad.net/keystone/icehouse/$pkgver/+download/keystone-$pkgver.tar.gz"
        "keystone.service")
md5sums=('7cf290976596515474e9af64f8167fb0'
         '4af52db88c8a5ca56ae26aefcd1c4828')

build() {
  cd "keystone-$pkgver"
  /usr/bin/python2 setup.py build
  /usr/bin/python2 setup.py install --root="$srcdir/tmp" --install-data="/" --optimize=1
  cp -R etc/ $srcdir/tmp/
}

package_keystone-icehouse() {
  pkgdesc+=" - Daemon"
  depends=('python2-keystone-icehouse')
  install=keystone.install
  conflicts=('keystone' 'keystone-havana')
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

package_python2-keystone-icehouse() {
  pkgdesc+=" - Python library"
  depends=('python2-pbr>=0.6'
           'python2-pbr<1.0'
           'python2-webob>=1.2.3'
           'python2-eventlet>=0.13.0'
           'python2-greenlet>=0.3.2'
           'python2-netaddr>=0.7.6'
           'python2-paste-deploy>=1.5.0'
           'python2-paste'
           'python2-routes>=1.12.3'
           'python2-six>=1.6.0'
           'python2-sqlalchemy>=0.7.8'
           'python2-sqlalchemy<0.9.99'
           'python2-migrate-icehouse>=0.8.2'
           'python2-passlib'
           'python2-lxml>=2.3'
           'python2-iso8601>=0.1.9'
           'python2-keystoneclient>=0.7.0'
           'python2-oslo-config>=1.2.0'
           'python2-oslo-messaging>=1.3.0'
	   'python2-babel>=1.3'
           'python2-oauthlib>=0.6'
           'python2-dogpile-cache>=0.5.0'
           'python2-jsonschema>=2.0.0'
           'python2-jsonschema<3.0.0'
           'python2-pycadf>=0.4.1'
           'python2-pam'
           'python2-anyjson'
           'python2-kombu'
           'python2-amqp'
           'python2-amqplib')
  optdepends=('python2-pysqlite: optional backend'
              'python2-memcached>=1.48: optional backend'
              'python2-ldap=2.3.13: optional backend')
  conflicts=('python2-keystone' 'python2-keystone-havana')

  cd tmp
  install -d ${pkgdir}/usr/lib/
  cp -R usr/lib/ ${pkgdir}/usr/
}
