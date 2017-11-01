# Maintainer: kpcyrd <git@rxv.cc>

pkgname=dhcpcanon
pkgver=0.8.0
pkgrel=1
pkgdesc='DHCP client disclosing less identifying information'
url='https://dhcpcanon.readthedocs.io'
license=('MIT')
arch=('any')
depends=('python-setuptools' 'python-attrs' 'python-dbus' 'python-netaddr' 'python-lockfile' 'python-pyroute2' 'scapy' 'scapy3k')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/juga0/dhcpcanon/archive/v${pkgver}.tar.gz)
sha512sums=('44b08c861e7195da6ac04fb2fbfc0bca47aef1462bc46ddfb857048289817af0a09d1fe5171528d050dd3d3d78e7b7c8d63b9743051e7da7fa14859d9b632673')

build() {
    cd ${pkgname}-${pkgver}
    python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build

  install -Dm 755 sbin/dhcpcanon-script -t "${pkgdir}/usr/sbin"
  install -Dm 644 systemd/dhcpcanon.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 systemd/network/90-dhcpcanon.link -t "${pkgdir}/lib/systemd/network"
  install -Dm 644 tmpfiles.d/dhcpcanon.conf -t "${pkgdir}/usr/lib/tmpfiles.d"
  install -Dm 644 apparmor.d/sbin.dhcpcanon -t "${pkgdir}/etc/apparmor.d"

  install -Dm 644 man/dhcpcanon.8 man/dhcpcanon-script.8 -t "${pkgdir}/usr/share/man/man8"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

}

# vim: ts=2 sw=2 et:
