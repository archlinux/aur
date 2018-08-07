#Maintainer: Jan Koppe <post@jankoppe.de>
pkgname=pyca
pkgver=2.1
pkgrel=5
pkgdesc="Python Capture Agent for Opencast"
arch=('any')
url="https://github.com/opencast/pyCA"
license=('LGPL')
depends=('gnutls' 'python-dateutil' 'python-configobj' 'python-flask' 'python-pycurl' 'python-sqlalchemy')
optdepends=('gunicorn: wsgi web interface')
source=("https://github.com/opencast/pyCA/archive/v$pkgver.tar.gz"
        "pyca.install"
        "pyca.service"
        "pyca-ui.service"
        "pyca-agentstate.service"
        "pyca-capture.service"
        "pyca-ingest.service"
        "pyca-schedule.service")
install="pyca.install"
md5sums=('c48f246eff3e33a04310da39c01578bf'
         'd16c4e1a394f0cf356f65555e8cb0334'
         'c014533da3c3b9bb763419e2721e844a'
         '965c239a4c7a2d528f1ce559f8224ac7'
         '3d64e43407482b906b5e21f2a5584a6e'
         '2eb31065c6d4deb6888c3b187565add9'
         '4adcf6d8ff3641ad1dd4910a1957c9db'
         'e86a4025da5842d701a12cc258116c66')
backup=('etc/pyca.conf')

prepare() {
  cd pyCA-"${pkgver}"

  # Change default locations for recordings and the internal sqlite database
  sed -i 's/directory\s*=.*/directory = \/var\/lib\/pyca\/recordings\//' etc/pyca.conf
  sed -i 's/#database\s*=.*/database = sqlite:\/\/\/\/var\/lib\/pyca\/pyca.db/' etc/pyca.conf
}

package() {
  cd pyCA-"${pkgver}"

  install -Dm 644 "${srcdir}"/pyca.service "${pkgdir}"/usr/lib/systemd/system/pyca.service
  install -Dm 644 "${srcdir}"/pyca-agentstate.service "${pkgdir}"/usr/lib/systemd/system/pyca-agentstate.service
  install -Dm 644 "${srcdir}"/pyca-capture.service "${pkgdir}"/usr/lib/systemd/system/pyca-capture.service
  install -Dm 644 "${srcdir}"/pyca-ingest.service "${pkgdir}"/usr/lib/systemd/system/pyca-ingest.service
  install -Dm 644 "${srcdir}"/pyca-schedule.service "${pkgdir}"/usr/lib/systemd/system/pyca-schedule.service
  install -Dm 644 "${srcdir}"/pyca-ui.service "${pkgdir}"/usr/lib/systemd/system/pyca-ui.service

  install -dm 755 "${pkgdir}"/var/lib/pyca/recordings
  install -dm 755 "${pkgdir}"/usr/lib/python3.7/site-packages/pyca

  install -Dm 644 etc/pyca.conf "${pkgdir}"/etc/pyca.conf
  cp -dr --no-preserve=ownership pyca/* "${pkgdir}"/usr/lib/python3.7/site-packages/pyca/
  install -Dm 755 start.sh "${pkgdir}"/usr/bin/pyca
}
