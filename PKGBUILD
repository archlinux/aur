# Maintainer: Peter Hoeg <firstname at lastname dot com>

_pkgbase=tensor
pkgname=${_pkgbase}-git
pkgver=r37.09370d4
pkgrel=1
pkgdesc='Matrix QML client'
arch=('x86_64' 'i686')
url=('http://www.matrix.org')
license=('GPL')
depends=('qt5-base')
source=("git+https://github.com/davidar/${_pkgbase}.git")
sha1sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgbase}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd ${srcdir}/${_pkgbase}
  git submodule update --init
  cd matrix-js-sdk && npm install && npm run build && cd ..
}

build() {
  cd ${srcdir}/${_pkgbase}
  qmake
  make
}

package() {
  cd ${srcdir}/${_pkgbase}
  mkdir -p $pkgdir/usr/bin
  install -m755 tensor $pkgdir/usr/bin/tensor
}

# vim:set ts=2 sw=2 et:
