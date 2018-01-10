# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

pkgname="moltengamepad"
pkgver=1.1.0
pkgrel=1
pkgdesc="Flexible Linux input device translator, geared for gamepads"
url="https://github.com/jgeumlek/MoltenGamepad"
arch=('x86_64')
_commit="6fd48a49a9ddb0b509b10f6e79ff3da3a49e925d"
license=('MIT')
source=("https://github.com/jgeumlek/MoltenGamepad/archive/${_commit}.zip")
md5sums=('80bcf71ebb0d0ea757e3089ac9bfc231')
depends=('scraw' 'scrawpp')
install="moltengamepad.install"

build() {
  cd "MoltenGamepad-${_commit}"
  sed -i '3 s/^#//' Makefile
  sed -i '5 s/^#//' Makefile
  sed -i '11 s|/usr/local/bin/|/usr/bin/|' installation/systemuser/systemd.service
  make || return 1
}

package() {
  cd "MoltenGamepad-${_commit}"
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/lib/systemd/system/
  install -Dm755 moltengamepad $pkgdir/usr/bin/moltengamepad
  install -Dm644 installation/systemuser/systemd.service $pkgdir/usr/lib/systemd/system/moltengamepad.service
  install -Dm644 installation/systemuser/udev.rules "$pkgdir"/usr/lib/udev/rules.d/72-moltengamepad.rules
  install -Dm644 installation/systemuser/tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/moltengamepad.conf
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/license
}
