# Maintainer: aboe76 AT gmail DOT com>
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: EdwardXXIV
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=pixman-git
_gitname=pixman
pkgver=0.31.1.2145.fedd6b1
pkgrel=1
pkgdesc="The pixel-manipulation library for X and cairo"
arch=('i686' 'x86_64')
url="http://pixman.org/"
license=('MIT')
depends=('glibc')
options=('!libtool')
conflicts=('pixman')
provides=("pixman=${pkgver}")
makedepends=('git')
source=("git://anongit.freedesktop.org/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"

  for i in pixman_major pixman_minor pixman_micro; do
    local _$i=$(grep -m 1 $i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  echo ${_pixman_major}.${_pixman_minor}.${_pixman_micro}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_gitname}"
  ./autogen.sh --prefix=/usr --disable-static
  make
}

check() {
  cd "${srcdir}/${_gitname}"
  make check
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
