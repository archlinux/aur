# Maintainer: kpcyrd <git@rxv.cc>

pkgname=dhcpcanon
pkgver=0.8.5
pkgrel=3
pkgdesc='DHCP client disclosing less identifying information'
url='https://dhcpap.tech/'
license=('MIT')
arch=('any')
depends=('python-setuptools' 'python-attrs' 'python-dbus' 'python-netaddr' 'python-lockfile' 'python-pyroute2' 'python-scapy')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/juga0/dhcpcanon/archive/v${pkgver}.tar.gz")
sha512sums=('2ab42c16749f355727d82f9876350a61ef220a6ba3a45d4cbde84a8b484b26275089950872e5bf34ca9a022a866f8636fc5d91dd2755bf339b0c5a4e7b7f20be')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  PYTHONPATH=. py.test
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build

  install -Dm 755 sbin/dhcpcanon-script -t "${pkgdir}/usr/bin"
  install -Dm 644 systemd/dhcpcanon.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 systemd/network/90-dhcpcanon.link -t "${pkgdir}/usr/lib/systemd/network"
  install -Dm 644 tmpfiles.d/dhcpcanon.conf -t "${pkgdir}/usr/lib/tmpfiles.d"
  install -Dm 644 apparmor.d/sbin.dhcpcanon -t "${pkgdir}/etc/apparmor.d"

  install -Dm 644 man/dhcpcanon.8 man/dhcpcanon-script.8 -t "${pkgdir}/usr/share/man/man8"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
