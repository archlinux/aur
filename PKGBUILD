# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
pkgname=smfc
pkgver=2.3.1
pkgrel=2
pkgdesc="Super Micro Fan Control"
arch=(any)
install=smfc.install
backup=('etc/default/smfc' 'opt/smfc/smfc.conf')
url="https://github.com/petersulyok/smfc"
license=('GPL3')
depends=(python syslog-ng)
checkdepends=(flake8 python-coverage python-pylint python-pytest python-pytest-cov)
source=(
  "${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  'modules-load.conf'
)
sha256sums=('5578829cb2b329d9f920b9ba2a20b80c541e47dc418e1c81838ec672b32284e7'
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
