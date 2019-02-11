# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Maintainer: tkashkin
# Maintainer: neuromancer
# Contributor: friday (github)
# Contributor: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=gamehub-git
pkgver=0.13.1.1.master.r0.g1f713f3
pkgrel=1
pkgdesc="Games manager, downloader, library that supports GOG, Steam and Humble Bundle. Designed for Pantheon Shell"
arch=(i686 x86_64 armv6h armv7h aarch64)
url="https://github.com/tkashkin/GameHub"
license=(GPL3)
depends=(libgranite.so gtk3 glib2 libgee libsoup json-glib sqlite webkit2gtk libmanette libxtst)
makedepends=(git meson ninja vala)
provides=(gamehub)
conflicts=(gamehub)
options=(!strip debug)
source=("git+${url}.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
  cd "GameHub"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "GameHub"
  CFLAGS="$CFLAGS -O0" meson . build --prefix=/usr -Ddistro=arch --buildtype=debug
  ninja -C build
}

package() {
  cd "GameHub"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -s /usr/bin/com.github.tkashkin.gamehub "$pkgdir/usr/bin/gamehub"
}
