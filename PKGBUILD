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
depends=('python' 'ipmitool'  'bash' 'systemd')
optdepends=('smartmontools: For SAS/SCSI disks and standby guard feature'
 'nvidia-utils: For GPU fan controller')
checkdepends=('flake8' 'python-coverage' 'python-pylint' 'python-pytest' 'python-mock' 'python-pytest-cov' 'python-pyudev')
source=(
  "${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  'modules-load.conf'
  'reload-modules.hook'
)
sha256sums=('0ab042f3bf1c43ebe7394afdb276c317d2399e39bb86245ea94ba4662e1a6949'
            'cb5d4c408aa5adfdf5b476c6c203cdefda8e765bb4e306c95afdda13b905d1ba'
            'e1c85e8b2ba25ff6384205fe4a4bb2492919861a56c0059f3b6f6feb6f580df8')

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
  install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
  install -m644 "${srcdir}/modules-reload.hook" "${pkgdir}/usr/share/libalpm/hooks/95-modules-reload.hook"
}
