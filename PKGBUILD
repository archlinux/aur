# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: lsf <lsf@lsf>
pkgname=wifite-git
_pkgname=${pkgname%-git}
pkgver=r729.dccebcdde
pkgrel=2
pkgdesc="A tool to attack multiple WEP and WPA encrypted networks at the same time"
arch=(any)
url="https://github.com/kimocoder/wifite2"
license=('GPL2')
depends=('python' 'python-chardet' 'aircrack-ng' 'iproute2' 'iw')
optdepends=(
  'wireshark-cli: detecting WPS networks and inspecting handshake capture files'
  'reaver: WPS Pixie-Dust & brute-force attacks'
  'bully: WPS Pixie-Dust & brute-force attacks'
  'cowpatty: detect WPA handshakes'
  'pyrit: detect WPA handshakes'
  'macchanger: change MAC for attacks'
  'hashcat: cracking PMKID hashes'
  'john: cracking PMKID hashes'
  'hcxdumptool: capturing PMKID hashes'
  'hcxtools: converting PMKID packet captures into hashcat format'
)
makedepends=( 'git' 
              'python-pytest' 
              'python-setuptools'
              'python-poetry')
checkdepends=('cowpatty')
source=(${pkgname}::git+${url}.git)
sha256sums=('SKIP')
provides=("${_pkgname}2")
conflicts=("${_pkgname}2")

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}"
  sed 's|sbin|bin|g' -i setup.cfg
}


build() {
  cd "${pkgname}"
  python setup.py build

}

package() {
  cd "${pkgname}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
