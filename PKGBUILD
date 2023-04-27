# Maintainer: Edison Ibáñez <arkhan at riseup [dot] net>

pkgname=mons-git
_pkgname=${pkgname%-git}
pkgver=r120.375bbba
pkgrel=2
pkgdesc="KISS and POSIX Shell script to quickly manage three monitors on X"
arch=("any")
url="https://github.com/Ventto/mons"
license=("MIT")
depends=("xorg-xrandr")
makedepends=("git"
             "help2man")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+${url}"
        "git+https://github.com/Ventto/libshlist")
md5sums=("SKIP"
         "SKIP")

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd ${srcdir}
  sed -i -e "s#%LIBDIR%#/usr/lib/libshlist#" ${_pkgname}/mons.sh
  rm -r ${_pkgname}/libshlist
  mv libshlist ${_pkgname}/libshlist
}

package() {
  cd ${srcdir}/${_pkgname}
  make DESTDIR="${pkgdir}" install
}
