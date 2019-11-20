# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=1.5.2
pkgrel=1
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://github.com/flatpak/xdg-desktop-portal"
arch=(x86_64)
license=(LGPL2.1)
depends=(glib2 pipewire fuse2 geoclue2)
makedepends=(python xmlto docbook-xsl git flatpak libportal)
checkdepends=(epiphany gedit)
_commit=5a4e6ed3b4c9322a6e3e79dd10cb881f25e84335  # tags/1.5.2^0
source=("git+https://github.com/flatpak/xdg-desktop-portal#commit=$_commit"
        hack.diff)
sha256sums=('SKIP'
            'dfa41dea8882db18b2e9671118f09626a2cc1d17bafcffa578165cab9d58826c')

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
