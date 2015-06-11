# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=cinder-icehouse
_pkgname=cinder
_relname=icehouse
pkgver=2014.1.3
pkgrel=1
pkgdesc="OpenStack Block Storage Service"
arch=(any)
install=cinder.install
url=https://launchpad.net/cinder
license=(custom)
depends=('python2-pbr>=0.6'
         'python2-pbr<1.0'
         'python2-amqplib>=0.6.1'
         'python2-anyjson>=0.3.3'
         'python2-argparse'
         'python2-babel>=1.3'
         'python2-eventlet>=0.13.0'
         'python2-greenlet>=0.3.2'
         'python2-iso8601>=0.1.9'
         'python2-kombu>=2.4.8'
         'python2-lxml>=2.3'
         'python2-netaddr>=0.7.6'
         'python2-oslo-config>=1.2.0'
         'python2-oslo-messaging>=1.3.0'
         'python2-oslo-rootwrap'
         'python2-paramiko>=1.9.0'
         'python2-paste'
         'python2-paste-deploy>=1.5.0'
         'python2-glanceclient-openstack>=0.9.0'
         'python2-keystoneclient>=0.7.0'
         'python2-novaclient>=2.17.0'
         'python2-swiftclient>=1.6'
         'python2-requests>=1.1'
         'python2-routes>=1.12.3'
         'python2-taskflow>=0.1.3'
         'python2-taskflow<0.2'
         'python2-rtslib-fb>=2.1.fb39'
         'python2-six>=1.6.0'
         'python2-sqlalchemy>=0.7.8'
         'python2-sqlalchemy<0.9.99'
         'python2-migrate-icehouse>=0.8.2'
         'python2-stevedore>=0.14'
         'python2-suds>=0.4'
         'python2-webob>=1.2.3'
         'python2-wsgiref>=0.1.2')
makedepends=(python2-setuptools)
source=("https://launchpad.net/cinder/${_relname}/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz"
        "cinder-api.service"
        "cinder-volume.service"
        "cinder-scheduler.service"
        "cinder_sudoers"
       )
md5sums=('ac9e423fff77786c2400a15fc11308ec'
         'e06018fec46149db7c7e2e06d019bf60'
         'b2a5798bb63b8d12d958a0505405b20d'
         '1e96e2c0996d0d1340351b0d4eadcf96'
         '0ec0ec06bc4b2e886f9e33d11dfd8758')

build() {
    cd ${_pkgname}-${pkgver}/
    python2 setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}/
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -d "${pkgdir}"/etc/
    cp -r etc/ "${pkgdir}"/
    install -d -m 0750 "${pkgdir}"/etc/sudoers.d/
    cp ${srcdir}/cinder_sudoers "${pkgdir}"/etc/sudoers.d/cinder_sudoers
    mv "${pkgdir}"/etc/cinder/cinder.conf.sample "${pkgdir}"/etc/cinder/cinder.conf
    install -d -m 0770 ${pkgdir}/var/lib/cinder/
    install -d -m 0770 ${pkgdir}/var/log/cinder/
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
    install -D -m 644 ${srcdir}/cinder-api.service ${pkgdir}/usr/lib/systemd/system/cinder-api.service
    install -D -m 644 ${srcdir}/cinder-volume.service ${pkgdir}/usr/lib/systemd/system/cinder-volume.service
    install -D -m 644 ${srcdir}/cinder-scheduler.service ${pkgdir}/usr/lib/systemd/system/cinder-scheduler.service
}
