# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
pkgname=smfc
pkgver=3.4.0
pkgrel=1
pkgdesc="Supermicro Fan Control"
arch=(any)
install=smfc.install
backup=('etc/default/smfc' 'opt/smfc/smfc.conf')
url="https://github.com/petersulyok/smfc"
license=('GPL3')
depends=(python syslog-ng pacman-hook-reload-modules)
checkdepends=(flake8 python-coverage python-pylint python-pytest python-pytest-cov)
source=(
  "${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  'modules-load.conf'
)
sha256sums=('92412bc73e13e8fbb6e3d00835d9954698ad4d0b3cd98275778875d63bc8afcc'
            '695a1124cf2922feb6a7d2892e664a1b4fcb11329ff635734dc1b95df1f9dc51')

check() {
  cd "${pkgname}-${pkgver}"
  pytest
}

package() {
  install -o root -g root -Dm644 modules-load.conf "${pkgdir}/usr/lib/modules-load.d/smfc.conf"

  cd "${pkgname}-${pkgver}"

  install -o root -g root -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd src
  install -o root -g root -Dm755 smfc.py "${pkgdir}/opt/smfc/smfc.py"
  install -o root -g root -Dm644 smfc.conf "${pkgdir}/opt/smfc/smfc.conf"
  install -o root -g root -Dm644 smfc "${pkgdir}/etc/default/smfc"
  install -o root -g root -Dm644 smfc.service "${pkgdir}/usr/lib/systemd/system/smfc.service"
}
