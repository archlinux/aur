# Maintainer : lsf <lsf@lsf>

pkgname=wifite2-git
pkgver=r493.6fd209102
pkgrel=2
pkgdesc="A tool to attack multiple WEP and WPA encrypted networks at the same time"
arch=(any)
url="https://github.com/kimocoder/wifite2"
license=('GPL2')
depends=(python aircrack-ng iw iproute2 net-tools
         python-argparse python-chardet)
        # scapy: listed in requirements.txt, but not actually used atm
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
  'hcxtools: converting PMKID packet captures into hashcat format' # should be part of hcxtools?
)
  # 'hcxpcapngtool: converting PMKID packet captures into hashcat format' # should be part of hcxtools?
makedepends=(git)
source=($pkgname::git+https://github.com/kimocoder/wifite2.git)
sha256sums=('SKIP')
provides=('wifite')
conflicts=('wifite')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  sed 's|sbin|bin|g' -i setup.cfg
}


build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
