# Maintainer: Avery Warddhana <them+arch _ nullablevo id au>
# Contributor: James An <james@jamesan.ca>o
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_pkgname=libxrandr
pkgname=libxrandr-git
pkgver=1.5.2.r7.g7181160
pkgrel=1
pkgdesc='X11 RandR extension library. Git version.'
arch=('i686' 'x86_64')
license=('custom')
url='http://xorg.freedesktop.org'
depends=('libxext' 'libxrender')
makedepends=('xorg-util-macros' 'xorgproto' 'git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::'git+https://gitlab.freedesktop.org/xorg/lib/libxrandr.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^libXrandr.//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
  cd "$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="${pkgdir}" install

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
