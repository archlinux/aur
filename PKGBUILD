# Maintainer: Nogweii <me@nogweii.net>
# Mainteiner: Donald Webster <fryfrog@gmail.com>

pkgname=runrestic
pkgver=0.5.28
pkgrel=1
pkgdesc='A wrapper script for Restic backup software that inits, creates, prunes and checks backups'
arch=(any)
url='https://pypi.org/project/runrestic'
license=('GPL3')
depends=(
  'restic'
  'python-toml'
  'python-jsonschema'
  'python-requests'
)

checkdepends=('python-pytest')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('62cd131161379607d3fba1a43e71e57a24e1d747af064bd1b8bab207ec102542')

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
