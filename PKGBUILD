# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgbase=keystone-kilo
pkgname=('keystone-kilo' 'python2-keystone-kilo')
pkgver=2015.1.0
pkgrel=1
arch=(any)
url="https://launchpad.net/keystone/"
license=('Apache')
# makedepends=('python2-setuptools' 'python2-sphinx' 'python2-oslosphinx')
makedepends=('python2-setuptools')
pkgdesc="OpenStack Identity"
source=("https://launchpad.net/keystone/kilo/$pkgver/+download/keystone-$pkgver.tar.gz"
        "keystone.service")
md5sums=('8f0794ce2e8f15561f188278919ade4f'
         '4af52db88c8a5ca56ae26aefcd1c4828')

build() {
  cd "keystone-$pkgver"
  /usr/bin/python2 setup.py build
  /usr/bin/python2 setup.py install --root="$srcdir/tmp" --install-data="/" --optimize=1
  cp -R etc/ $srcdir/tmp/
}

package_keystone-kilo() {
  pkgdesc+=" - Daemon"
  depends=('python2-keystone-kilo')
  install=keystone.install
  conflicts=('keystone' 'keystone-havana' 'keystone-icehouse')
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

package_python2-keystone-kilo() {
  pkgdesc+=" - Python library"
  depends=('python2-pbr'
           'python2-webob'
           'python2-eventlet'
           'python2-greenlet'
           'python2-netaddr'
           'python2-paste-deploy'
           'python2-paste'
           'python2-routes'
           'python2-cryptography'
           'python2-six'
           'python2-sqlalchemy-kilo'
           'python2-migrate-kilo'
           'python2-passlib'
           'python2-iso8601'
           'python2-keystoneclient-kilo'
           'python2-keystonemiddleware-kilo'
           'python2-oslo-concurrency-kilo'
           'python2-oslo-config'
           'python2-oslo-messaging-kilo'
           'python2-oslo-db-kilo'
           'python2-oslo-i18n-kilo'
           'python2-oslo-log-kilo'
           'python2-oslo-middleware-kilo'
           'python2-oslo-policy-kilo'
           'python2-oslo-serialization-kilo'
           'python2-oslo-utils-kilo'
           'python2-oauthlib'
           'python2-pysaml2'
           'python2-dogpile-cache>=0.5.0'
           'python2-jsonschema'
           'python2-pycadf'
           'python2-posix_ipc'
           'python2-msgpack')
  conflicts=('python2-keystone' 'python2-keystone-havana' 'python2-keystone-kilo')

  cd tmp
  install -d ${pkgdir}/usr/lib/
  cp -R usr/lib/ ${pkgdir}/usr/
}
