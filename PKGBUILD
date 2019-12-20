# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=1.6.0
pkgrel=1
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://github.com/flatpak/xdg-desktop-portal"
arch=(x86_64)
license=(LGPL2.1)
depends=(glib2 pipewire fuse2 geoclue2)
makedepends=(python xmlto docbook-xsl git flatpak libportal)
checkdepends=(epiphany gedit gvfs)
_commit=28b93e213a83c78bb6d65d5a1a65c57d62957827  # tags/1.6.0^0
source=("git+https://github.com/flatpak/xdg-desktop-portal#commit=$_commit"
        hack.diff)
sha256sums=('SKIP'
            '949ce781ed3393e05f3bffdd0048aca976e0a35d9babeea9ec9d86ab8a00e871')

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
