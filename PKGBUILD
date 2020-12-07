#Maintainer: Jan Koppe <post@jankoppe.de>
pkgname=pyca
pkgver=3.3
pkgrel=1
pkgdesc="Python Capture Agent for Opencast"
arch=('any')
url="https://github.com/opencast/pyCA"
license=('LGPL')
depends=('python-pycurl' 'python-dateutil' 'python-configobj' 'python-sqlalchemy' 'python-sdnotify' 'python-psutil' 'python-flask')
optdepends=('gunicorn: wsgi web interface' 'ffmpeg: video and audio recording')
source=("https://github.com/opencast/pyCA/archive/v$pkgver.tar.gz")
install="pyca.install"
md5sums=('0ef885b91d309b69399f91b6d36e84ff')
backup=('etc/pyca.conf')

prepare() {
  cd pyCA-"${pkgver}"

  # Change default locations for recordings and the internal sqlite database
  sed -i 's/directory\s*=.*/directory = \/var\/lib\/pyca\/recordings\//' etc/pyca.conf
  sed -i 's/#database\s*=.*/database = sqlite:\/\/\/\/var\/lib\/pyca\/pyca.db/' etc/pyca.conf
}

package() {
  cd pyCA-"${pkgver}"

  install -Dm 644 init/systemd/pyca.service "${pkgdir}"/usr/lib/systemd/system/pyca.service
  install -Dm 644 init/systemd/pyca-agentstate.service "${pkgdir}"/usr/lib/systemd/system/pyca-agentstate.service
  install -Dm 644 init/systemd/pyca-capture.service "${pkgdir}"/usr/lib/systemd/system/pyca-capture.service
  install -Dm 644 init/systemd/pyca-ingest.service "${pkgdir}"/usr/lib/systemd/system/pyca-ingest.service
  install -Dm 644 init/systemd/pyca-schedule.service "${pkgdir}"/usr/lib/systemd/system/pyca-schedule.service
  install -Dm 644 init/systemd/pyca-ui.service "${pkgdir}"/usr/lib/systemd/system/pyca-ui.service

  install -dm 755 "${pkgdir}"/var/lib/pyca/recordings
  install -dm 755 "${pkgdir}"/usr/lib/python3.9/site-packages/pyca

  install -Dm 644 etc/pyca.conf "${pkgdir}"/etc/pyca.conf
  cp -dr --no-preserve=ownership pyca/* "${pkgdir}"/usr/lib/python3.9/site-packages/pyca/
  install -Dm 755 start.sh "${pkgdir}"/usr/bin/pyca
}
