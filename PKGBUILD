# Mainteiner: Donald Webster <fryfrog@gmail.com>

pkgname=runrestic
pkgver=0.5.0
pkgrel=3
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

sha256sums=('654dbbedd073e00cde4961ebc1fbc4a380c6a7014778fa5920628f72b3e8d5a0')

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
