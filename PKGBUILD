# Maintainer: tarball <bootctl@gmail.com>
# Contributor: ModelHX
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Steve Sansom <snsansom@gmail.com>
# Contributor: qubidt <qubidt at gmail dot com>

pkgname=units
pkgver=2.25
pkgrel=2
pkgdesc="converts between different units"
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url="https://www.gnu.org/software/units/units.html"
depends=('readline')
optdepends=('less: pager for built-in documentation'
            'python-unidecode: for live currency rates'
            'python-requests: for live currency rates')
makedepends=('python-unidecode' 'python-requests')
license=("GPL-3.0-or-later")
options=('!makeflags')
validpgpkeys=(
  '927D02FA733C3D902D21CAC02D649F2B7B4C8179' # Adrian Mariano <avm4@cornell.edu>
)
source=(https://ftp.gnu.org/gnu/units/$pkgname-$pkgver.tar.gz{,.sig}
        'units_currency.timer'
        'units_currency.service'
        '0001-units_cur.patch')
sha256sums=('36edf43ac00b4d6304baea91387e65ab05118bf65c921f73d3b08828e5a6ec0b'
            'SKIP'
            'c1cb48a6157c850a0b7ecbf4387b82820d6e42f4a2c7ff0eb9de293bad6b128f'
            '52e8cd68110e797e3ee3737f06200505225039b18f3f9b87ae38b6c539c9ccb2'
            'b09a7a114f23fa8de6b34b2be28ab44c2914a4ed8e9811979deb025cc9bdd427')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 <"$srcdir/0001-units_cur.patch"
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --datadir=/usr/share --sharedstatedir=/var/lib

  # /usr/bin/pager seems to be a Debian-ism; it is not provided by any of the
  # packages shipped with Arch Linux. Replace it with less, which, according to
  # pkgstats, is shipped on 100% of Arch systems, and will make the 'help'
  # function work correctly on systems with an empty $PAGER env var.
  sed -i 's|DEFAULTPAGER "/usr/bin/pager"|DEFAULTPAGER "/usr/bin/less"|' units.c

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
