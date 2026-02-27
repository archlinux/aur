# Maintainer: tarball <bootctl@gmail.com>
# Contributor: ModelHX
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Steve Sansom <snsansom@gmail.com>
# Contributor: qubidt <qubidt at gmail dot com>

pkgname=units
pkgver=2.26
pkgrel=1
pkgdesc="converts between different units"
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url="https://www.gnu.org/software/units/units.html"
depends=('readline')
optdepends=('less: pager for built-in documentation' # NOTE: set the PAGER env var to use own pager
            'python-requests: for live currency rates')
makedepends=('python-requests')
license=("GPL-3.0-or-later")
options=('!makeflags')
validpgpkeys=(
  '927D02FA733C3D902D21CAC02D649F2B7B4C8179' # Adrian Mariano <avm4@cornell.edu>
)
source=(https://ftp.gnu.org/gnu/units/$pkgname-$pkgver.tar.gz{,.sig}
        'units_currency.timer'
        'units_currency.service'
        '0000-pager.patch')
sha256sums=('4c43f7a49fe2212ee433d3c0755a0a1935db35497c4a56bf9f68c5f718873c54'
            'SKIP'
            'c1cb48a6157c850a0b7ecbf4387b82820d6e42f4a2c7ff0eb9de293bad6b128f'
            '52e8cd68110e797e3ee3737f06200505225039b18f3f9b87ae38b6c539c9ccb2'
            '35b8b8587e1303dca1070df460b167c074178b68a865cfdc2ea8ed158ef4e4e4')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 <"$srcdir/0000-pager.patch"
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --datadir=/usr/share --sharedstatedir=/var/lib
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/share/units/currency.units"
  ln -s /var/lib/units/currency.units "$pkgdir/usr/share/units/currency.units"
  install -Dm644 ../units_currency.timer "$pkgdir/usr/lib/systemd/system/units_currency.timer"
  install -Dm644 ../units_currency.service "$pkgdir/usr/lib/systemd/system/units_currency.service"
}
