# Maintainer:

pkgname=bluez-tools-extra
pkgver=5.72
pkgrel=1
pkgdesc="deprecated tools from bluez (hciconfig, hcitool, rfcomm)"
url="http://www.bluez.org/"
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')

depends=(
  "bluez-libs"
)

provides=(
  'bluez-hciconfig'
  'bluez-hcitool'
  'bluez-rfcomm'
)
conflicts=(
  #'bluez-hciconfig'
  'bluez-hcitool'
  'bluez-rfcomm'
  'bluez-utils-compat'
)

_pkgsrc="bluez-$pkgver"
_pkgext="tar.xz"
source=("https://www.kernel.org/pub/linux/bluetooth/$_pkgsrc.$_pkgext")
sha256sums=('499d7fa345a996c1bb650f5c6749e1d929111fa6ece0be0e98687fee6124536e')

build() {
  cd "$_pkgsrc"

  gcc $CFLAGS \
    tools/hciconfig.c tools/parser/{csr,parser,lmp}.c src/textfile.c \
    -lbluetooth -o tools/hciconfig \
    $LDFLAGS \
    -DVERSION=\"$pkgver\" \
    -DSTORAGEDIR=\"/var/lib/bluetooth\" \
    -I.

  gcc $CFLAGS \
    tools/hcitool.c src/oui.c \
    -lbluetooth -o tools/hcitool \
    $LDFLAGS \
    -DVERSION=\"$pkgver\" \
    -DSTORAGEDIR=\"/var/lib/bluetooth\" \
    -I.

  gcc $CFLAGS \
    tools/rfcomm.c lib/bluetooth.c lib/hci.c \
    -o tools/rfcomm \
    $LDFLAGS \
    -DVERSION=\"$pkgver\" \
    -DSTORAGEDIR=\"/var/lib/bluetooth\" \
    -I.
}

package() {
  cd "$_pkgsrc/tools"

  install -Dm755 hciconfig -t "$pkgdir/usr/bin"
  install -Dm755 hciconfig.1 -t "$pkgdir/usr/share/man/man1"

  install -Dm755 hcitool -t "$pkgdir/usr/bin"
  install -Dm755 hcitool.1 -t "$pkgdir/usr/share/man/man1"

  install -Dm755 rfcomm -t "$pkgdir/usr/bin"
  install -Dm755 rfcomm.1 -t "$pkgdir/usr/share/man/man1"
}
