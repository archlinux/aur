# Maintainer: Kevin Kaland
_host=https://github.com/embuc
_repo=k480_conf
_pkgname=k480-function-keys-conf
pkgname=$_pkgname-git
pkgver=r11.67702fb
pkgrel=1
pkgdesc="Make function keys on the Logitech K480 Bluetooth keyboard default"
arch=(x86_64 i686)
url=${_host}/${_pkgname}
license=(GPL)
groups=()
depends=(glibc sh)
makedepends=(git)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=${_pkgname}.install
source=("${_pkgname}::git+${_host}/${_repo}" 99-k480.rules ${_pkgname}-enable.sh)
noextract=()
sha256sums=(SKIP 2caee64458f1c921845f22aeae1b034eebfe3b39f9fe9b317fe0bbae500a535c c1696f2f95e8534006ed7578ff4f69a959bcce5c609398240a0ab1ef450b9d1e)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  ./build.sh
}

_adapt_udev_rule() {
    keyboard_id=`journalctl -k | grep -i k480 | grep -o '\([[:alnum:]]\{2\}:\)\{5\}[[:alnum:]]\{2\}' | head -1`

    if [ $? -eq 0 ]
    then
        sed -ie   "s/%keyboard_id%/$keyboard_id/" $srcdir/99-k480.rules
        mkdir -p                                  $pkgdir/usr/lib/udev/rules.d
        cp                  $srcdir/99-k480.rules $pkgdir/usr/lib/udev/rules.d
    else
        echo "Could not determine Logitech K480 keyboard ID. Please set up the udev rule manually."
    fi
}

package() {
  mkdir -p                                                $pkgdir/usr/bin
  cp       $srcdir/$_pkgname/k480_conf                    $pkgdir/usr/bin
  cp       $srcdir/$_pkgname-enable.sh                    $pkgdir/usr/bin

  mkdir -p                                                $pkgdir/usr/lib/udev/rules.d
  cp       $srcdir/99-k480.rules                          $pkgdir/usr/lib/udev/rules.d

  # _adapt_udev_rule
}
# vim:set ts=2 sw=2 et:
