# Maintainer: tarball <bootctl@gmail.com>
# Contributor: ModelHX
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Steve Sansom <snsansom@gmail.com>

pkgname=units
pkgver=2.24
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
        'units_currency.service')
sha256sums=('1e502c4edfacf20b29284716c72e5ddb51a495a2365d7b03e7960494c4a0c902'
            'SKIP'
            'c1cb48a6157c850a0b7ecbf4387b82820d6e42f4a2c7ff0eb9de293bad6b128f'
            '52e8cd68110e797e3ee3737f06200505225039b18f3f9b87ae38b6c539c9ccb2')

build() {
  cd "$pkgname-$pkgver"

  # gcc15 compatibility fix
  CFLAGS="$CFLAGS -std=gnu17" \
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
