# Maintainer: houmain <houmain at posteo dot net>

pkgname=spright-git
_pkgname=spright
pkgver=latest
pkgrel=2
pkgdesc="A command line sprite sheet packer"
arch=(i686 x86_64 armv6h armv7h aarch64)
url=https://github.com/houmain/${_pkgname}
license=(GPL3)
makedepends=(cmake git)
conflicts=(${_pkgname})
provides=(${_pkgname})
source=(git+https://github.com/houmain/spright.git
        git+https://github.com/houmain/rect_pack.git)
md5sums=(SKIP
         SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule init
  git config submodule.rect_pack.url $srcdir/libs/rect_pack
  git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake . -DVERSION="$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}

# vim: set ts=2 sw=2 et:
