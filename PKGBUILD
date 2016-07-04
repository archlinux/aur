# Maintainer: Sindre Devik
_host=https://github.com/jergusg
_pkgname=k380-function-keys-conf
pkgname=$_pkgname-git
pkgver=r3.b1798b8
pkgrel=2
pkgdesc="Make function keys on Logitech K380 bluetooth keyboard default"
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
install=
source=("${_pkgname}::git+${_host}/${_pkgname}" 70-k380.rules k380_enable_function_keys.sh)
noextract=()
md5sums=(SKIP 496b213ea14e39337d2269afd705c831 39780ae6cbb26dc2c9e179c53155e33e)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  ./build.sh
}

_adapt_udev_rule() {
    keyboard_id=`journalctl -k | grep -i k380 | grep -o '\([[:alnum:]]\{2\}:\)\{5\}[[:alnum:]]\{2\}' | head -1`

    if [ $? -eq 0 ]
    then
        sed -ie   "s/%keyboard_id%/$keyboard_id/" $srcdir/70-k380.rules
        mkdir -p                                  $pkgdir/usr/lib/udev/rules.d
        cp                  $srcdir/70-k380.rules $pkgdir/usr/lib/udev/rules.d
    else
        echo "Could not determine Logitech k380 keyboard id. Please set up udev rule manually"
    fi
}

package() {
  mkdir -p                                                $pkgdir/usr/bin
  cp       $srcdir/$_pkgname/k380_conf                    $pkgdir/usr/bin
  cp       $srcdir/k380_enable_function_keys.sh           $pkgdir/usr/bin
  _adapt_udev_rule
}
# vim:set ts=2 sw=2 et:
