# Maintainer: Marcus Ben Spencer <marcus at marcusspencer dot xyz>
# Maintainer: runningpie <levi at levispencer dot com>
# Contributor: Elijah Gregg <lovetocode999 at tilde dot team>
# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

pkgname="moltengamepad"
pkgver=1.2.3
pkgrel=1
pkgdesc="Flexible Linux input device translator, geared for gamepads"
url="https://gitlab.com/AllMeatball/moltengamepad"
arch=('x86_64')
license=('MIT')
source=("https://gitlab.com/AllMeatball/moltengamepad/-/archive/v${pkgver}/moltengamepad-v${pkgver}.zip")
sha256sums=('6d8f5723df4cd35c6d2423fd09b1786c70bf893efc9054da4f8847673be68de5')
makedepends=('go-md2man' 'git' 'make' 'sed')
depends=('scraw' 'scrawpp')
install="moltengamepad.install"

prepare() {
  cd "${pkgname}-v${pkgver}"
  make eventlists
}

build() {
  cd "${pkgname}-v${pkgver}"
  sed -i '3 s/^#//' Makefile
  sed -i '5 s/^#//' Makefile
  sed -i '11 s|/usr/local/bin/|/usr/bin/|' installation/systemuser/systemd.service
  make || return 1
}

package() {
  cd "${pkgname}-v${pkgver}"
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/lib/systemd/system/
  install -Dm755 moltengamepad $pkgdir/usr/bin/moltengamepad
  install -Dm644 installation/systemuser/systemd.service $pkgdir/usr/lib/systemd/system/moltengamepad.service
  install -Dm644 installation/systemuser/udev.rules "$pkgdir"/usr/lib/udev/rules.d/72-moltengamepad.rules
  install -Dm644 installation/systemuser/tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/moltengamepad.conf
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/license
}
