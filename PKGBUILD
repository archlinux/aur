# Maintainer: Adam-Ant <arch@adam-ant.co.uk>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: tkashkin
# Contributor: neuromancer
# Contributor: friday
# Contributor: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=gamehub-epic-git
pkgver=0.16.0.934c717
pkgrel=1
pkgdesc="Games manager, downloader, library that supports GOG, Steam, Epic, itch.io and Humble Bundle"
arch=(i686 x86_64 armv6h armv7h aarch64)
url="https://tkashkin.tk/projects/gamehub/"
license=(GPL3)
depends=(gtk3 glib2 libgee libsoup json-glib sqlite webkit2gtk libmanette libxtst)
makedepends=(git meson ninja vala)
provides=(gamehub)
conflicts=(gamehub gamehub-git)
options=(!strip debug)
source=("git+https://github.com/Lucki/GameHub.git#branch=epic" 0001-New-Steam-libraryfolders-format.patch)
sha256sums=('SKIP'
            '2a73ea08c0d1cce0887c040d4c784a9a806cc4344e8881b818243aee7bd432d0')

pkgver() {
  cd "GameHub"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "GameHub"
  patch --forward --strip=1 --input="${srcdir}/0001-New-Steam-libraryfolders-format.patch"
}

build() {
  cd "GameHub"
  #CFLAGS="$CFLAGS -O0" meson . build --prefix=/usr -Ddistro=arch --buildtype=debug
  meson . build --prefix=/usr -Ddistro=arch --buildtype=debug
  ninja -C build
}

package() {
  cd "GameHub"
  DESTDIR="${pkgdir}" ninja -C build install
}
