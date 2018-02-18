# Maintainer: kpcyrd <git@rxv.cc>

pkgname=dhcpcanon
pkgver=0.8.2
pkgrel=1
pkgdesc='DHCP client disclosing less identifying information'
url='https://dhcpcanon.readthedocs.io'
license=('MIT')
arch=('any')
depends=('python-setuptools' 'python-attrs' 'python-dbus' 'python-netaddr' 'python-lockfile' 'python-pyroute2' 'scapy3k')
checkdepends=('python-pytest')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/juga0/dhcpcanon/archive/v${pkgver}.tar.gz)
sha512sums=('2772d0235f74b426ea7e089437fb65f1403162d30b9e484e4275c9b288179b008532c5b976e105444c733f8779b12a9504cee2423afcba7ea0e2f9d40dbf97a5')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd ${pkgname}-${pkgver}
  py.test
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build

  install -Dm 755 sbin/dhcpcanon-script -t "${pkgdir}/usr/bin"
  install -Dm 644 systemd/dhcpcanon.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 systemd/network/90-dhcpcanon.link -t "${pkgdir}/lib/systemd/network"
  install -Dm 644 tmpfiles.d/dhcpcanon.conf -t "${pkgdir}/usr/lib/tmpfiles.d"
  install -Dm 644 apparmor.d/sbin.dhcpcanon -t "${pkgdir}/etc/apparmor.d"

  install -Dm 644 man/dhcpcanon.8 man/dhcpcanon-script.8 -t "${pkgdir}/usr/share/man/man8"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE "/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
