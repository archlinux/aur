# Maintainer: Elijah Gregg <lovetocode999 at tilde dot team>
# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

pkgname="moltengamepad"
pkgver=1.2.1
pkgrel=1
pkgdesc="Flexible Linux input device translator, geared for gamepads"
url="https://github.com/jgeumlek/MoltenGamepad"
arch=('x86_64')
license=('MIT')
source=("https://github.com/jgeumlek/MoltenGamepad/archive/refs/tags/v${pkgver}.zip"
        "https://patch-diff.githubusercontent.com/raw/jgeumlek/MoltenGamepad/pull/99.patch")
sha256sums=('6ba8708953fd1ba08dd480bf33bdce678720842fbfdd1b5215c65e1700a0d869'
            '1f724c23aadec8d8d09172e1db63e32f530e5b8b902de393bf1fa733c39c5a17')
makedepends=('go-md2man')
depends=('scraw' 'scrawpp')
install="moltengamepad.install"

prepare() {
  cd "MoltenGamepad-${pkgver}"
  patch -p1 "source/core/uinput.h" "${srcdir}/99.patch"
}

build() {
  cd "MoltenGamepad-${pkgver}"
  sed -i '3 s/^#//' Makefile
  sed -i '5 s/^#//' Makefile
  sed -i '11 s|/usr/local/bin/|/usr/bin/|' installation/systemuser/systemd.service
  make eventlists
  make || return 1
}

package() {
  cd "MoltenGamepad-${pkgver}"
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/lib/systemd/system/
  install -Dm755 moltengamepad $pkgdir/usr/bin/moltengamepad
  install -Dm644 installation/systemuser/systemd.service $pkgdir/usr/lib/systemd/system/moltengamepad.service
  install -Dm644 installation/systemuser/udev.rules "$pkgdir"/usr/lib/udev/rules.d/72-moltengamepad.rules
  install -Dm644 installation/systemuser/tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/moltengamepad.conf
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/license
}
