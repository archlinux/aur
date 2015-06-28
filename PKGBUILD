# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=cinder-kilo
pkgver=2015.1.0
pkgrel=2
pkgdesc="OpenStack Block Storage Service"
arch=(any)
install=cinder.install
url=https://launchpad.net/cinder
license=(custom)
depends=('python2-pbr>=0.6'
         'python2-pbr<1.0'
         'python2-anyjson>=0.3.3'
         'python2-babel>=1.3'
         'python2-eventlet>=0.16.1'
         'python2-greenlet>=0.3.2'
         'python2-iso8601>=0.1.9'
         'python2-keystonemiddleware-kilo'
         'python2-kombu>=2.5.0'
         'python2-lxml>=2.3'
         'python2-netaddr>=0.7.12'
         'python2-oslo-config-kilo'
         'python2-oslo-concurrency-kilo'
         'python2-oslo-context-kilo'
         'python2-oslo-db-kilo'
         'python2-oslo-log-kilo'
         'python2-oslo-messaging-kilo'
         'python2-oslo-middleware-kilo'
         'python2-oslo-rootwrap-kilo'
         'python2-oslo-serialization-kilo'
         'python2-oslo-utils-kilo'
         'python2-osprofiler>=0.3.0'
         'python2-paramiko>=1.13.0'
         'python2-paste'
         'python2-paste-deploy>=1.5.0'
         'python2-crypto>=2.6'
         'python2-pyparsing>=2.0.1'
         'python2-barbicanclient-kilo'
         'python2-glanceclient>=0.15.0'
         'python2-glanceclient<0.18.0'
         'python2-novaclient-kilo'
         'python2-swiftclient-kilo'
         'python2-requests>=2.2'
         'python2-retrying>=1.2.3'
         'python2-routes>=1.12.3'
         'python2-taskflow-kilo'
         'python2-rtslib-fb>=2.1.fb41'
         'python2-six>=1.9.0'
         'python2-sqlalchemy-kilo'
         'python2-migrate-kilo'
         'python2-stevedore-kilo'
         'python2-suds>=0.4'
         'python2-webob>=1.2.3'
         'python2-oslo-i18n-kilo'
         'python2-oslo-vmware-kilo')
makedepends=(python2-setuptools)
source=("https://launchpad.net/cinder/kilo/${pkgver}/+download/cinder-${pkgver}.tar.gz"
        "cinder-api.service"
        "cinder-volume.service"
        "cinder-scheduler.service"
        "cinder_sudoers"
       )
md5sums=('3f12ecbb934bb6f935b2f7fe177eddf1'
         'e06018fec46149db7c7e2e06d019bf60'
         'b2a5798bb63b8d12d958a0505405b20d'
         '1e96e2c0996d0d1340351b0d4eadcf96'
         '0ec0ec06bc4b2e886f9e33d11dfd8758')

build() {
    cd cinder-${pkgver}/
    python2 setup.py build
}

package() {
    cd cinder-${pkgver}/
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -d "${pkgdir}"/etc/
    cp -r etc/ "${pkgdir}"/
    install -d -m 0750 "${pkgdir}"/etc/sudoers.d/
    cp ${srcdir}/cinder_sudoers "${pkgdir}"/etc/sudoers.d/cinder_sudoers
#    mv "${pkgdir}"/etc/cinder/cinder.conf.sample "${pkgdir}"/etc/cinder/cinder.conf
    install -d -m 0770 ${pkgdir}/var/lib/cinder/
    install -d -m 0770 ${pkgdir}/var/log/cinder/
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/cinder/LICENSE
    install -D -m 644 ${srcdir}/cinder-api.service ${pkgdir}/usr/lib/systemd/system/cinder-api.service
    install -D -m 644 ${srcdir}/cinder-volume.service ${pkgdir}/usr/lib/systemd/system/cinder-volume.service
    install -D -m 644 ${srcdir}/cinder-scheduler.service ${pkgdir}/usr/lib/systemd/system/cinder-scheduler.service
}
