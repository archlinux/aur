# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=1.5.3
pkgrel=1
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://github.com/flatpak/xdg-desktop-portal"
arch=(x86_64)
license=(LGPL2.1)
depends=(glib2 pipewire fuse2 geoclue2)
makedepends=(python xmlto docbook-xsl git flatpak libportal)
checkdepends=(epiphany gedit gvfs)
_commit=10f5120f8fa88975885975fa7cc384570969122c  # tags/1.5.3^0
source=("git+https://github.com/flatpak/xdg-desktop-portal#commit=$_commit"
        hack.diff)
sha256sums=('SKIP'
            '9b5097ce035fff9f9bebb6963e509b6597b3d5f0cceda26321cf228d8d59cf5d')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  # Make tests pass
  # https://github.com/flatpak/xdg-desktop-portal/issues/394
  git apply -3 ../hack.diff

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make 
}

check() {
  cd $pkgname
  make check
}

package() {
  depends+=(xdg-desktop-portal-impl)
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
