# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=1.0.2
pkgrel=1
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://github.com/flatpak/xdg-desktop-portal"
arch=(x86_64)
license=(LGPL2.1)
depends=(glib2 pipewire fuse2)
makedepends=(python flatpak xmlto docbook-xsl git)
_commit=ad1ed2e260e836df757a4ff775725372fb04e5f4  # tags/1.0.2^0
source=("git+https://github.com/flatpak/xdg-desktop-portal#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  sed -i 's/pipewire-0.1/pipewire-0.2/g' configure.ac
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --libexecdir=/usr/lib --enable-pipewire
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
