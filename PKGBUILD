#Maintainer: Jan Koppe <post@jankoppe.de>
pkgname=pyca
pkgver=3.2
pkgrel=7
pkgdesc="Python Capture Agent for Opencast"
arch=('any')
url="https://github.com/opencast/pyCA"
license=('LGPL')
depends=('python-pycurl' 'python-dateutil' 'python-configobj' 'python-sqlalchemy' 'python-sdnotify' 'python-psutil' 'python-flask')
optdepends=('gunicorn: wsgi web interface' 'ffmpeg: video and audio recording')
source=("https://github.com/opencast/pyCA/archive/v$pkgver.tar.gz"
        "pyca.install"
        "pyca.service"
        "pyca-ui.service"
        "pyca-agentstate.service"
        "pyca-capture.service"
        "pyca-ingest.service"
        "pyca-schedule.service")
install="pyca.install"
md5sums=('9db4a8d30754458a624c23af1b1a7572'
         'd16c4e1a394f0cf356f65555e8cb0334'
         'ad2dff096f5fd249f30137088ea5130d'
         'e00ff2fb7ded9f6ef2c01b6dccb8bb7c'
         '00d4bc93ddd9de5226cbfad53e1b4d10'
         'eac3ed5d9f9766bcc4b455b69056b351'
         'e0ee6375752f98e3dfca8c9a5b2b776f'
         'f17d472d7de8f63e6b563fd38ac81314')
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
  install -dm 755 "${pkgdir}"/usr/lib/python3.8/site-packages/pyca

  install -Dm 644 etc/pyca.conf "${pkgdir}"/etc/pyca.conf
  cp -dr --no-preserve=ownership pyca/* "${pkgdir}"/usr/lib/python3.8/site-packages/pyca/
  install -Dm 755 start.sh "${pkgdir}"/usr/bin/pyca
}
