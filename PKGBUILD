# Mainteiner: Donald Webster <fryfrog@gmail.com>

pkgname=runrestic
pkgver=0.5.20
pkgrel=1
pkgdesc='A wrapper script for Restic backup software that inits, creates, prunes and checks backups'
arch=(any)
url='https://github.com/sinnwerkstatt/runrestic'
license=('GPL3')
depends=('restic'
         'python'
         'python-toml'
         'python-jsonschema'
         'python-requests')

checkdepends=('python-pytest')

source=("runrestic-${pkgver}.tar.gz::https://github.com/sinnwerkstatt/runrestic/archive/${pkgver}.tar.gz")

sha256sums=('2621270380d1ab867ec93de5ee794a7da41a31aa4ab5cfebf6881540b6cf146a')

check() {
  cd "${pkgname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  sed -i 's%/usr/local%/usr%' sample/systemd/runrestic.service
  install -D -m 644 sample/systemd/runrestic.service ${pkgdir}/usr/lib/systemd/system/runrestic.service
  install -D -m 644 sample/systemd/runrestic.timer   ${pkgdir}/usr/lib/systemd/system/runrestic.timer
}
