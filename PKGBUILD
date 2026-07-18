# Maintainer: Uladzislau Bolbas <cmrtumilovic@gmail.com>

pkgname=vlt
pkgver=1.0
pkgrel=1
pkgdesc="Non-interactive password store built as a wrapper around gisp"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://codeberg.org/artich0ke/vlt"
license=('GPL-3.0-or-later')
# gisp is a runtime dependency, not a link-time one: vlt performs no
# cryptography and execs gisp for every operation.  Without it, vlt builds and
# installs but every command fails.
depends=('gisp')
makedepends=('gcc' 'make')
# Signed release tarball from Codeberg (verified against the maintainer's key).
# This is a "make dist" product rather than a forge-generated archive: those
# are regenerated on demand and their bytes can change across Forgejo
# versions, which would break the checksum without upstream having touched
# anything.
source=("https://codeberg.org/artich0ke/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://codeberg.org/artich0ke/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('bfcc5cde04ea53757c5da9d36741f9b0ce38460115009cfb842baf1d0ba45cba'
            'SKIP')
validpgpkeys=('CAD6600A6D1987A35977DAC769C78665ADF4D655')

build() {
  cd "$pkgname-$pkgver"
  # GISP pins the absolute path of the gisp binary into the build.  The
  # default is a bare "gisp" resolved through PATH at run time; pinning it
  # means an entry earlier in a user's PATH cannot interpose itself between
  # vlt and the program it hands the passphrase to.  The path is guaranteed
  # by the gisp package, which is a hard dependency.
  make prefix=/usr GISP=/usr/bin/gisp
}

check() {
  cd "$pkgname-$pkgver"
  # The suite exercises the real gisp, which makepkg has already installed as
  # a declared dependency.  It works in a temporary directory and touches no
  # vault of the building user.
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install

  # Arch keeps licence texts under /usr/share/licenses.  The upstream Makefile
  # also puts a copy in the doc directory, so drop that one rather than ship
  # 35 KiB of GPL twice.
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  rm -f "$pkgdir/usr/share/doc/$pkgname/COPYING"
}
