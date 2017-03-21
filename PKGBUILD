#Maintainer: Jan Koppe <post@jankoppe.de>
pkgname=pyca
pkgver=2.0
pkgrel=2
pkgdesc="Python Capture Agent for Opencast"
arch=('any')
url="https://github.com/opencast/pyCA"
license=('LGPL')
depends=('gnutls' 'python-dateutil' 'python-configobj' 'python-flask' 'python-pycurl' 'python-sqlalchemy')
optdepends=('gunicorn: wsgi web interface')
source=("https://github.com/opencast/pyCA/archive/v$pkgver.tar.gz"
        "pyca.install"
        "pyca@.service"
        "pycaui.service"
        "pyca.target")
install="pyca.install"
md5sums=("f685b7a77934cc5faea6d53003b18ecf"
         "d16c4e1a394f0cf356f65555e8cb0334"
         "10481ad2e93cac66ed5086b82b7627af"
         "8d7c9144827127d4bb7f65958dbd7683"
         "d411287de5dcc0e1ff6d8de5350918eb")

prepare() {
  cd pyCA-"${pkgver}"

  # Change default locations for recordings and the internal sqlite database
  sed -i 's/directory\s*=.*/directory = \/var\/lib\/pyca\/recordings\//' etc/pyca.conf
  sed -i 's/#database\s*=.*/database = sqlite:\/\/\/\/var\/lib\/pyca\/pyca.db/' etc/pyca.conf

  # Backport a minor fix in agentstate worker, see https://github.com/opencast/pyCA/pull/96
  sed -i 's/while not terminate and/while not terminate() and/g' pyca/agentstate.py
}

package() {
  cd pyCA-"${pkgver}"

  install -Dm 644 "${srcdir}"/pyca.target "${pkgdir}"/usr/lib/systemd/system/pyca.target
  install -Dm 644 "${srcdir}"/pyca@.service "${pkgdir}"/usr/lib/systemd/system/pyca@.service
  install -Dm 644 "${srcdir}"/pycaui.service "${pkgdir}"/usr/lib/systemd/system/pycaui.service
  install -dm 755 "${pkgdir}"/usr/lib/systemd/system/pyca.target.wants
  ln -s /usr/lib/systemd/system/pyca@agentstate.service "${pkgdir}"/usr/lib/systemd/system/pyca.target.wants/pyca@agentstate.service
  ln -s /usr/lib/systemd/system/pyca@capture.service "${pkgdir}"/usr/lib/systemd/system/pyca.target.wants/pyca@capture.service
  ln -s /usr/lib/systemd/system/pyca@ingest.service "${pkgdir}"/usr/lib/systemd/system/pyca.target.wants/pyca@ingest.service
  ln -s /usr/lib/systemd/system/pyca@schedule.service "${pkgdir}"/usr/lib/systemd/system/pyca.target.wants/pyca@schedule.service

  install -dm 755 "${pkgdir}"/var/lib/pyca/recordings
  install -dm 755 "${pkgdir}"/usr/lib/python3.6/site-packages/pyca

  install -Dm 644 etc/pyca.conf "${pkgdir}"/etc/pyca.conf
  cp -dr --no-preserve=ownership pyca/* "${pkgdir}"/usr/lib/python3.6/site-packages/pyca/
  install -Dm 755 start.sh "${pkgdir}"/usr/bin/pyca
}
