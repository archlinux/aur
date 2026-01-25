# Contributer: Ewout van Mansom <ewout@vanmansom.name>
# Maintainer: Uri Ramirez <urirocky@no.email>
pkgname=smfc
pkgver=4.2.1
pkgrel=1
pkgdesc="Super Micro fan control for Arch Linux (home) servers."
arch=('x86_64')
install=smfc.install
backup=('etc/default/smfc' 'etc/smfc/smfc.conf')
url="https://github.com/petersulyok/smfc"
license=('GPL3')
depends=('python' 'ipmitool' 'pacman-hook-reload-modules' 'bash' 'systemd')
optdepends=('smartmontools: For SAS/SCSI disks and standby guard feature'
 'nvidia-utils: For GPU fan controller')
checkdepends=('flake8' 'python-coverage' 'python-pylint' 'python-pytest' 'python-pytest-cov' 'python-pyudev' 'python-mock')
source=(
  "${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  'modules-load.conf'
)
sha256sums=('0ab042f3bf1c43ebe7394afdb276c317d2399e39bb86245ea94ba4662e1a6949'
            '695a1124cf2922feb6a7d2892e664a1b4fcb11329ff635734dc1b95df1f9dc51')

check() {
  cd "${pkgname}-${pkgver}"
  pytest
}

package() {
  install -o root -g root -Dm644 modules-load.conf "${pkgdir}/etc/smfc/smfc.conf"

  cd "${pkgname}-${pkgver}"

  install -o root -g root -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd src
  install -o root -g root -Dm755 smfc.conf "${pkgdir}/etc/smfc/smfc.conf"
  install -o root -g root -Dm644 smfc.service "${pkgdir}/etc/systemd/system/smfc.service"
  install -o root -g root -Dm644 smfc "${pkgdir}/etc/default/smfc"
  install -o root -g root -Dm644 smfc.1.gz "${pkgdir}/usr/local/share/man/man1/smfc.1.gz"
  install -o root -g root -Dm644 smfc "${pkgdir}/usr/bin/smfc"
  install -o root -g root -Dm644 smfc.py "${pkgdir}/usr/lib/python3.14/smfc.py"
}
