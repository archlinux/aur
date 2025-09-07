# Maintainer:
# Contributor: Joel Grunbaum <joel@joelg.net>
# Contributer: Yangtse Su <i@yangtse.me>

_pkgname="xpadneo-dkms"
pkgname="$_pkgname-git"
pkgver=0.9.r226.ga16acb0
pkgrel=1
pkgdesc="Advanced Linux Driver for Xbox One Wireless Gamepad"
url="https://github.com/atar-axis/xpadneo"
license=('GPL-3.0-only')
arch=('any')

depends=(
  'dkms'
  'bluez'
  'bluez-utils'
)
makedepends=(
  'git'
)

conflicts=("$_pkgname")
provides=("$_pkgname")

_pkgsrc="xpadneo"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  local VERSION="$(pkgver)"

  cd "$_pkgsrc/hid-xpadneo"
  sed -E \
    -e '/^CLEAN/d' \
    -e '/^POST_INSTALL/d' \
    -e '/^POST_REMOVE/d' \
    -e 's/@DO_NOT_CHANGE@/'"${VERSION}"'/g' \
    dkms.conf.in > dkms.conf

  rm -f dkms.post_*
}

pkgver() (
  cd "$srcdir/$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
)

package() {
  _files=(
    Makefile
    dkms.conf
    src/*.c
    src/*.h
    src/Makefile
    src/xpadneo/*.c
  )

  cd "$_pkgsrc/hid-xpadneo"
  for i in "${_files[@]}"; do
    [ -f "$i" ] && install -Dm644 "$i" -t "$pkgdir/usr/src/hid-xpadneo-$pkgver/${i%/*}/"
  done

  install -Dm644 etc-modprobe.d/xpadneo.conf -t "$pkgdir/usr/lib/modprobe.d/"
  install -Dm644 -t "$pkgdir/usr/lib/udev/rules.d/" \
    etc-udev-rules.d/60-xpadneo.rules \
    etc-udev-rules.d/70-xpadneo-disable-hidraw.rules
}
