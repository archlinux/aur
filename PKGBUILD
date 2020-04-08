# Mainteiner: Donald Webster <fryfrog@gmail.com>

pkgname=runrestic
pkgver=0.5.3
pkgrel=1
pkgdesc='A wrapper script for Restic backup software that inits, creates, prunes and checks backups'
arch=(any)
url='https://github.com/andreasnuesslein/runrestic'
license=('GPL3')
depends=('restic'
         'python'
         'python-toml'
         'python-jsonschema'
         'python-requests')

checkdepends=('python-pytest')

source=("runrestic-${pkgver}.tar.gz::https://github.com/andreasnuesslein/runrestic/archive/${pkgver}.tar.gz")

sha256sums=('45279581cf173f3731e8eb465818acbb3fcf0542f03948fba6d8c2f4bec33ac8')

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
